# flutter_ios_dark_mode

Flutter plugin for getting iOS 13 Dark Mode current enabled state

## Usage

Add package as depndency to `pubspec.yaml`

```dart
import 'package:flutter_ios_dark_mode/flutter_ios_dark_mode.dart';

// Get current state
final bool darkModeEnabled = await FlutterIosDarkMode().darkModeEnabled;

// or subscribe to changes
FlutterIosDarkMode().onDarkModeStateChanged.listen((bool darkModeEnabled) {
  /* ... */
})
```
