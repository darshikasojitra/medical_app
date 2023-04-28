import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';

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
      backgroundColor: ColorManager.bgcolor,
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
                              color: ColorManager.darkblue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.r),
                                  topRight: Radius.circular(16.r),
                                  bottomLeft: Radius.circular(16.r))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 19.w,
                                right: 38.w,
                                bottom: 15.h,
                                top: 17.h),
                            child: Text(
                              StringManager.hishah,
                              style: regularTextStyle(
                                color: ColorManager.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 100.w, right: 140.w, top: 5.h),
                        child: Text(
                          StringManager.thu9_10AM,
                          style: regularTextStyle(
                            color: ColorManager.thucolor,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                          ),
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
                                  color: ColorManager.lightyellow,
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
                                  StringManager.sureiam,
                                  style: regularTextStyle(
                                    color: ColorManager.textcolor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                              color: ColorManager.darkblue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.r),
                                  topRight: Radius.circular(16.r),
                                  bottomLeft: Radius.circular(16.r))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 19.w,
                                right: 38.w,
                                bottom: 15.h,
                                top: 17.h),
                            child: Text(
                              StringManager.canyou,
                              style: regularTextStyle(
                                color: ColorManager.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 100.w, right: 140.w, top: 5.h),
                        child: Text(
                          StringManager.thu9_15AM,
                          style: regularTextStyle(
                            color: ColorManager.thucolor,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                          ),
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
                                      color: ColorManager.lightyellow,
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
                                      StringManager.yeshereit,
                                      style: regularTextStyle(
                                        color: ColorManager.textcolor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
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
                    padding: EdgeInsets.only(
                      top: 480.h,
                    ),
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
        color: ColorManager.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.r),
            bottomRight: Radius.circular(24.r)),
        boxShadow:  [
          BoxShadow(
            blurRadius: 7.0,
            spreadRadius: 7,
            offset: Offset(0, 2),
            color: ColorManager.shadowcolor,
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
                    StringManager.drmim,
                    style: regularTextStyle(
                      color: ColorManager.darkblack,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        StringManager.activenow,
                        style: TextStyle(
                            color: ColorManager.settingiconcolor,
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
                            color: ColorManager.green,
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
      fillColor: ColorManager.white,
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
      hintText: StringManager.writehere,
      hintStyle: regularTextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
          color: ColorManager.thucolor),
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: ColorManager.textfeildbordercolor),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorManager.textfeildbordercolor)),
    ),
  ),
);
