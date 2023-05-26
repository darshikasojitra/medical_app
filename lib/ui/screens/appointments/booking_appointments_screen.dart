import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/services/auth_services.dart';
import 'package:medical_app/ui/screens/appointments/upcoming_appointment.dart';
import 'package:medical_app/widgets/common_widget/common_appointment_card.dart';

class BookingAppointmentsScreen extends StatefulWidget {
  const BookingAppointmentsScreen({super.key});

  @override
  State<BookingAppointmentsScreen> createState() =>
      _BookingAppointmentsScreenState();
}

class _BookingAppointmentsScreenState extends State<BookingAppointmentsScreen> {
  final AuthServices auth = AuthServices();
  bool showAppointment = true;
  Future<void> selectAppointment(value) async {
    setState(() {
      showAppointment = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 25.w, right: 25.w, top: 35.h, bottom: 15.h),
            child: Text(
              StringManager.appointment,
              style: regularTextStyle(
                color: ColorManager.darkblack,
                fontWeight: FontWeight.w700,
                fontSize: 27.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 28.w, right: 28.w, top: 10.h, bottom: 15.h),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    selectAppointment(true);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      color: showAppointment
                          ? ColorManager.darkblue
                          : ColorManager.bordercolor,
                    ),
                    height: 40.h,
                    width: 152.w,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.w, right: 17.w),
                        child: Text(
                          'Upcoming',
                          style: regularTextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: showAppointment
                                  ? ColorManager.white
                                  : ColorManager.black),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    selectAppointment(false);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: !showAppointment
                          ? ColorManager.darkblue
                          : ColorManager.bordercolor,
                    ),
                    height: 40.h,
                    width: 152.w,
                    child: Center(
                      child: Text(
                        'Past',
                        style: regularTextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: !showAppointment
                                ? ColorManager.white
                                : ColorManager.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 28.w, right: 28.w),
            child: Column(
              children: [
                SizedBox(
                  height: 490.h,
                  width: double.infinity,
                  //color: Colors.amber,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('user')
                        .doc(auth.getUser()?.uid)
                        .collection("appointment")
                        .orderBy('date')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text('No Appointments'),
                          );
                        }
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot doc =
                                snapshot.data!.docs.elementAt(index);
                            int comparison = doc['date']
                                .compareTo(DateTime.now().day.toString());
                            return (showAppointment)
                                ? Offstage(
                                  offstage: comparison <= 0,
                                  child: UpComingAppointment(
                                    doc: doc,
                                    index: index,
                                    snapshot: snapshot,
                                  ),
                                )
                                : Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: Offstage(
                                      offstage: comparison >= 0,
                                      child: AppointmentCard(
                                        doc: doc,
                                        index: index,
                                      ),
                                    ),
                                  );
                          },
                        );
                      }
                      return const Center(
                        child: Text("No Appointments"),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
