import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supermarket/features/test/add_product_appbar.dart';
import 'package:supermarket/features/test/add_product_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InteractiveVideoScreen extends StatefulWidget {
  final String h5pContentUrl;

  const InteractiveVideoScreen(
      {super.key,
      this.h5pContentUrl =
          "https://aqrabmarket.com/MarketPanel/Market/64/Products"});

  @override
  State<InteractiveVideoScreen> createState() => _InteractiveVideoScreenState();
}

class _InteractiveVideoScreenState extends State<InteractiveVideoScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.h5pContentUrl));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Video'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const AddProductView());
              },
              icon: const Icon(Icons.abc)),
        ],
      ),
      body: Column(
        children: [
          // Your other Flutter widgets here
          SizedBox(
            height: 500, // Set the height as needed
            child: WebViewWidget(
              controller: controller,
              // initialUrl: widget.h5pContentUrl,
              //  javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
          // More of your Flutter widgets
        ],
      ),
    );
  }
}
