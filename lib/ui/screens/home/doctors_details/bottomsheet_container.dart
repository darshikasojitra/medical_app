import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/widgets/common_widget/custombutton.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:flutter_switch/flutter_switch.dart';

class BottomsheetContainer extends StatefulWidget {
  const BottomsheetContainer({super.key});

  @override
  State<BottomsheetContainer> createState() => _BottomsheetContainerState();
}

class _BottomsheetContainerState extends State<BottomsheetContainer> {
  int _myindex = 0;
  bool light = true;
  int _yerindex = 0;
  final List _categoryimage = [
    Image.asset(
      AssetsManager.dentistimage,
      height: 35.h,
      width: 35.w,
      color: ColorManager.settingiconcolor,
    ),
    Image.asset(
      AssetsManager.surgeonimage,
      height: 30.h,
      width: 32.w,
      color: ColorManager.settingiconcolor,
    ),
    Image.asset(
      AssetsManager.allergistimage,
      height: 30.h,
      width: 30.w,
      color: ColorManager.settingiconcolor,
    ),
    Image.asset(
      AssetsManager.urologistimage,
      height: 35.h,
      width: 35.w,
      color: ColorManager.settingiconcolor,
    ),
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
  Future<void> _selectMyIndex(index) async {
    setState(() {
      _myindex = index;
    });
  }

  Future<void> _selectYearIndex(index) async {
    setState(() {
      _yerindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    borderRadius: BorderRadius.circular(8.r),
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
                height: 15.h,
              ),
              _categoriesText(),
              buildSizedBoxSpacer(
                height: 25.h,
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
                  FlutterSwitch(
                    height: 25.h,
                    width: 55.w,
                    padding: 4.0,
                    toggleSize: 25.w,
                    borderRadius: 8.r,
                    activeColor: ColorManager.darkyellow,
                    value: light,
                    onToggle: (value) {
                      setState(() {
                        light = value;
                      });
                    },
                  ),
                ],
              ),
              buildSizedBoxSpacer(
                height: 25..h,
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
              _expContainer(),
              buildSizedBoxSpacer(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: CustomButtons(
                  onPressed: () => Navigator.pop(context),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoriesText() => Row(
        children: [
          SizedBox(
            height: 70.h,
            width: 310.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: GestureDetector(
                    onTap: () => _selectMyIndex(index),
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
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 0.h, top: 0.h),
                            child: _categoryimage[index],
                          ),
                          Text(
                            _categorytext[index],
                            style: regularTextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                                color: _myindex == index
                                    ? ColorManager.darkblue
                                    : ColorManager.settingiconcolor),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      );

  Widget _expContainer() => SizedBox(
        height: 30.h,
        width: 300.w,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _yeartext.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: GestureDetector(
                onTap: () => _selectYearIndex(index),
                child: Container(
                  alignment: Alignment.center,
                  height: 25.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      color: _yerindex == index
                          ? ColorManager.darkblue
                          : ColorManager.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: ColorManager.logoutcolor)),
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
      );
}
