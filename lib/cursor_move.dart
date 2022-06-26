import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web extends StatefulWidget {
  const Web({Key? key}) : super(key: key);

  @override
  State<Web> createState() => _WebState();
}

class _WebState extends State<Web> {
  late WebViewController _webViewController;

  int posX = 325;
  int posY = 300;
  bool topScrollBar = false;
  bool botttomScrollBar = false;

  handleKey(RawKeyEvent key, BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (key.runtimeType.toString() == 'RawKeyDownEvent') {
      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
      String _keyCode;
      _keyCode = data.keyCode.toString();

      context.visitChildElements((element) {
        print(element.widget.key);
      });

      switch (_keyCode) {
        case '19': //up
          setState(() {
            posY -= 5;
            if (posY < 0) {
              posY = 0;
            }
          });
          break;
        case '22': //right
          setState(() {
            posX += 5;
            if (posX > width) {
              posX = width.toInt();
            }
          });
          break;
        case '20': //down
          setState(() {
            posY += 5;
            if (posY > height) {
              posY = height.toInt();
            }
          });
          break;
        case '21': //left
          setState(() {
            posX -= 5;
            if (posX < 0) {
              posX = 0;
            }
          });
          break;
        case '23': //OK
          _webViewController.runJavascript("""            
            var cb = document.elementFromPoint($posX,$posY);
            cb.click();
            cb.focus(); 
            """);
          break;
      }
    }

    if (posY < 5) {
      setState(() {
        topScrollBar = true;
      });
      _webViewController.scrollBy(0, -20);
    } else if (posY > height - 5) {
      setState(() {
        botttomScrollBar = true;
      });
      _webViewController.scrollBy(0, 20);
    } else {
      setState(() {
        topScrollBar = false;
        botttomScrollBar = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          RawKeyboardListener(
            focusNode: new FocusNode(),
            onKey: (key) => handleKey(key, context),
            child: WebView(
              initialUrl: 'https://firestickhacks.com/file/hulu',
              javascriptMode: JavascriptMode.unrestricted,
              initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
              onWebViewCreated: (WebViewController webViewController) {
                _webViewController = webViewController;
              },
              userAgent:
                  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36",
            ),
          ),
          Visibility(
            visible: topScrollBar,
            child: Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 25,
                child: Center(
                  child: Icon(Icons.keyboard_arrow_up),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.5),
                      Colors.white.withOpacity(0.5)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: botttomScrollBar,
            child: Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 25,
                child: Center(
                  child: Icon(Icons.keyboard_arrow_down),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.5),
                      Colors.white.withOpacity(0.5)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  border: Border(
                    top: BorderSide(
                      color: Colors.black.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: posX.toDouble(),
              top: posY.toDouble(),
              child: Image.asset(
                'assets/cursor.png',
                width: 18,
                height: 18,
              ))
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
