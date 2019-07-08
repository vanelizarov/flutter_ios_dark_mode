import Flutter
import UIKit

internal let kNotificationName = "uiStyleChanged"

public class SwiftFlutterIosDarkModePlugin: NSObject, FlutterPlugin {
    var _eventSink: FlutterEventSink?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let methodChannel = FlutterMethodChannel(
            name: "com.vanelizarov.flutter_ios_dark_mode/single_check",
            binaryMessenger: registrar.messenger()
        )

        let eventChannel = FlutterEventChannel(
            name: "com.vanelizarov.flutter_ios_dark_mode/change_stream",
            binaryMessenger: registrar.messenger()
        )
        
        let instance = SwiftFlutterIosDarkModePlugin()
        registrar.addMethodCallDelegate(instance, channel: methodChannel)
        eventChannel.setStreamHandler(instance)
    }
}

extension SwiftFlutterIosDarkModePlugin: FlutterStreamHandler {
    @objc private func onUiStyleChanged(_ notification: Notification) {
        guard let eventSink = _eventSink else { return }
        guard let dark = notification.userInfo?["dark"] as? Bool else { return }
        
        eventSink(NSNumber(value: dark))
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "checkDarkModeEnabled" {
            if #available(iOS 13.0, *) {
                let uiStyle = UITraitCollection.current.userInterfaceStyle
                result(NSNumber(value: uiStyle == .dark))
            } else {
                result(NSNumber(value: false))
            }
        }
    }
    
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        _eventSink = events
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onUiStyleChanged),
            name: Notification.Name(kNotificationName),
            object: nil
        )
        
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        NotificationCenter.default.removeObserver(self)
        _eventSink = nil
        return nil
    }
}

extension FlutterViewController {
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if #available(iOS 13.0, *) {
            let uiStyle = traitCollection.userInterfaceStyle
            NotificationCenter.default.post(
                name: Notification.Name(kNotificationName),
                object: nil,
                userInfo: ["dark": uiStyle == .dark]
            )
        }
    }
}
