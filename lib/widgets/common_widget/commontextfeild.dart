import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(dynamic value) validator;
  final bool obscureText;
  const CustomTextFeild(
      {super.key,
      this.hintText,
      this.labelText,
      this.controller,
      this.prefixIcon,
      this.focusNode,
      this.keyboardType,
      required this.obscureText,
      this.suffixIcon,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      autofocus: false,
      keyboardType: keyboardType,
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
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
