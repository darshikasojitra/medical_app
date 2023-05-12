import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';

class CommonDropDown extends StatelessWidget {
  final String? value;
  final Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  const CommonDropDown({super.key, this.value, this.onChanged, this.items});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
          value: value,
          icon: Padding(
            padding: EdgeInsets.only(left: 75.w),
            child: Image.asset(AssetsManager.detailscreenarrow),
          ),
          elevation: 0,
          style: regularTextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15.sp,
            color: ColorManager.darkblack,
          ),
          onChanged: onChanged,
          items: items),
    );
  }
}
