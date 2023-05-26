import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/articals/artical.dart';
import 'package:medical_app/ui/screens/articals/show_article.dart';

class ArticalsScreen extends StatelessWidget {
  const ArticalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List image = [
      AssetsManager.a1,
      AssetsManager.a2,
      AssetsManager.a3,
      AssetsManager.a4,
      AssetsManager.a5,
      AssetsManager.a6,
      AssetsManager.a7,
    ];
    List<Article> articles = allArticle;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 25.w, right: 25.w, top: 35.h, bottom: 10.h),
            child: Row(
              children: [
                Text(
                  StringManager.article,
                  style: regularTextStyle(
                    color: ColorManager.darkblack,
                    fontWeight: FontWeight.w700,
                    fontSize: 27.sp,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Padding(
                  padding:
                      EdgeInsets.only(left: 25.w, right: 25.w, bottom: 15.h),
                  child: Container(
                    height: 120.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorManager.bordercolor, width: 1.5),
                      borderRadius: BorderRadius.circular(16.w),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.w),
                            topLeft: Radius.circular(16.w),
                          ),
                          child: Image.asset(
                            image[index],height: 120.h,width: 120.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, left: 10.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 87.h,
                                width: 165.w,
                                // color: Colors.amber,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      article.title.toString(),
                                      style: regularTextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      article.subtitle.toString(),
                                      style: regularTextStyle(fontSize: 13.sp),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 120.w, right: 10.w),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ShowArticle(
                                              link: article.link,
                                              title: article.title),
                                        ),);
                                  },
                                  child: Text(
                                    'More..',
                                    style: TextStyle(
                                      color: ColorManager.darkblue,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
