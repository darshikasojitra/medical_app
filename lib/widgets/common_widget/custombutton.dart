import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtons extends StatefulWidget {
  double? height;
  Color? color;
  Widget? child;
  double? minWidth;
  void Function() onPressed;
  CustomButtons(
      {super.key,
      this.height,
      this.color,
      this.minWidth,
      this.child,
      required this.onPressed});

  @override
  State<CustomButtons> createState() => _CustomButtonsState();
}

class _CustomButtonsState extends State<CustomButtons> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onPressed,
      height: widget.height,
      minWidth: widget.minWidth,
      color: widget.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
      child: widget.child,
    );
  }
}
