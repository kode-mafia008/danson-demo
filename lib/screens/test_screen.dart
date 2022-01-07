import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TestScreen extends StatefulWidget {
  static const String id = 'test-screen';
  final String? url;
  const TestScreen({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late WebViewController controller;
  late String? url;
  @override
  void initState() {
    url = widget.url;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Screen'),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
        onPageStarted: (url) {
          print('Page started loading: $url');
        },
        onWebViewCreated: (controller) {
          this.controller = controller;
          setState(() {});
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            controller.loadUrl(url!);
          },
          child: Icon(Icons.add)),
    );
  }
}
