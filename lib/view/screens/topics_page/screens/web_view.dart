import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../generated/l10n.dart';

class WebView extends StatefulWidget {
  const WebView({super.key, this.url});
  final String? url;
  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  double _loadingProgress = 0;
  late WebViewController webViewController;
  @override
  void initState() {
    super.initState();
    webViewController = WebViewController();
    webViewController.loadRequest(Uri.parse(widget.url??""));
    webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            _loadingProgress = 0;
          });
        },
        onProgress: (progess) {
          setState(() {
            _loadingProgress = progess / 100;
          });
        },
        onPageFinished: (url) {
          setState(() {
            _loadingProgress = 1;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.appTitle, style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () async {
                    final scaffold = ScaffoldMessenger.of(context);
                    if (await webViewController.canGoBack()) {
                      await webViewController.goBack();
                    } else {
                      scaffold.showSnackBar(
                          SnackBar(content: Text(S.current.noBack),duration: const Duration(seconds: 2)));
                    }
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              IconButton(
                  onPressed: () async {
                    final scaffold = ScaffoldMessenger.of(context);
                    if (await webViewController.canGoForward()) {
                      await webViewController.goForward();
                    } else {
                      scaffold.showSnackBar(
                          SnackBar(content: Text(S.current.noForward), duration: const Duration(seconds: 2),));
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios)),
              IconButton(
                  onPressed: () {
                    webViewController.reload();
                  },
                  icon: const Icon(Icons.replay)),
            ],
          )
        ],
      ),
      body: SafeArea(
          child: Stack(children: [
        WebViewWidget(
          controller: webViewController,
        ),
        _loadingProgress < 1
            ? LinearProgressIndicator(
                value: _loadingProgress,
              )
            : const SizedBox(),
      ])),
    );
  }
}
