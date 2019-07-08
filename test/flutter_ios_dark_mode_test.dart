import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ios_dark_mode/flutter_ios_dark_mode.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_ios_dark_mode');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterIosDarkMode.platformVersion, '42');
  });
}
