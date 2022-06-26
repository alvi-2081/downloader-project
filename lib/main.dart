import 'package:android_tv_dpad_basic/cursor_move.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.select):
              const ActivateIntent(), // OR could be : ActionIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowUp):
              const DirectionalFocusIntent(TraversalDirection.up,
                  ignoreTextFields: false),
          LogicalKeySet(LogicalKeyboardKey.arrowDown):
              const DirectionalFocusIntent(TraversalDirection.down,
                  ignoreTextFields: false),
          LogicalKeySet(LogicalKeyboardKey.arrowLeft):
              const DirectionalFocusIntent(TraversalDirection.left,
                  ignoreTextFields: false),
          LogicalKeySet(LogicalKeyboardKey.arrowRight):
              const DirectionalFocusIntent(TraversalDirection.right,
                  ignoreTextFields: false),
        },
        child: MaterialApp(
          // shortcuts: <LogicalKeySet, Intent>{
          //   LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
          //   LogicalKeySet(LogicalKeyboardKey.arrowLeft): DirectionalFocusIntent(
          //       TraversalDirection.left,
          //       ignoreTextFields: false),
          //   LogicalKeySet(LogicalKeyboardKey.arrowRight): DirectionalFocusIntent(
          //       TraversalDirection.right,
          //       ignoreTextFields: false),
          //   LogicalKeySet(LogicalKeyboardKey.arrowDown): DirectionalFocusIntent(
          //       TraversalDirection.down,
          //       ignoreTextFields: false),
          //   LogicalKeySet(LogicalKeyboardKey.arrowUp): DirectionalFocusIntent(
          //       TraversalDirection.up,
          //       ignoreTextFields: false),
          // },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Web(),
          // )
        ));
  }
}

// // class MyHomePage extends StatefulWidget {
// //   MyHomePage({Key? key, required this.title}) : super(key: key);
// //   final String title;

// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class LeftIntent extends Intent {}

// // class RightIntent extends Intent {}

// // class UpIntent extends Intent {}

// // class DownIntent extends Intent {}

// // class ActionIntent extends Intent {}

// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;
// //   Intent? _intentId;
// //   String? _actionName;

// //   void _incrementCounter() {
// //     setState(() {
// //       _counter++;
// //     });
// //   }

// //   void _readAction(n, i) {
// //     setState(() {
// //       _intentId = i;
// //       _actionName = n;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Shortcuts(
// //       shortcuts: <LogicalKeySet, Intent>{
// //         LogicalKeySet(LogicalKeyboardKey.select):
// //             const ActivateIntent(), // OR could be : ActionIntent(),
// //         LogicalKeySet(LogicalKeyboardKey.arrowUp): UpIntent(),
// //         LogicalKeySet(LogicalKeyboardKey.arrowDown): DownIntent(),
// //         LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftIntent(),
// //         LogicalKeySet(LogicalKeyboardKey.arrowRight): RightIntent(),
// //       },
// //       child: Actions(
// //         actions: {
// //           LeftIntent: CallbackAction(onInvoke: (Intent i) {
// //             _readAction('LEFT', i);
// //             return null;
// //           }),
// //           RightIntent: CallbackAction(onInvoke: (Intent i) {
// //             _readAction('RIGHT', i);
// //             return null;
// //           }),
// //           UpIntent: CallbackAction(onInvoke: (Intent i) {
// //             _readAction('UP', i);
// //             return null;
// //           }),
// //           DownIntent: CallbackAction(onInvoke: (Intent i) {
// //             _readAction('DOWN', i);
// //             return null;
// //           }),
// //           ActionIntent: CallbackAction(onInvoke: (Intent i) {
// //             _readAction('ACTION', i);
// //             return null;
// //           }),
// //         },
// //         child: Scaffold(
// //           appBar: AppBar(
// //             // Here we take the value from the MyHomePage object that was created by
// //             // the App.build method, and use it to set our appbar title.
// //             title: Text(widget.title),
// //           ),
// //           body: Center(
// //             // Center is a layout widget. It takes a single child and positions it
// //             // in the middle of the parent.
// //             child: Column(
// //               // Column is also a layout widget. It takes a list of children and
// //               // arranges them vertically. By default, it sizes itself to fit its
// //               // children horizontally, and tries to be as tall as its parent.
// //               //
// //               // Invoke "debug painting" (press "p" in the console, choose the
// //               // "Toggle Debug Paint" action from the Flutter Inspector in Android
// //               // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
// //               // to see the wireframe for each widget.
// //               //
// //               // Column has various properties to control how it sizes itself and
// //               // how it positions its children. Here we use mainAxisAlignment to
// //               // center the children vertically; the main axis here is the vertical
// //               // axis because Columns are vertical (the cross axis would be
// //               // horizontal).
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: <Widget>[
// //                 Text(
// //                   'Use the Android remote control',
// //                 ),
// //                 Text(
// //                   'The value of the latest button is ($_intentId) :',
// //                 ),
// //                 Text(
// //                   '$_actionName',
// //                   style: Theme.of(context).textTheme.headline4,
// //                 ),
// //                 Text(
// //                   '\nYou have pushed the button this many times:',
// //                 ),
// //                 Text(
// //                   '$_counter',
// //                   style: Theme.of(context).textTheme.headline4,
// //                 ),
// //               ],
// //             ),
// //           ),
// //           floatingActionButton: FloatingActionButton(
// //             onPressed: _incrementCounter,
// //             tooltip: 'Increment',
// //             child: Icon(Icons.add),
// //           ), // This trailing comma makes auto-formatting nicer for build methods.
// //         ),
// //       ),
// //     );
// //   }
// // }





// import 'dart:async';
// import 'dart:io';

// import 'package:android_tv_dpad_basic/chrome_safari_browser_example.screen.dart';
// import 'package:android_tv_dpad_basic/headless_in_app_webview.screen.dart';
// import 'package:android_tv_dpad_basic/in_app_browser_example.screen.dart';
// import 'package:android_tv_dpad_basic/in_app_webiew_example.screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// // import 'package:path_provider/path_provider.dart';
// // import 'package:permission_handler/permission_handler.dart';

// // InAppLocalhostServer localhostServer = new InAppLocalhostServer();

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Permission.camera.request();
//   // await Permission.microphone.request();
//   // await Permission.storage.request();

//   if (Platform.isAndroid) {
//     await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

//     var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
//         AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
//     var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
//         AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

//     if (swAvailable && swInterceptAvailable) {
//       AndroidServiceWorkerController serviceWorkerController =
//           AndroidServiceWorkerController.instance();

//       await serviceWorkerController
//           .setServiceWorkerClient(AndroidServiceWorkerClient(
//         shouldInterceptRequest: (request) async {
//           print(request);
//           return null;
//         },
//       ));
//     }
//   }

//   runApp(MyApp());
// }

// Drawer myDrawer({required BuildContext context}) {
//   return Drawer(
//     child: ListView(
//       padding: EdgeInsets.zero,
//       children: <Widget>[
//         DrawerHeader(
//           child: Text('flutter_inappbrowser example'),
//           decoration: BoxDecoration(
//             color: Colors.blue,
//           ),
//         ),
//         ListTile(
//           title: Text('InAppBrowser'),
//           onTap: () {
//             Navigator.pushReplacementNamed(context, '/InAppBrowser');
//           },
//         ),
//         ListTile(
//           title: Text('ChromeSafariBrowser'),
//           onTap: () {
//             Navigator.pushReplacementNamed(context, '/ChromeSafariBrowser');
//           },
//         ),
//         ListTile(
//           title: Text('InAppWebView'),
//           onTap: () {
//             Navigator.pushReplacementNamed(context, '/');
//           },
//         ),
//         ListTile(
//           title: Text('HeadlessInAppWebView'),
//           onTap: () {
//             Navigator.pushReplacementNamed(context, '/HeadlessInAppWebView');
//           },
//         ),
//       ],
//     ),
//   );
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(initialRoute: '/', routes: {
//       '/': (context) => InAppWebViewExampleScreen(),
//       '/InAppBrowser': (context) => InAppBrowserExampleScreen(),
//       '/ChromeSafariBrowser': (context) => ChromeSafariBrowserExampleScreen(),
//       '/HeadlessInAppWebView': (context) => HeadlessInAppWebViewExampleScreen(),
//     });
//   }
// }
