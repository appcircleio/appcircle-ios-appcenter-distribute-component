# Appcircle _App Center Distribute_ component

Distribute IPA and dSYM files to App Center.

## Required Inputs

- `AC_APPCENTER_TOKEN`: API Token. Appcenter API Token.
- `AC_APPCENTER_IPA_PATH`: IPA Path. Full path of the build. You may enter the exact path of the IPA or the parent folder.
- `AC_APPCENTER_OWNER`: Owner Name. Owner of the app. The app's owner can be identified in its URL, such as https://appcenter.ms/users/JohnDoe/apps/myapp for a user-owned app (where **JohnDoe** is the owner) and https://appcenter.ms/orgs/Appcircle/apps/myapp for an org-owned app (owner is **Appcircle**).
- `AC_APPCENTER_APPNAME`: App Name. The name of the app. The app's name can be identified in its URL, such as https://appcenter.ms/users/JohnDoe/apps/myapp for a user-owned app (where **myapp** is the app name) and https://appcenter.ms/orgs/Appcircle/apps/myapp for an org-owned app (owner is **myapp**).

## Optional Inputs

- `AC_APPCENTER_GROUPS`: Group Names. Comma-separated distribution group names
- `AC_APPCENTER_STORE`: Store name. Name of the store(App Store, Google Play, Intune)
- `AC_APPCENTER_RELEASE_NOTES_PATH`: Release Notes. If you use `Publish Release Notes` component before this step, release-notes.txt will be used as release notes.
- `AC_APPCENTER_UPLOAD_DSYM`: Upload dSYM. Upload debug symbols.
- `AC_APPCENTER_MANDATORY`: Mandatory Update. This parameter specifies whether the update should be considered mandatory or not.
- `AC_APPCENTER_NOTIFY`: Notify Testers. Notify testers of this release
