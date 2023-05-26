import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowArticle extends StatefulWidget {
  final String? link;
  final String? title;
  const ShowArticle({super.key, this.link, this.title});

  @override
  State<ShowArticle> createState() => _ShowArticleState();
}

class _ShowArticleState extends State<ShowArticle> {
  WebViewController controller = WebViewController();
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.link.toString()),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.darkblue,
        title: Text(widget.title.toString(),style: regularTextStyle(fontSize: 17.sp,color: ColorManager.white),),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
