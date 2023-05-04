import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';

class MessageScreen extends StatefulWidget {
  static const String id = 'MessageScreen';
  final Image populardoctorimage;
  final String doctorname;
  const MessageScreen(
      {super.key, required this.populardoctorimage, required this.doctorname});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _doctorProfile(
                context, widget.populardoctorimage, widget.doctorname),
            buildSizedBoxSpacer(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 500.h,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _chat,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _sendmessage
          ],
        ),
      ),
    );
  }
}

Widget _doctorProfile(BuildContext context, populardoctorimage, doctorname) =>
    Container(
      height: 120.h,
      width: 450.w,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.r),
            bottomRight: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            blurRadius: 7.0,
            spreadRadius: 7,
            offset: const Offset(0, 2),
            color: ColorManager.shadowcolor,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, top: 25.h),
        child: Row(
          children: [
            Container(
                height: 44.h,
                width: 40.w,
                decoration:
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r)),
                child: populardoctorimage),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorname,
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
                        style: regularTextStyle(
                          color: ColorManager.settingiconcolor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      buildSizedBoxSpacer(
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
            Padding(
              padding: EdgeInsets.only(left: 150.w, right: 10.w),
              child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    AssetsManager.crossimage,
                  )),
            )
          ],
        ),
      ),
    );

Widget _chat = Column(
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
          padding:
              EdgeInsets.only(left: 19.w, right: 38.w, bottom: 15.h, top: 17.h),
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
      padding: EdgeInsets.only(left: 100.w, right: 140.w, top: 5.h),
      child: Text(
        StringManager.thu9_10AM,
        style: regularTextStyle(
          color: ColorManager.thucolor,
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    buildSizedBoxSpacer(
      height: 20.h,
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AssetsManager.profileimage),
        buildSizedBoxSpacer(
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
                  left: 19.w, right: 38.w, bottom: 15.h, top: 17.h),
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
    buildSizedBoxSpacer(
      height: 22.h,
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
          padding:
              EdgeInsets.only(left: 19.w, right: 38.w, bottom: 15.h, top: 20.h),
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
      padding: EdgeInsets.only(left: 100.w, right: 140.w, top: 5.h),
      child: Text(
        StringManager.thu9_15AM,
        style: regularTextStyle(
          color: ColorManager.thucolor,
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    buildSizedBoxSpacer(
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
                      left: 19.w, right: 28.w, bottom: 15.h, top: 17.h),
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
            buildSizedBoxSpacer(
              height: 15.h,
            ),
            Image.asset(AssetsManager.skinimage),
          ],
        ),
      ],
    ),
  ],
);

Widget _sendmessage = Container(
  padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 5.h),
  height: 50.h,
  width: 340.w,
  child: TextFormField(
    //controller: _controller,
    decoration: InputDecoration(
      filled: true,
      fillColor: ColorManager.white,
      //contentPadding: EdgeInsets.only(left: 5.w),
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: 5.w),
        child: Image.asset(
          AssetsManager.linkdataimage,
        ),
      ),
      suffixIcon: Padding(
        padding: EdgeInsets.only(right: 3.w),
        child: Image.asset(AssetsManager.sendimage),
      ),
      hintText: StringManager.writehere,
      hintStyle: regularTextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: ColorManager.thucolor),
      border: const OutlineInputBorder(),
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
