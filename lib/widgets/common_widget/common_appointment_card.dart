import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/services/auth_services.dart';
import 'package:medical_app/ui/screens/home/home.dart';

class AppointmentCard extends StatelessWidget {
  final int? index;
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>? snapshot;
  const AppointmentCard({
    Key? key,
    required this.doc,
    required this.index,
    this.snapshot,
  }) : super(key: key);

  final DocumentSnapshot<Object?> doc;

  @override
  Widget build(BuildContext context) {
    final AuthServices auth = AuthServices();
      Future<void> removecard(
        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
        int index) async {
      FirebaseFirestore.instance
          .collection('user')
          .doc(auth.getUser()?.uid)
          .collection("appointment")
          .doc(snapshot.data?.docs[index].id)
          .delete();
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MessageScreen(doctorname: doc['doctorname']),
            ),
            );
      },
      child: Container(
          height: 100.h,
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
                        '${doc['date']}',
                        style: regularTextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                          color: ColorManager.white,
                        ),
                      ),
                      Text(
                        '${doc['day']}',
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
                child: SizedBox(
                  width: 133.w,
                  height: 70.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${doc['time']}',
                        style: regularTextStyle(
                          color: ColorManager.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${doc['doctorname']}',
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: doc['date'] != (DateTime.now().day).toString()
                    ? EdgeInsets.only(left: 35.w)
                    : EdgeInsets.only(left: 0.w),
                child: Align(
                  alignment: Alignment.topRight,
                  child: PopupMenuButton(
                    icon: Image.asset(
                      AssetsManager.vertical3dotsimage,
                      color: ColorManager.white,
                      height: 15.h,
                    ),
                    position: PopupMenuPosition.under,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.sp)),
                    onSelected: (value) {
                      // setState(() {});
                    },
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          onTap: () {
                           // removecard(snapshot, index!);
                          },
                          value: '/remove',
                          child: const Text('Remove'),
                        )
                      ];
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
