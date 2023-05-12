import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/widgets/common_widget/custombutton.dart';
import 'package:medical_app/ui/screens/home/doctors_details/appointments/appointments.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../../../../../services/auth_services.dart';

class MakeAppoinmentScreen extends StatefulWidget {
  static const String id = 'MakeAppoinmentScreen';
  final Image populardoctorimage;
  final String doctorname;
  const MakeAppoinmentScreen(
      {super.key, required this.populardoctorimage, required this.doctorname});

  @override
  State<MakeAppoinmentScreen> createState() => _MakeAppoinmentScreenState();
}

class _MakeAppoinmentScreenState extends State<MakeAppoinmentScreen> {
  int _myindex = 0;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final AuthServices _auth = AuthServices();
  DateTime _focusedDay = DateTime.now();
  DateTime? scheduleTime;
  DateTime? _selectedDay;
  final List _time = [
    StringManager.time9_30,
    StringManager.time10_30,
    StringManager.time11_00,
    StringManager.time11_30,
    StringManager.time12_00,
    StringManager.time12_30
  ];
  String? finaltime;

  Future<void> _selectTime(index) async {
    setState(() {
      _myindex = index;
      finaltime = _time[index];
      print("final timeeeeee${finaltime}");
    });
  }

  Future<void> _showPaymentScreen(populardoctorimage, doctorname) async {
    setState(() {
      scheduleTime = _selectedDay ?? _focusedDay;
      print("selected time in this --- ${scheduleTime}");
      FirebaseFirestore.instance
          .collection('user')
          .doc(_auth.getUser()!.uid)
          .collection("appointment")
          .doc()
          .set({
        'doctorname': widget.doctorname,
        'date': DateFormat.d().format(scheduleTime as DateTime),
        'day': DateFormat.E().format(scheduleTime as DateTime),
        'time': finaltime,
        'uid': _auth.getUser()!.uid
      });
    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentScreen(
            populardoctorimage: populardoctorimage,
            doctorname: doctorname,
          ),
        ));
  }

  @override
  void initState() {
    setState(() {});
    // print("timeeeeee${_focusedDay.day}");
    // print("select timeeeeee${_selectedDay }");
    super.initState();
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
            height: 274.h, width: 322.w,
            child: newCalender(),
            //const NewTableCalender()
          ),
          displaybottomcontainer(context, _selectTime, _myindex, _time,
              widget.populardoctorimage, widget.doctorname, _showPaymentScreen)
        ],
      ),
    );
  }

  Widget newCalender() => TableCalendar(
        rowHeight: 35.h,
        daysOfWeekVisible: false,
        headerStyle: HeaderStyle(
          titleTextFormatter: (date, locale) =>
              DateFormat.MMMM(locale).format(_focusedDay).toString(),
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: regularTextStyle(
            color: ColorManager.darkblack,
            fontSize: 34.sp,
            fontWeight: FontWeight.w800,
          ),
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: ColorManager.settingiconcolor,
            size: 30.sp,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: ColorManager.settingiconcolor,
            size: 30.sp,
          ),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.darkblue,
          ),
          todayTextStyle: regularTextStyle(
              color: ColorManager.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 15.sp),
          selectedDecoration: BoxDecoration(
            color: ColorManager.darkblue,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: regularTextStyle(
              color: ColorManager.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 15.sp),
        ),
        focusedDay: _focusedDay,
        firstDay: DateTime.utc(2020, 10, 20),
        lastDay: DateTime.utc(2040, 10, 20),
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            setState(() {});
          }
        },
        onFormatChanged: (format) => {
          if (_calendarFormat != format)
            {
              setState(() {
                _calendarFormat = format;
              }),
            }
        },
        onPageChanged: (focusedDay) => _focusedDay = focusedDay,
      );
}

Widget displaybottomcontainer(BuildContext context, selectTime, myindex, time,
        populardoctorimage, doctorname, showPaymentScreen) =>
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
                      onTap: () {
                        selectTime(index);
                      },
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
                onPressed: () async =>
                    await showPaymentScreen(populardoctorimage, doctorname),
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
