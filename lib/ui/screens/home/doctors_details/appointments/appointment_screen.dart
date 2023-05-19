import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/services/auth_services.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/ui/screens/home/doctors_details/appointments/appointments.dart';
import 'package:medical_app/resources/resources.dart';

import 'package:medical_app/widgets/common_widget/common_widget.dart';

class AppoinmentScreen extends StatefulWidget {
  static const String id = 'AppoinmentScreen';
  const AppoinmentScreen(
    this.populardoctorimage,
    this.doctorname, {
    super.key,
  });
  final Image populardoctorimage;
  final String doctorname;

  @override
  State<AppoinmentScreen> createState() => _AppoinmentScreenState();
}

List<String> list = <String>[
  '10AM - 11AM',
  '11AM - 12PM',
  '6PM - 7PM',
  '7PM - 8PM',
  '8PM - 9PM'
];

class _AppoinmentScreenState extends State<AppoinmentScreen> {
  String dropdownValue = list.first;

  Future<void> _showMakeAppoinmentScreen(context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MakeAppoinmentScreen(
            populardoctorimage: widget.populardoctorimage,
            doctorname: widget.doctorname,
          ),
        ));
  }

  Future<void> _selectvalue(value) async {
    setState(() {
      dropdownValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 40.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _appbar(context),
              buildSizedBoxSpacer(
                height: 40.h,
              ),
              widget.populardoctorimage,
              buildSizedBoxSpacer(
                height: 20.h,
              ),
              _doctorIntro(widget.doctorname),
              buildSizedBoxSpacer(
                height: 35.h,
              ),
              TextFormField(
                maxLines: 7,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 23.w, top: 28.h),
                  filled: true,
                  fillColor: ColorManager.bordercolor,
                  hintText: StringManager.writesymptoms,
                  hintStyle: regularTextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.symptomscolor),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide(color: ColorManager.searchcolor),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(color: ColorManager.searchcolor)),
                ),
              ),
              buildSizedBoxSpacer(
                height: 30.h,
              ),
              _scheduleContainer(),
              buildSizedBoxSpacer(
                height: 40.h,
              ),
              CustomButtons(
                onPressed: () => _showMakeAppoinmentScreen(context),
                height: 46.h,
                minWidth: double.infinity,
                color: ColorManager.darkblue,
                child: Text(
                  StringManager.booknow,
                  style: regularTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: ColorManager.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _scheduleContainer() => Container(
        height: 70.h,
        width: 300.w,
        decoration: BoxDecoration(
          color: ColorManager.white,
          border: Border.all(color: ColorManager.bordercolor),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 20.w),
              child: Container(
                height: 46.h,
                width: 52.w,
                decoration: BoxDecoration(
                  color: ColorManager.lightblue,
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
                  StringManager.schedule,
                  style: regularTextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: ColorManager.symptomscolor,
                  ),
                ),
                CommonDropDown(
                  value: dropdownValue,
                  onChanged: (String? value) => _selectvalue(value),
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      );
}

Widget _appbar(context) => Row(
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
          width: 195.w,
        ),
        Text(
          StringManager.dollar,
          style: regularTextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: ColorManager.dollarsigncolor),
        ),
        Text(
          StringManager.text12,
          style: regularTextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w800,
              color: ColorManager.dollarsigncolor),
        ),
        Text(
          StringManager.ap,
          style: regularTextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorManager.dollarsigncolor),
        )
      ],
    );

Widget _doctorIntro(doctorname) => Column(
      children: [
        Text(
          doctorname,
          style: regularTextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 19.sp,
            color: ColorManager.darkblack,
          ),
        ),
        Text(
          StringManager.cardiologistinapolohospital,
          style: regularTextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: ColorManager.settingiconcolor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 90.w, top: 7.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AssetsManager.starimage),
              buildSizedBoxSpacer(
                width: 5.w,
              ),
              Text(
                StringManager.text45,
                style: regularTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                  color: ColorManager.darkblack,
                ),
              ),
              buildSizedBoxSpacer(
                width: 5.w,
              ),
              Text(
                StringManager.review17,
                style: regularTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp,
                  color: ColorManager.settingiconcolor,
                ),
              ),
            ],
          ),
        )
      ],
    );
