import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtons extends StatefulWidget {
  double? height;
  Color? color;
  Text? text;
   CustomButtons({super.key,this.height,this.color,this.text});

  @override
  State<CustomButtons> createState() => _CustomButtonsState();
}

class _CustomButtonsState extends State<CustomButtons> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineSearchScreen(),));
      },
      height: widget.height,
      minWidth: double.infinity,
      color: widget.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
      child: Text(
      'book now',
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15.sp,
            color: Color(0xffFFFFFF),
            fontFamily: 'NunitoSans'),
      ),
    );
  }
}
