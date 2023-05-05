import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/widgets/common_widget/custombutton.dart';

class MedicineSearchScreen extends StatefulWidget {
  static const String id = 'MedicineSearchScreen';
  const MedicineSearchScreen({super.key});

  @override
  State<MedicineSearchScreen> createState() => _MedicineSearchScreenState();
}

class _MedicineSearchScreenState extends State<MedicineSearchScreen> {
  final List _pharmaimage = [
    Image.asset(
      AssetsManager.firstpharmaimage,
      height: 80.h,
      width: 144.w,
      fit: BoxFit.fill,
    ),
    Image.asset(
      AssetsManager.secondpharmaimage,
      height: 80.h,
      width: 144.w,
      fit: BoxFit.fill,
    ),
    Image.asset(
      AssetsManager.firstpharmaimage,
      height: 80.h,
      width: 144.w,
      fit: BoxFit.fill,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
            child: Row(
              children: [
                Container(
                  height: 38.h,
                  width: 42.w,
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: ColorManager.bordercolor)),
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(AssetsManager.arrowimage)),
                ),
                buildSizedBoxSpacer(
                  width: 35.w,
                ),
                Image.asset(AssetsManager.locationimage),
                buildSizedBoxSpacer(
                  width: 10.w,
                ),
                Text(
                  StringManager.dhanmondidhaka,
                  style: regularTextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: ColorManager.darkblack,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, top: 27.h, bottom: 12.h),
            child: Text(
              StringManager.pharmacynearby,
              style: regularTextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17.sp,
                color: ColorManager.darkblack,
              ),
            ),
          ),
          _pharmacyContainer(_pharmaimage),
          Padding(
            padding: EdgeInsets.only(
              top: 25.h,
              left: 72.w,
            ),
            child: Text(
              StringManager.uploadprescription,
              style: regularTextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24.sp,
                color: ColorManager.darkblack,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 72.w, right: 62.w, top: 10.h, bottom: 25.h),
            child: Column(
              children: [
                Text(
                  StringManager.wewill,
                  style: regularTextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                    color: ColorManager.settingiconcolor,
                  ),
                ),
                Text(
                  StringManager.allthe,
                  style: regularTextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                    color: ColorManager.settingiconcolor,
                  ),
                ),
              ],
            ),
          ),
          _uploadPrescriptionContainer,
          Padding(
            padding: EdgeInsets.only(left: 55.w, right: 55.w),
            child: CustomButtons(
              onPressed: () {},
              height: 46.h,
              minWidth: double.infinity,
              color: ColorManager.darkblue,
              child: Text(
                StringManager.Continue,
                style: regularTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _pharmacyContainer(pharmaimage) => Container(
      height: 160.h,
      width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: pharmaimage.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: index == 0
                ? EdgeInsets.only(left: 25.w, right: 13.h)
                : EdgeInsets.only(left: 0.w, right: 13.h),
            child: Container(
              height: 160.h,
              width: 144.w,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    child: pharmaimage[index],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h, left: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringManager.virgopharma,
                          style: regularTextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                            color: ColorManager.darkblack,
                          ),
                        ),
                        buildSizedBoxSpacer(
                          height: 3.h,
                        ),
                        Text(
                          StringManager.away2km,
                          style: regularTextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                            color: ColorManager.settingiconcolor,
                          ),
                        ),
                        buildSizedBoxSpacer(
                          height: 3.h,
                        ),
                        _starandsearch
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

Widget _starandsearch = Row(
  children: [
    Image.asset(
      AssetsManager.starimage,
      height: 12.h,
      width: 12.w,
    ),
    buildSizedBoxSpacer(
      width: 4.w,
    ),
    Text(
      StringManager.text45,
      style: regularTextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12.sp,
        color: ColorManager.darkblack,
      ),
    ),
    buildSizedBoxSpacer(
      width: 8.w,
    ),
    Text(
      StringManager.review17,
      style: regularTextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 11.sp,
        color: ColorManager.settingiconcolor,
      ),
    ),
  ],
);

Widget _uploadPrescriptionContainer = Padding(
  padding: EdgeInsets.only(left: 55.w, right: 55.w, bottom: 35.h),
  child: Container(
    height: 140.h,
    width: 300.w,
    decoration: BoxDecoration(
      color: ColorManager.bgcolor,
      borderRadius: BorderRadius.circular(24.r),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 30.w, right: 20.w, top: 27.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 55.h,
                width: 65.w,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Image.asset(AssetsManager.bluelinkimage,
                    color: ColorManager.darkblue),
              ),
              buildSizedBoxSpacer(
                height: 10.h,
              ),
              Text(
                StringManager.sharelink,
                style: regularTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: ColorManager.darkblack,
                ),
              )
            ],
          ),
          buildSizedBoxSpacer(
            width: 30.w,
          ),
          Column(
            children: [
              Container(
                height: 55.h,
                width: 65.w,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Image.asset(AssetsManager.uploadimage),
              ),
              buildSizedBoxSpacer(
                height: 10.h,
              ),
              Text(
                StringManager.upload,
                style: regularTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: ColorManager.darkblack,
                ),
              )
            ],
          )
        ],
      ),
    ),
  ),
);
