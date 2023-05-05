import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';

class CustomTextFeild extends StatelessWidget {
  TextEditingController? controller;
  String? labelText;
  String? hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? Function(dynamic value) validator;
  final bool obscureText;
  CustomTextFeild(
      {super.key,
      this.hintText,
      this.labelText,
      this.controller,
      this.prefixIcon,
      required this.obscureText,
      this.suffixIcon,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      autofocus: false,
      controller: controller,
      decoration: InputDecoration(
        border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.r),
            borderSide: BorderSide(color: ColorManager.bordercolor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.r),
            borderSide: BorderSide(color: ColorManager.bordercolor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.r),
            borderSide: BorderSide(color: ColorManager.bordercolor)),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: regularTextStyle(
          color: ColorManager.settingiconcolor,
          fontSize: 13.sp,
        ),
        labelText: labelText,
        labelStyle: regularTextStyle(
          color: ColorManager.black,
          fontSize: 13.sp,
        ),
      ),
      validator: validator,
    );
  }
}
