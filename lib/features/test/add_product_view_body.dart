import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class AddProductViewBody extends StatelessWidget {
  AddProductViewBody({Key? key}) : super(key: key);
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
    ..loadRequest(Uri.parse(
        "https://aqrabmarket.com/MarketPanel/Market/64/CreateProduct"));
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: controller,
      //  initialUrl:
      //   "https://aqrabmarket.com/MarketPanel/Market/${AppStorage.getUserData.storeId}/CreateProduct",
      //  "https://aqrabmarket.com/MarketPanel/Market/${AppStorage.getUserData.storeId}/Products",
      //  javascriptMode: JavascriptMode.unrestricted,
    );
  }
}

/*SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Column(
          children: [
            ChooseSectionDropdown(
              selectedItemGovernorate: 0,
              selectedItemCity: 0,
              //selectedItemArea: 0,
              governorateFun: (value) {
                cubit.gid = value.id!;
              },
              citieFun: (value) {
                cubit.cid = value.id!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'المنتجات بالقسم',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const CustomAddProductItem(),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 5),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomButton(
                  fontSize: 14.sp, text: 'حفظ البيانات', onPress: () {}),
            ),
          ],
        ),
      ),
    );
  */