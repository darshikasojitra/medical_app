import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/doctors_details/all_doctors_screen.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';

import 'doctordetails_screen.dart';

class SeeAllDoctorsScreen extends StatelessWidget {
  const SeeAllDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List populardoctorimage = [
      Image.asset(AssetsManager.drmim),
      Image.asset(AssetsManager.drjon),
      Image.asset(AssetsManager.drzim),
      Image.asset(AssetsManager.drmim),
      Image.asset(AssetsManager.drjon),
      Image.asset(AssetsManager.drzim),
      Image.asset(AssetsManager.drmim),
      Image.asset(AssetsManager.drjon),
      Image.asset(AssetsManager.drzim),
      Image.asset(AssetsManager.drmim),
      Image.asset(AssetsManager.drjon),
      Image.asset(AssetsManager.drzim)
    ];
    final List doctorname = [
      StringManager.drmim,
      StringManager.drjon,
      StringManager.drzim,
      StringManager.drmim,
      StringManager.drjon,
      StringManager.drzim,
      StringManager.drmim,
      StringManager.drjon,
      StringManager.drzim,
      StringManager.drmim,
      StringManager.drjon,
      StringManager.drzim
    ];
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 30.w),
            child: Row(
              children: [
                Container(
                  height: 38.h,
                  width: 42.w,
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: ColorManager.bordercolor)),
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(AssetsManager.arrowimage)),
                ),
                buildSizedBoxSpacer(
                  width: 77.w,
                ),
                Text(
                  'All Doctors',
                  style: regularTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: ColorManager.darkblack,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: SizedBox(
              height: 613.h,
              width: 370.w,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: populardoctorimage.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 17.h, left: 25.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorDetailScreen(
                                  populardoctorimage[index],
                                  doctorname[index]),
                            ));
                      },
                      child: Row(
                        children: [
                          populardoctorimage[index],
                          buildSizedBoxSpacer(
                            width: 20.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctorname[index],
                                style: regularTextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 19.sp,
                                  color: ColorManager.darkblack,
                                ),
                              ),
                              buildSizedBoxSpacer(height: 3.h),
                              Text(
                                StringManager.cardiologistinapolohospital,
                                style: regularTextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: ColorManager.settingiconcolor,
                                ),
                              ),
                              buildSizedBoxSpacer(height: 7.h),
                              starandsearch
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
