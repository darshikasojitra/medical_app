import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/responses/language.dart';

class ServiceUtils {
  static showErrorMsg(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade600,
      elevation: 0,
      duration: const Duration(seconds: 2),
    ));
  }

  static showSuccessMsg(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
      ),
      backgroundColor: Colors.black,
      elevation: 0,
      duration: const Duration(seconds: 2),
    ),);
  }

  // languageList for Localization
  static List<Language> languageList = [
    Language(
        name: 'English',
        langCode: 'en',
        image: AssetsManager.english,
        isChecked: true),
    Language(
        name: 'Arabic',
        langCode: 'ar',
        image: AssetsManager.arabic,
        isChecked: false)
  ];

  getHeaderWithBackArrowAndTitle(BuildContext context, String title,
      void Function() onBackClick, String lngCode) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onBackClick,
          child: SizedBox(
            height: 21.h,
            width: 27.w,
            child: Icon(
              Icons.arrow_back,
              size: 25.sp,
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          title,
          textAlign: TextAlign.left,
          overflow: TextOverflow.visible,
          style: TextStyle(fontSize: 18.sp, color: ColorManager.black),
        ),
      ],
    );
  }
}
