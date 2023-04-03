# frozen_string_literal: true

require 'English'
require 'os'
require 'pathname'
require 'fileutils'
require 'plist'

def get_env_variable(key)
  ENV[key].nil? || ENV[key] == '' ? nil : ENV[key]
end

def env_has_key(key)
  !ENV[key].nil? && ENV[key] != '' ? ENV[key] : abort("Missing #{key}.")
end

def run_command(cmd)
  puts "@@[command] #{cmd}"
  output = `#{cmd}`
  raise "Command failed. Check logs for details \n\n #{output}" unless $CHILD_STATUS.success?

  output
end

def upload_dsyms(path)
  dsymfiles = Dir.glob("#{path}/dSYMs/*.dSYM")
  if dsymfiles.count.zero?
    puts 'No debug symbols were found.'
    exit 0
  end
  dsym_folder_path = File.expand_path(File.join(path, 'dSYMs'))
  plist = Plist.parse_xml(File.join(path, 'Info.plist'))
  app_name = File.basename(plist['ApplicationProperties']['ApplicationPath'])
  dsym_name = "#{app_name}.dSYM"
  File.join(dsym_folder_path, dsym_name)
end

def ipa_path
  export_path = ENV['AC_APPCENTER_IPA_PATH']
  if export_path.end_with?('.ipa')
    export_path
  else
    Dir.glob("#{export_path}/*.ipa").first.to_s
  end
end

if `which appcenter`.empty?
  puts 'Installing Appcenter CLI'
  cli_version = get_env_variable('AC_APPCENTER_VERSION')
  cli_version = cli_version.nil? ? '' : "@#{cli_version}"
  run_command("npm install -g appcenter-cli#{cli_version}")
end

token = env_has_key('AC_APPCENTER_TOKEN')
app_name = env_has_key('AC_APPCENTER_APPNAME')
owner = env_has_key('AC_APPCENTER_OWNER')
app = "#{owner}/#{app_name}"
group = get_env_variable('AC_APPCENTER_GROUPS')
release_notes = get_env_variable('AC_APPCENTER_RELEASE_NOTES_PATH')
mandatory = get_env_variable('AC_APPCENTER_MANDATORY')
notify = get_env_variable('AC_APPCENTER_NOTIFY')
store = get_env_variable('AC_APPCENTER_STORE')
extra = get_env_variable('AC_APPCENTER_EXTRA')
puts "Distributing: #{ipa_path}"

cmd = "appcenter distribute release --token #{token} --app #{app} --file #{ipa_path}"
cmd += " --release-notes-file #{release_notes}" if release_notes && File.exist?(release_notes)
cmd += " --group #{group}" if group
cmd += " --store #{store}" if store
cmd += ' --silent' if notify == 'false'
cmd += ' --mandatory' if mandatory == 'true'
cmd += " #{extra}" if extra

result =  run_command(cmd)
puts "Distribution report: \n\n #{result}"

upload_dsym = get_env_variable('AC_APPCENTER_UPLOAD_DSYM')
if upload_dsym == 'true'
  archive_path = get_env_variable('AC_ARCHIVE_PATH')
  dsym_path = upload_dsyms(archive_path)
  puts "Uploading dSYM: #{dsym_path}"
  cmd = "appcenter crashes upload-symbols --symbol #{dsym_path} --token #{token} --app #{app}"
  result = run_command(cmd)
  puts "Upload dSYM report: \n\n #{result}"
end
