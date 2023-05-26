import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/services/auth_services.dart';
import '../home/doctors_details/make_appointments/makeappointement_screen.dart';
import '../home/home_screen.dart';

class UpComingAppointment extends StatefulWidget {
  final DocumentSnapshot<Object?> doc;
  final int index;
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  const UpComingAppointment(
      {super.key,
      required this.doc,
      required this.index,
      required this.snapshot});

  @override
  State<UpComingAppointment> createState() => _UpComingAppointmentState();
}

class _UpComingAppointmentState extends State<UpComingAppointment> {
  AuthServices auth = AuthServices();
  Future<void> _removecard(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
      int index) async {
    FirebaseFirestore.instance
        .collection('user')
        .doc(auth.getUser()?.uid)
        .collection("appointment")
        .doc(snapshot.data?.docs[index].id)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding:  EdgeInsets.only(bottom: 10.h),
        child: Container(
            height: 115.h,
            width: 265.w,
            decoration: BoxDecoration(
              color: ColorManager.darkblue,
              borderRadius: BorderRadius.circular(28.r),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.h,
                    right: 12.w,
                  ),
                  child: Container(
                    height: 75.h,
                    width: 63.w,
                    decoration: BoxDecoration(
                      color: ColorManager.smallcontainercolor,
                      borderRadius: BorderRadius.circular(21.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.doc['date']}',
                          style: regularTextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                            color: ColorManager.white,
                          ),
                        ),
                        Text(
                          '${widget.doc['day']}',
                          style: regularTextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Container(
                    width: 210.w,
                    height: 90.h,
                    //color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.doc['time']}',
                          style: regularTextStyle(
                            color: ColorManager.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '${widget.doc['doctorname']}',
                          style: regularTextStyle(
                            color: ColorManager.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          StringManager.depression,
                          style: regularTextStyle(
                            color: ColorManager.doctorcontainercolor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 80.w),
                          child: Row(
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MakeAppoinmentScreen(apid: widget.doc.id,
                                                doctorname:
                                                    widget.doc['doctorname']),
                                      ),
                                     );
                                      _removecard(
                                              widget.snapshot, widget.index);
                                  setState(() {});
                                },
                                height: 20.h,
                                minWidth: 50.w,
                                //color: ColorManager.lightblue,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: ColorManager.lightblue),
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                child: Text(
                                  'Edit',
                                  style: regularTextStyle(
                                      color: ColorManager.white, fontSize: 12.sp),
                                ),
                              ),
                              buildSizedBoxSpacer(width: 5.w),
                              MaterialButton(
                                onPressed: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),),
                                      title: Text(
                                        'Cancle',
                                        style: TextStyle(
                                            color: ColorManager.darkblue),
                                      ),
                                      content: Text(
                                        'Are you sure you want to cancle appointment?',
                                        style: regularTextStyle(fontSize: 15.sp),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'No'),
                                          child: Text(
                                            'No',
                                            style: regularTextStyle(
                                                color: ColorManager.darkblue,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () => {
                                            _removecard(
                                              widget.snapshot, widget.index),
                                              Navigator.pop(context),
                                          },
                                          child: Text(
                                            'Yes',
                                            style: regularTextStyle(
                                                color: ColorManager.darkblue,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                height: 20.h,
                                minWidth: 50.w,
                                //color: ColorManager.lightblue,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: ColorManager.lightblue),
                                  borderRadius: BorderRadius.circular(10.w),
                                ),
                                child: Text(
                                  'Cancle',
                                  style: regularTextStyle(
                                      color: ColorManager.white, fontSize: 12.sp),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class UpcomingAppointment{
  final String id;
 const UpcomingAppointment({required this.id});
}