import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final Function(String)? onChanged;
  final String? hintText;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(dynamic value) validator;
  final bool obscureText;
  final int? maxLines;
  const CustomTextFeild(
      {super.key,
      this.hintText,
      this.labelText,
      this.onChanged,
      this.controller,
      this.initialValue,
      this.prefixIcon,
      this.focusNode,
      this.maxLines,
      this.keyboardType,
      required this.obscureText,
      this.suffixIcon,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      obscureText: obscureText,
      initialValue: initialValue,
      autofocus: false,
      keyboardType: keyboardType,
      focusNode: focusNode,
      maxLines: maxLines,
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
