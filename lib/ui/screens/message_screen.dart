import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/assets_manager.dart';

class MessageScreen extends StatefulWidget {
  static const String id = 'MessageScreen';
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE4E9F1),
      body: Column(
        children: [
          _doctorProfile(context),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.h),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 75.h,
                          width: 235.w,
                          decoration: BoxDecoration(
                              color: Color(0xff1C6BA4),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.r),
                                  topRight: Radius.circular(16.r),
                                  bottomLeft: Radius.circular(16.r))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 19.w, right: 38.w, bottom: 15.h, top: 17.h),
                            child: Text(
                              'Hi shah, Can You tell me your problem?',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'NunitoSans'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 100.w, right: 140.w, top: 5.h),
                        child: Text(
                          'Thu 09:10 AM',
                          style: TextStyle(
                              color: Color.fromRGBO(25, 52, 105, 0.6),
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'NunitoSans'),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(AssetsManager.profileimage),
                          SizedBox(
                            width: 12.w,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 72.h,
                              width: 235.w,
                              decoration: BoxDecoration(
                                  color: Color(0xffFAF0DB),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(16.r),
                                      topRight: Radius.circular(16.r),
                                      bottomLeft: Radius.circular(16.r))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 19.w,
                                    right: 38.w,
                                    bottom: 15.h,
                                    top: 17.h),
                                child: Text(
                                  'Sure I am suffering from skin allergies.',
                                  style: TextStyle(
                                      color: Color(0xff193469),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'NunitoSans'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 75.h,
                          width: 235.w,
                          decoration: BoxDecoration(
                              color: Color(0xff1C6BA4),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.r),
                                  topRight: Radius.circular(16.r),
                                  bottomLeft: Radius.circular(16.r))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 19.w, right: 38.w, bottom: 15.h, top: 17.h),
                            child: Text(
                              'Can You Send a Photo of your skin?',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'NunitoSans'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 100.w, right: 140.w, top: 5.h),
                        child: Text(
                          'Thu 09:15 AM',
                          style: TextStyle(
                              color: Color.fromRGBO(25, 52, 105, 0.6),
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'NunitoSans'),
                        ),
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(AssetsManager.profileimage),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 55.h,
                                  width: 133.w,
                                  decoration: BoxDecoration(
                                      color: Color(0xffFAF0DB),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(16.r),
                                          topRight: Radius.circular(16.r),
                                          bottomLeft: Radius.circular(16.r))),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 19.w,
                                        right: 28.w,
                                        bottom: 15.h,
                                        top: 17.h),
                                    child: Text(
                                      "Yes Here it's",
                                      style: TextStyle(
                                          color: Color(0xff193469),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'NunitoSans'),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Image.asset(AssetsManager.skinimage),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 480.h,),
                    child: _sendmessage,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _doctorProfile(BuildContext context) => Container(
      height: 130.h,
      width: 450.w,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.r),
            bottomRight: Radius.circular(24.r)),
        boxShadow: const [
          BoxShadow(
            blurRadius: 7.0,
            spreadRadius: 7,
            offset: Offset(0, 2),
            color: Color.fromRGBO(107, 134, 179, 0.25),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, top: 25.h),
        child: Row(
          children: [
            Image.asset(
              AssetsManager.detailscreendrimage,
              height: 44.h,
              width: 44.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 35.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Mim Akhter',
                    style: TextStyle(
                        color: Color(0xff0E1012),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NunitoSans'),
                  ),
                  Row(
                    children: [
                      Text(
                        'Active Now',
                        style: TextStyle(
                            color: Color(0xff4A545E),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'NunitoSans'),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        height: 7.h,
                        width: 7.w,
                        decoration: BoxDecoration(
                            color: Color(0xff27AE60),
                            borderRadius: BorderRadius.circular(7.r)),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 130.w,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(AssetsManager.crossimage))
          ],
        ),
      ),
    );

Widget _sendmessage = Container(
  height: 50.h,
  width: 300.w,
  child: TextFormField(
    //controller: _controller,
    decoration: InputDecoration(
      filled: true,
      fillColor: Color(0xffFFFFFF),
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Image.asset(
          AssetsManager.linkdataimage,
        ),
      ),
      suffixIcon: Padding(
        padding: EdgeInsets.only(right: 10.w),
        child: Image.asset(AssetsManager.sendimage),
      ),
      hintText: 'Write here..',
      hintStyle: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'NunitoSans',
          color: Color.fromRGBO(25, 52, 105, 0.6)),
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.25)),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.25))),
    ),
  ),
);
