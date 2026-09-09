# DEPRECATED

[![No Maintenance Intended](https://unmaintained.tech/badge.svg)](https://unmaintained.tech/)

> ⛔️ **DEPRECATED - this component is no longer maintained.**
>
> Microsoft retired Visual Studio App Center on 31 March 2025, so this component can no longer
> reach a live service. The repository stays online for historical reference only: it receives no
> updates, no bug fixes and no security patches, and issues and pull requests are not reviewed.
>
> **Use [Appcircle Testing Distribution](https://docs.appcircle.io/testing-distribution/) instead.**

## What to use instead

- **Sharing builds with testers** - [Appcircle Testing Distribution](https://docs.appcircle.io/testing-distribution/)
- **Publishing to the App Store** - [Appcircle Publish Module](https://docs.appcircle.io/publish-module/)

Both are built into Appcircle, so no additional component is required.

## No warranty

This code is provided as is, with no warranty and no support. See [LICENSE](./LICENSE) for the full
disclaimer. Using it against any remaining App Center endpoint is entirely at your own risk.

---

## Archived documentation

Everything below describes the component as it was at the time of deprecation. It is kept for
reference only and is not maintained.

### Appcircle _App Center iOS Distribute_ component

Distribute IPA and dSYM files to App Center.

#### Required Inputs

- `AC_APPCENTER_TOKEN`: API Token. Appcenter API Token.
- `AC_APPCENTER_IPA_PATH`: IPA Path. Full path of the build. You may enter the exact path of the IPA or the parent folder.
- `AC_APPCENTER_OWNER`: Owner Name. Owner of the app. The app's owner can be identified in its URL, such as `https://appcenter.ms/users/JohnDoe/apps/myapp` for a user-owned app (where **JohnDoe** is the owner) and `https://appcenter.ms/orgs/Appcircle/apps/myapp` for an org-owned app (owner is **Appcircle**).
- `AC_APPCENTER_APPNAME`: App Name. The name of the app. The app's name can be identified in its URL, such as `https://appcenter.ms/users/JohnDoe/apps/myapp` for a user-owned app (where **myapp** is the app name) and `https://appcenter.ms/orgs/Appcircle/apps/myapp` for an org-owned app (owner is **myapp**).

#### Optional Inputs

- `AC_APPCENTER_GROUPS`: Group Names. Comma-separated distribution group names
- `AC_APPCENTER_STORE`: Store name. Name of the store(App Store, Google Play, Intune)
- `AC_APPCENTER_RELEASE_NOTES_PATH`: Release Notes. If you use `Publish Release Notes` component before this step, release-notes.txt will be used as release notes.
- `AC_APPCENTER_UPLOAD_DSYM`: Upload dSYM. Upload debug symbols.
- `AC_APPCENTER_MANDATORY`: Mandatory Update. This parameter specifies whether the update should be considered mandatory or not.
- `AC_APPCENTER_NOTIFY`: Notify Testers. Notify testers of this release.
- `AC_APPCENTER_VERSION`: App Center CLI Version. Latest version will be used if no version is set.
- `AC_APPCENTER_EXTRA`: Extra arguments. Extra command line arguments for appcenter. For example add  --debug for verbose logs.
