import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:hotelapp/common/appbar.dart';

class Agreement extends StatelessWidget {
  //WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalappbar,
      body: WebView(
        initialUrl: 'https://google.com',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          //_controller = controller;
        },
      ),
    );
  }
}
