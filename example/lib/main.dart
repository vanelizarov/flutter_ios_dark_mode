import 'package:flutter/cupertino.dart';
import 'package:flutter_ios_dark_mode/flutter_ios_dark_mode.dart';

void main() async {
  final dark = await FlutterIosDarkMode().darkModeEnabled;
  runApp(App(dark: dark));
}

class App extends StatefulWidget {
  App({this.dark});

  final bool dark;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<bool>(
        stream: FlutterIosDarkMode().onDarkModeStateChanged,
        initialData: widget.dark,
        builder: (context, snapshot) {
          final dark = snapshot.data;

          return CupertinoPageScaffold(
            child: Center(
              child: Text(
                'Dark mode ${snapshot.data ? 'enabled' : 'disabled'}',
                style: TextStyle(color: dark ? CupertinoColors.white : CupertinoColors.black),
              ),
            ),
            backgroundColor: dark ? CupertinoColors.black : CupertinoColors.white,
          );
        },
      ),
    );
  }
}
