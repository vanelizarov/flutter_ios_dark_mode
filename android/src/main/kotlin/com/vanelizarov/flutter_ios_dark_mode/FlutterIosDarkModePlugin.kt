package com.vanelizarov.flutter_ios_dark_mode

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterIosDarkModePlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "com.vanelizarov.flutter_ios_dark_mode/single_check")
      channel.setMethodCallHandler(FlutterIosDarkModePlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "checkDarkModeEnabled") {
      result.success(false)
    } 
  }
}
