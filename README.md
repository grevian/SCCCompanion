# Sault Cycling Club Companion App

A flutter application for members, riders, and ride leaders

This application provides helpful information for group rides, including pre-ride checklists for both riders and ride leaders, links to maps and other club resources, and tools to support ride leaders before, during, and after rides.

## Getting Started

Available on the play store [here](https://play.google.com/store/apps/details?id=ca.saultcyclingclug.fluttersccapp) (If you're in the internal/alpha/beta groups, for now)

### Building the application

If you want to build a signed APK, you will require the [Google Cloud SDK to be installed](https://cloud.google.com/sdk/install), and to be logged into a google account on the `saultcyclingclub.ca` domain, with the `scc-companion-app` project selected, in order to access either the cloud builder, or encryption keys protecting our keystore.

```
gcloud auth login <your-name>@saultcyclingclub.ca
gcloud config set project scc-companion-app
```

#### Building the application locally for development/sideloading
* Build the application `flutter build apk --debug`

#### Submit a cloud build of the application (Recommended)
* Bump the version strings in android/app/src/build.gradle around line 37
* Submit the project to Google Cloud Build where it will be built, signed, and stored in a Cloud Storage Bucket
* `gcloud builds submit --config cloudbuild.yaml .`
* Resulting signed APK will be in the [scc-build-output storage bucket](https://console.cloud.google.com/storage/browser/scc-build-output?project=scc-companion-app)

#### Building the application locally for release
* Bump the version strings in android/app/src/build.gradle around line 37
* Decrypt the keystore and keystore properties
  * `gcloud kms decrypt --ciphertext-file=android/key.jks.enc --plaintext-file=android/key.jks --location=global --keyring=github-keyring --key=android-key`
  * `gcloud kms decrypt --ciphertext-file=android/keystore.properties.enc --plaintext-file=android/keystore.properties --location=global --keyring=github-keyring --key=android-key`
* Build and sign the application `flutter build apk --release`
* __Don't be careless with the decrypted keystore!__

#### Rebuild Application Icons:
* Replace `assets/icon/icon.png`
* `flutter packages pub run flutter_launcher_icons:main`
* See [flutter_launcher_icons](https://pub.dartlang.org/packages/flutter_launcher_icons) for more details

#### Development Firebase Authorization

To authorize against firebase, you must add your SHA1/SHA256 key fingerprints under the app settings, the release key's fingerprints have already been added but if developing locally you must add your local development key fingerprint. Collect the key as [described here](https://developers.google.com/android/guides/client-auth), and add it to the [Firebase dashboard](https://console.firebase.google.com/u/1/project/scc-companion-app/settings/general/android:ca.saultcyclingclug.fluttersccapp) for this app

#### Release Management
Releases can be managed at the [Google Play Publisher Dashboard](https://play.google.com/apps/publish)
