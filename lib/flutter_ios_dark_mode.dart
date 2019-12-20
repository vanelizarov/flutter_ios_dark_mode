import 'dart:async';

import 'package:flutter/services.dart';

class FlutterIosDarkMode {
  factory FlutterIosDarkMode() {
    if (_instance == null) {
      final MethodChannel methodChannel = const MethodChannel(
          'com.vanelizarov.flutter_ios_dark_mode/single_check');
      final EventChannel eventChannel = const EventChannel(
          'com.vanelizarov.flutter_ios_dark_mode/change_stream');
      _instance = FlutterIosDarkMode._(methodChannel, eventChannel);
    }
    return _instance;
  }

  FlutterIosDarkMode._(this._methodChannel, this._eventChannel);

  static FlutterIosDarkMode _instance;

  final MethodChannel _methodChannel;
  final EventChannel _eventChannel;

  Stream<bool> _onDarkModeStateChanged;

  Stream<bool> get onDarkModeStateChanged {
    if (_onDarkModeStateChanged == null) {
      _onDarkModeStateChanged = _eventChannel
          .receiveBroadcastStream()
          .map<bool>((enabled) => enabled);
    }

    return _onDarkModeStateChanged;
  }

  Future<bool> get darkModeEnabled => _methodChannel
      .invokeMethod('checkDarkModeEnabled')
      .then<bool>((enabled) => enabled)
      .catchError((onError) => false);
}
