import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/services/auth_services.dart';
import 'package:medical_app/ui/screens/home/home.dart';
import 'doctors_details/doctor_search_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthServices _auth = AuthServices();
    User? _user;
    _user = _auth.getUser();
    Future<void> serviceMethod(index) async {
      if (index == 0) {
        Navigator.pushNamed(context, DoctorSearchScreen.id);
      } else if (index == 1) {
        Navigator.pushNamed(context, MedicineSearchScreen.id);
      }
    }

    Future<void> _removecard(
        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
        int index) async {
      FirebaseFirestore.instance
          .collection('user')
          .doc(_auth.getUser()?.uid)
          .collection("appointment")
          .doc(snapshot.data?.docs[index].id)
          .delete();
    }

    final List date = [
      StringManager.text12,
      StringManager.text13,
      StringManager.text14,
      StringManager.text15
    ];
    final List day = [
      StringManager.tue,
      StringManager.wed,
      StringManager.thu,
      StringManager.fri
    ];
    final List smallcontainercolor = [
      ColorManager.lightblue,
      ColorManager.lightyellow,
      ColorManager.lightgreen,
      ColorManager.lightpink,
    ];

    final List image = [
      Image.asset(AssetsManager.doctorimage),
      Image.asset(AssetsManager.pillicon),
      Image.asset(AssetsManager.medicaltest),
      Image.asset(AssetsManager.coronaimage),
    ];
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 28.w, top: 28.h, right: 20.w),
              child: _userintro(context, _user),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 25.w, right: 25.w, top: 20.h, bottom: 15.h),
              child: searchtextfeild,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w),
                child: Text(
                  StringManager.services,
                  style: regularTextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.hellotextcolor),
                ),
              ),
            ),
            _serviceCard(image, smallcontainercolor, serviceMethod),
            _medicalServicecard,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 28.w, top: 25.h),
                child: Text(
                  StringManager.upcomingappointments,
                  style: regularTextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.darkblack),
                ),
              ),
            ),
            _upoinmentcard(date, day, _auth, _removecard)
          ],
        ),
      )),
    );
  }

  Widget _upoinmentcard(date, day, auth, _removecard) => Padding(
        padding: EdgeInsets.only(
          top: 15.h,
        ),
        child: SizedBox(
          height: 100.h,
          width: double.infinity,
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
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc =
                          snapshot.data!.docs.elementAt(index);

                      int comparison =
                          doc['date'].compareTo(DateTime.now().day.toString());
                      if (comparison < 0) {
                        _removecard(snapshot, index);
                      }
                      return Padding(
                        padding: index == 0
                            ? EdgeInsets.only(left: 28.w, right: 15.w)
                            : EdgeInsets.only(right: 12.w),
                        child: GestureDetector(
                          onTap: () {
                            //print("fbdg IMAGE -- ${doc['doctorimage'] as Image}");
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => MessageScreen(
                            //           populardoctorimage: ,
                            //           doctorname: doc['doctorname']),
                            //     ));
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
                                    padding:
                                        EdgeInsets.only(left: 8.h, right: 12.w),
                                    child: Container(
                                      height: 75.h,
                                      width: 63.w,
                                      decoration: BoxDecoration(
                                        color: ColorManager.smallcontainercolor,
                                        borderRadius:
                                            BorderRadius.circular(21.r),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${doc['date']}',
                                            style: regularTextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w800,
                                                color: ColorManager.white),
                                          ),
                                          Text('${doc['day']}',
                                              style: regularTextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Container(
                                      width: 133.w, height: 70.h,
                                      //color: Colors.amber,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              color: ColorManager
                                                  .doctorcontainercolor,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: PopupMenuButton(
                                      icon: Image.asset(
                                        AssetsManager.vertical3dotsimage,
                                        color: ColorManager.white,
                                        height: 15.h,
                                      ),
                                      position: PopupMenuPosition.under,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.sp)),
                                      onSelected: (value) {
                                        // setState(() {});
                                      },
                                      itemBuilder: (context) {
                                        return [
                                          // PopupMenuItem(
                                          //   onTap: () {
                                          //     Navigator.push(
                                          //         context,
                                          //         MaterialPageRoute(
                                          //           builder: (context) =>
                                          //               DoctorSearchScreen(),
                                          //         ));
                                          //   },
                                          //   value: '/edit',
                                          //   child: const Text('Edit'),
                                          // ),
                                          PopupMenuItem(
                                            onTap: () {
                                              _removecard(snapshot, index);
                                            },
                                            value: '/remove',
                                            child: const Text('Remove'),
                                          )
                                        ];
                                      },
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      );
}

SizedBox buildSizedBoxSpacer({double? height, double? width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Widget _userintro(context, user) => Row(
      children: [
        Container(
          width: 200.w,
          //color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringManager.hello,
                style: regularTextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.hellotextcolor),
              ),
              Text(
                "${user?.displayName}", //StringManager.sahinalam,
                style: regularTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27.sp,
                    color: ColorManager.hellotextcolor),
              )
            ],
          ),
        ),
        buildSizedBoxSpacer(
          width: 60.w,
        ),
        Stack(
          children: [
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, ProfileScreen.id),
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 50.sp,
                  color: ColorManager.darkblue,
                )),
            // Positioned(
            //   left: 25.h,
            //   child: Image.asset(AssetsManager.profiledot),
            // )
          ],
        ),
      ],
    );

Widget searchtextfeild = TextFormField(
  decoration: InputDecoration(
    filled: true,
    fillColor: ColorManager.searchcolor,
    prefixIcon: Padding(
      padding:
          EdgeInsets.only(left: 15.w, right: 10.w, top: 10.h, bottom: 10.h),
      child: Image.asset(
        AssetsManager.searchimage,
        height: 18.h,
        width: 18.w,
      ),
    ),
    suffixIcon: Padding(
      padding: EdgeInsets.only(right: 15.w, top: 10.h, bottom: 10.h),
      child: 
      Image.asset(
        AssetsManager.sufiximage,height: 0.h,
        width: 0.w,
      ),
    ),
    hintText: StringManager.searchmedical,
    hintStyle:
        regularTextStyle(fontSize: 12.sp, color: ColorManager.searchiconcolor),
    border: const OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.r),
      borderSide: BorderSide(color: ColorManager.searchcolor),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.r),
        borderSide: BorderSide(color: ColorManager.searchcolor)),
  ),
);
Widget _serviceCard(image, smallcontainercolor, serviceMethod(index)) =>
    Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 28.w),
      child: Row(
        children: [
          SizedBox(
            height: 61.h,
            width: 330.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: 10.w,
                  ),
                  child: GestureDetector(
                    onTap: () => serviceMethod(index),
                    child: Container(
                      height: 63.h,
                      width: 69.w,
                      decoration: BoxDecoration(
                        color: smallcontainercolor[index],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: image[index],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );

Widget _medicalServicecard = Padding(
  padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h),
  child: Container(
    height: 145.h,
    width: 400.w,
    decoration: BoxDecoration(
        color: ColorManager.lightblue,
        borderRadius: BorderRadius.circular(28.r)),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.h, left: 25.w),
          child: SizedBox(
            width: 154.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringManager.bestmedicalservice,
                  style: regularTextStyle(
                      fontSize: 20.sp,
                      color: ColorManager.darkblack,
                      fontWeight: FontWeight.w700),
                ),
                buildSizedBoxSpacer(
                  height: 5.h,
                ),
                Text(
                  StringManager.loremipsum,
                  style: regularTextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.settingiconcolor),
                ),
              ],
            ),
          ),
        ),
        buildSizedBoxSpacer(
          width: 16.w,
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.r),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              AssetsManager.physicianimage,
              height: 125.h,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    ),
  ),
);
