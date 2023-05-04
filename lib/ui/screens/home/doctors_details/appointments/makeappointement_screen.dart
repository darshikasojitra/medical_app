import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/widgets/common_widget/custombutton.dart';
import 'package:medical_app/ui/screens/home/doctors_details/appointments/appointments.dart';

class MakeAppoinmentScreen extends StatefulWidget {
  static const String id = 'MakeAppoinmentScreen';
  final Image populardoctorimage;
  final String doctorname;
  const MakeAppoinmentScreen(
      {super.key, required this.populardoctorimage, required this.doctorname});

  //final String doctorname;
  @override
  State<MakeAppoinmentScreen> createState() => _MakeAppoinmentScreenState();
}

class _MakeAppoinmentScreenState extends State<MakeAppoinmentScreen> {
  int _myindex = 0;
  final List _time = [
    StringManager.time9_30,
    StringManager.time10_30,
    StringManager.time11_00,
    StringManager.time11_30,
    StringManager.time12_00,
    StringManager.time12_30
  ];
  final DateTime _focusedDay = DateTime.now();

  Future<void> _selectTime(index) async {
    setState(() {
      _myindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 28.w, right: 28.w, top: 40.h, bottom: 20.h),
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
                  width: 60.w,
                ),
                Text(
                  StringManager.appointment,
                  style: regularTextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.darkblack),
                ),
              ],
            ),
          ),
          SizedBox(
              height: 274.h, width: 322.w, child: const NewTableCalender()),
          //buildSizedBoxSpacer(height: 5.h),
          displaybottomcontainer(context, _selectTime, _myindex, _time,
              widget.populardoctorimage, widget.doctorname)
        ],
      ),
    );
  }
}

Widget displaybottomcontainer(
  BuildContext context,
  selectTime,
  myindex,
  time,
  populardoctorimage,
  doctorname,
) =>
    Container(
      height: 318.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.darkblue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.w), topRight: Radius.circular(30.w))),
      child: Padding(
        padding: EdgeInsets.only(left: 30.w, top: 40.h, right: 30.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                StringManager.time,
                style: regularTextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    color: ColorManager.white),
              ),
            ),
            buildSizedBoxSpacer(
              height: 10.h,
            ),
            SizedBox(
                height: 125.h,
                width: 335.w,
                //color: Colors.white,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20.h,
                      crossAxisSpacing: 10.w,
                      childAspectRatio: 2.h),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => selectTime(index),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: myindex == index
                                ? ColorManager.darkyellow
                                : ColorManager.darkblue,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                                color: myindex == index
                                    ? ColorManager.darkyellow
                                    : ColorManager.white)),
                        child: Text(
                          time[index],
                          style: regularTextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.white),
                        ),
                      ),
                    );
                  },
                )),
            Padding(
              padding: EdgeInsets.only(
                top: 40.h,
              ),
              child: CustomButtons(
                onPressed: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(
                          populardoctorimage: populardoctorimage,
                          doctorname: doctorname,
                        ),
                      ));
                  //Navigator.pushNamed(context, PaymentScreen.id);
                }),
                height: 46.h,
                minWidth: double.infinity,
                color: ColorManager.white,
                child: Text(
                  StringManager.makeappointment,
                  style: regularTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: ColorManager.darkblue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
