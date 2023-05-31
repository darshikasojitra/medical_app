import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/services/auth_services.dart';
import 'package:medical_app/ui/screens/home/home.dart';
import 'package:medical_app/ui/screens/home/medicines_details/medicines_screen.dart';
import 'package:medical_app/widgets/common_widget/common_appointment_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'doctors_details/all_doctors_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthServices auth = AuthServices();
    final PageController controller = PageController();
    User? user;
    user = auth.getUser();
    Future<void> serviceMethod(index) async {
      if (index == 0) {
        Navigator.pushNamed(context, AllDoctorsScreen.id);
      } else if (index == 1) {
        //Navigator.pushNamed(context, MedicineSearchScreen.id);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MedicineScreen(),));
      }
    }

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

    final List smallcontainercolor = [
      ColorManager.lightblue,
      ColorManager.lightyellow,
    ];
    final List containertext = ['Doctors', 'Medicine'];

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
              child: _userintro(context, user),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 25.w, right: 25.w, top: 20.h, bottom: 20.h),
              child: searchtextfeild,
            ),
            _medicalServicecard(controller),
            buildSizedBoxSpacer(height: 10.w),
            SmoothPageIndicator(
              controller: controller,
              count: 4,
              effect: SlideEffect(
                activeDotColor: ColorManager.darkblue,
                dotHeight: 6.h,
                dotColor: ColorManager.bordercolor,
                dotWidth: 6.h,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 15.h),
                child: Text(
                  StringManager.services,
                  style: regularTextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.hellotextcolor),
                ),
              ),
            ),
            _serviceCard(
                image, smallcontainercolor, serviceMethod, containertext),
            // _medicalServicecard,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 28.w, top: 25.h),
                child: Text(
                  StringManager.todayappointments,
                  style: regularTextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.darkblack,
                  ),
                ),
              ),
            ),
            _upoinmentcard(auth, removecard),
          ],
        ),
      )),
    );
  }

  Widget _upoinmentcard(auth, removecard) => Padding(
        padding: EdgeInsets.only(
          top: 20.h,
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
                      return Offstage(
                        offstage: comparison != 0,
                        child: Padding(
                          padding:index==0? EdgeInsets.only(right: 10.w):EdgeInsets.only(left: 28.w,right: 0.w),
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
                  child: Text("No Today's Appointments"),
                  // CircularProgressIndicator(),
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
        SizedBox(
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
                  color: ColorManager.hellotextcolor,
                ),
              ),
              Text(
                "${user?.displayName}",
                style: regularTextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 27.sp,
                  color: ColorManager.hellotextcolor,
                ),
              ),
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
              ),
            ),
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
      borderSide: BorderSide(color: ColorManager.searchcolor),
    ),
  ),
);
Widget _serviceCard(
        image, smallcontainercolor, serviceMethod, containertext) =>
    Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 0.h, left: 28.w),
      child: Row(
        children: [
          SizedBox(
            height: 53.h,
            width: 330.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: 15.w,
                  ),
                  child: GestureDetector(
                    onTap: () => serviceMethod(index),
                    child: Container(
                        height: 53.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: smallcontainercolor[index],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              containertext[index],
                              style: regularTextStyle(
                                color: index == 0
                                    ? ColorManager.darkblue
                                    : ColorManager.darkyellow,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            buildSizedBoxSpacer(width: 10.w),
                            image[index],
                          ],
                        )),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );

Widget _medicalServicecard(controller) => SizedBox(
      height: 145.h,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 4,
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: index == 0
                ? EdgeInsets.only(left: 25.w, right: 25.w)
                : EdgeInsets.only(left: 0.w, right: 25.w),
            child: Container(
              height: 145.h,
              width: 310.w,
              decoration: BoxDecoration(
                color: ColorManager.lightblue,
                borderRadius: BorderRadius.circular(28.r),
              ),
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
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          buildSizedBoxSpacer(
                            height: 5.h,
                          ),
                          Text(
                            StringManager.loremipsum,
                            style: regularTextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.settingiconcolor,
                            ),
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
        },
      ),
    );
