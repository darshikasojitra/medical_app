import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/resources.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });
  final Image label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Transform.scale(
              scale: 1.4,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r)),
                     activeColor: ColorManager.darkblue,
                value: value,
                onChanged: (bool? newValue) {
                  onChanged(newValue!);
                },
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: label,
            ),
          ],
        ),
      ),
    );
  }
}
