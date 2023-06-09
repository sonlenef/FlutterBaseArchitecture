# Flutter Base Architecture

A Base Flutter Architecture.

## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Build dependencies injection

```
flutter packages pub run build_runner build
```

## Usage

Build with flavor

- Development environment (Default)

```
flutter run --dart-define=env=dev
```

- Production environment

```
flutter run --dart-define=env=prod
```

- Staging environment

```
flutter run --dart-define=env=stag
```

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/res/localization` directory.

```
flutter gen-l10n
```

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
