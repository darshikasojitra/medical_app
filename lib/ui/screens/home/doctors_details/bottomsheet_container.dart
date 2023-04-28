import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/widgets/common_widget/custombutton.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';

class BottomsheetContainer extends StatefulWidget {
  const BottomsheetContainer({super.key});

  @override
  State<BottomsheetContainer> createState() => _BottomsheetContainerState();
}

class _BottomsheetContainerState extends State<BottomsheetContainer> {
  int _myindex = 0;
  int _yerindex = 0;
  final List _categoryimage = [
    Image.asset(
      AssetsManager.dentistimage,
    ),
    Image.asset(AssetsManager.surgeonimage),
    Image.asset(AssetsManager.allergistimage),
    Image.asset(AssetsManager.urologistimage),
  ];
  final List _categorytext = [
    StringManager.dentist,
    StringManager.surgeon,
    StringManager.allergist,
    StringManager.urologist
  ];
  final List _yeartext = [
    StringManager.yr0_2,
    StringManager.yr3_5,
    StringManager.yr10plus
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Container(
                  height: 5.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: ColorManager.darkblue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              buildSizedBoxSpacer(
                height: 15.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  StringManager.categories,
                  style: regularTextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w800,
                      color: ColorManager.darkblack),
                ),
              ),
              buildSizedBoxSpacer(
                height: 20.h,
              ),
              Row(
                children: [
                  Container(
                    height: 92.h,
                    width: 310.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Container(
                            height: 92.h,
                            width: 67.w,
                            decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                    color: _myindex == index
                                        ? ColorManager.darkblue
                                        : ColorManager.bordercolor)),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 8.h, top: 8.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _myindex = index;
                                      });
                                    },
                                    child: Container(
                                      height: 54.h,
                                      width: 54.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        border: Border.all(
                                            color: _myindex == index
                                                ? ColorManager.darkblue
                                                : ColorManager.bordercolor),
                                        color: _myindex == index
                                            ? ColorManager.darkblue
                                            : ColorManager.white,
                                      ),
                                      child: _categoryimage[index],
                                    ),
                                  ),
                                ),
                                Text(
                                  _categorytext[index],
                                  style: regularTextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.settingiconcolor),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              buildSizedBoxSpacer(
                height: 20.h,
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      StringManager.nearbydoctors,
                      style: regularTextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.symptomscolor),
                    ),
                  ),
                  buildSizedBoxSpacer(
                    width: 25.w,
                  ),
                  Image.asset(AssetsManager.switchimage),
                ],
              ),
              SizedBox(
                height: 30..h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  StringManager.experience,
                  style: regularTextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                      color: ColorManager.hellotextcolor),
                ),
              ),
              buildSizedBoxSpacer(
                height: 20.h,
              ),
              Container(
                height: 25.h,
                width: 300.w,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _yeartext.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _yerindex = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 25.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                              color: _yerindex == index
                                  ? ColorManager.darkblue
                                  : ColorManager.white,
                              borderRadius: BorderRadius.circular(8.r),
                              border:
                                  Border.all(color: ColorManager.logoutcolor)),
                          child: Text(
                            _yeartext[index],
                            style: regularTextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: _yerindex == index
                                    ? ColorManager.white
                                    : ColorManager.symptomscolor),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              buildSizedBoxSpacer(
                height: 20.h,
              ),
              CustomButtons(
                onPressed: () {},
                height: 46.h,
                minWidth: double.infinity,
                color: ColorManager.darkblue,
                child: Text(
                  StringManager.apply,
                  style: regularTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                    color: ColorManager.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
