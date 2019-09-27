# flutter_ios_dark_mode

[![pub package](https://img.shields.io/pub/v/flutter_ios_dark_mode.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_ios_dark_mode)

Flutter plugin for getting iOS 13 Dark Mode current enabled state

## Usage

Add package as dependency to `pubspec.yaml`

```yaml
# pubspec.yaml

dependencies:
  flutter_ios_dark_mode: ^0.0.1
```

Then you can get current state immediately or subscribe to changes

```dart
import 'package:flutter_ios_dark_mode/flutter_ios_dark_mode.dart';

// Get current state
final bool darkModeEnabled = await FlutterIosDarkMode().darkModeEnabled;

// or subscribe to changes
FlutterIosDarkMode().onDarkModeStateChanged.listen((bool darkModeEnabled) {
  /* ... */
})
```
