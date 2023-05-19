import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/doctors_details/appointments/appointment_screen.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/widgets/common_widget/common_widget.dart';

import 'appointments/message_screen.dart';

class DoctorDetailScreen extends StatefulWidget {
  static const String id = 'DoctorDetailScreen';

  const DoctorDetailScreen(this.populardoctorimage, this.doctorname,
      {super.key});
  final Image populardoctorimage;
  final String doctorname;

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

List<String> list = <String>[
  '10AM - 12PM',
  '6PM - 9PM',
];

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    final List firsttext = [
      StringManager.patients,
      StringManager.exp,
      StringManager.rating
    ];
    final List secondtext = [
      StringManager.plus100,
      StringManager.yr10,
      StringManager.rating467
    ];
    Future<void> showAppoinmentScreen() async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              AppoinmentScreen(widget.populardoctorimage, widget.doctorname),
        ),
      );
    }

    Future<void> _showMessageScreen() async {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessageScreen(
              populardoctorimage: widget.populardoctorimage,
              doctorname: widget.doctorname,
            ),
          ));
    }

    Future<void> _selectDropdownValue(value) async {
      setState(() {
        dropdownValue = value!;
      });
    }

    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            appbarContainer(context, _showMessageScreen),
            Padding(
              padding: EdgeInsets.only(top: 75.h, left: 25.w, right: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _threeCard(firsttext, secondtext),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10.w, top: 30.h, bottom: 15.h),
                    child: Text(
                      StringManager.about,
                      style: regularTextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17.sp,
                        color: ColorManager.darkblack,
                      ),
                    ),
                  ),
                  _aboutText,
                  _availabilitycard(_selectDropdownValue),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: CustomButtons(
                      onPressed: () => showAppoinmentScreen(),
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
                  )
                ],
              ),
            )
          ],
        ),
        _doctorIntro(widget.doctorname, widget.populardoctorimage),
      ],
    ));
  }

  Widget _availabilitycard(selectDropdownValue) => Padding(
        padding: EdgeInsets.only(left: 10.w, bottom: 35.h, right: 10.w),
        child: Container(
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
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, bottom: 0),
                    child: Text(
                      StringManager.availability,
                      style: regularTextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: ColorManager.darkblack,
                      ),
                    ),
                  ),
                  CommonDropDown(
                    value: dropdownValue,
                    onChanged: (String? value) => selectDropdownValue(value),
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              buildSizedBoxSpacer(
                width: 0.w,
              ),
            ],
          ),
        ),
      );
}

Widget appbarContainer(context, showMessageScreen) => Container(
      height: 165.h,
      width: double.infinity,
      color: ColorManager.darkblue,
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              Container(
                height: 38.h,
                width: 42.w,
                decoration: BoxDecoration(
                    color: ColorManager.darkblue,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: ColorManager.bordercolor)),
                child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      AssetsManager.arrowimage,
                      color: ColorManager.white,
                    )),
              ),
              buildSizedBoxSpacer(
                width: 85.w,
              ),
              Text(
                StringManager.details,
                style: regularTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: ColorManager.white,
                ),
              ),
              buildSizedBoxSpacer(
                width: 83.w,
              ),
              Container(
                height: 38.h,
                width: 42.w,
                decoration: BoxDecoration(
                    color: ColorManager.darkblue,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: ColorManager.bordercolor)),
                child: GestureDetector(
                    onTap: () => showMessageScreen(),
                    child: Icon(
                      Icons.message,
                      color: ColorManager.bordercolor,
                      size: 20.h,
                    )),
              ),
            ],
          ),
        ),
      ),
    );

Widget _threeCard(firsttext, secondtext) => Row(
      children: [
        SizedBox(
          height: 80.h,
          width: 305.w,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Container(
                  height: 78.h,
                  width: 95.w,
                  decoration: BoxDecoration(
                    color: ColorManager.threecardcolor,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          firsttext[index],
                          style: regularTextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: ColorManager.hellotextcolor,
                          ),
                        ),
                        Text(
                          secondtext[index],
                          style: regularTextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            color: ColorManager.hellotextcolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );

Widget _aboutText = Padding(
  padding: EdgeInsets.only(left: 10.w, right: 25.w, bottom: 10.h),
  child: SizedBox(
    height: 110.h,
    width: 319.w,
    child: Column(
      children: [
        Text(
          StringManager.mbbsphd,
          style: regularTextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13.sp,
            color: ColorManager.settingiconcolor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 60.w, top: 8.h),
          child: SizedBox(
            height: 70,
            width: 319,
            child: Text(
              StringManager.exprofessor,
              style: regularTextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                color: ColorManager.settingiconcolor,
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget _doctorIntro(doctorname, populardoctorimage) => Positioned(
      left: 25.w,
      right: 25.w,
      top: 120.h,
      child: Container(
        height: 90.h,
        width: 319.w,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(14.w),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(23.r),
                  child: populardoctorimage),
            ),
            Padding(
              padding: EdgeInsets.only(top: 22.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorname,
                    style: regularTextStyle(
                      color: ColorManager.darkblack,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    StringManager.cardiologistinapolohospital,
                    style: regularTextStyle(
                      color: ColorManager.settingiconcolor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
