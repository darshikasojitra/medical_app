import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/assets_manager.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'ProfileScreen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List _icons = [
    Icon(
      Icons.settings_sharp,
      color: Color(0xff4A545E),
      size: 25.sp,
    ),
    Icon(
      Icons.privacy_tip,
      color: Color(0xff4A545E),
      size: 25.sp,
    ),
    Icon(
      Icons.payment_sharp,
      color: Color(0xff4A545E),
      size: 25.sp,
    ),
    Icon(
      Icons.payment,
      color: Color(0xff4A545E),
      size: 25.sp,
    )
  ];
  final List _textlist = [
    'Account Settings',
    'Privacy Policy ',
    'Payment Settings',
    'Payment Settings'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C6BA4),
      body: Padding(
        padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 55.h),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    color: Color(0xff1C6BA4),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xffD7DEEA))),
                child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      AssetsManager.arrowimage,
                      color: Color(0xffFFFFFF),
                    )),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset(AssetsManager.profilepageimage),
                  Text(
                    'Shahin Alam',
                    style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffFFFFFF)),
                  ),
                  Text(
                    'Ui Designer',
                    style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFFFFFF)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Column(
              children: [
                Container(
                  height: 350.h,
                  width: 335.w,
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: Container(
                            height: 55.h,
                            width: 335.w,
                            decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Row(
                                children: [
                                  _icons[index],
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    _textlist[index],
                                    style: TextStyle(
                                        fontFamily: 'NunitoSans',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff0E1012)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 90.w, top: 35.h),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Color(0xffBECADA),
                        size: 28,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Log Out',
                        style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffBECADA)),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
