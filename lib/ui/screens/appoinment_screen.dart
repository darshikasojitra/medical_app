import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/ui/screens/makeappoinement_screen.dart';

import '../../resources/assets_manager.dart';

class AppoinmentScreen extends StatefulWidget {
  static const String id = 'AppoinmentScreen';
  const AppoinmentScreen({super.key});

  @override
  State<AppoinmentScreen> createState() => _AppoinmentScreenState();
}

class _AppoinmentScreenState extends State<AppoinmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 40.h),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Color(0xffD7DEEA))),
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(AssetsManager.arrowimage)),
                ),
                SizedBox(
                  width: 200.w,
                ),
                Text(
                  '\$',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'NunitoSans',
                      color: Color(0xff0C1115)),
                ),
                Text(
                  '12',
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'NunitoSans',
                      color: Color(0xff0C1115)),
                ),
                Text(
                  '/Ap.',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'NunitoSans',
                      color: Color(0xff0C1115)),
                )
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Image.asset(AssetsManager.drmim),
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                Text(
                  'Dr. Mim Akhter',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19.sp,
                      color: Color(0xff0E1012),
                      fontFamily: 'NunitoSans'),
                ),
                Text(
                  'Cardiologist in apolo hospital',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Color(0xff4A545E),
                      fontFamily: 'NunitoSans'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 90.w, top: 7.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(AssetsManager.starimage),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp,
                            color: Color(0xff0E1012),
                            fontFamily: 'NunitoSans'),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '(17 reviews)',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            color: Color(0xff4A545E),
                            fontFamily: 'NunitoSans'),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            TextFormField(
              maxLines: 7,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffD7DEEA),
                hintText: 'Write your symptoms..',
                hintStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'NunitoSans',
                    color: Color(0xff7B8D9E)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(color: Color(0xffEEF6FC)),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide(color: Color(0xffEEF6FC))),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 70.h,
              width: 300.w,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                border: Border.all(color: Color(0xffD7DEEA)),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 20.w),
                    child: Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: Color(0xffDCEDF9),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Image.asset(AssetsManager.detailscreenclock),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Schedule',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Color(0xff7B8D9E),
                            fontFamily: 'NunitoSans'),
                      ),
                      Text(
                        '6 PM - 9 PM',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp,
                            color: Color(0xff0E1012),
                            fontFamily: 'NunitoSans'),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 100.w,
                  ),
                  Image.asset(AssetsManager.detailscreenarrow)
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MakeAppoinmentScreen(),
                    ));
              },
              height: 46.h,
              minWidth: double.infinity,
              color: Color(0xff1C6BA4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r)),
              child: Text(
                'Book Now',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                    color: Color(0xffFFFFFF),
                    fontFamily: 'NunitoSans'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
