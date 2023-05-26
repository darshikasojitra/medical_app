import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/dashboard_screen.dart';
import 'package:medical_app/ui/screens/home/home_screen.dart';
import 'package:medical_app/widgets/common_widget/common_widget.dart';

class SuccessfullyBookedAppointment extends StatelessWidget {
  const SuccessfullyBookedAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    shoeDashboardScreen() {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
          (route) => false);
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 250.h,
        ),
        child: Center(
          child: Column(
            children: [
              Lottie.network(
                  'https://assets10.lottiefiles.com/packages/lf20_vOw8d0zc1F.json'),
              buildSizedBoxSpacer(height: 10.h),
              Text(
                'Sucessfully Booked',
                style: regularTextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.darkyellow),
              ),
              Padding(
                padding: EdgeInsets.only(top: 210.h, bottom: 10.h),
                child: CustomButtons(
                  onPressed: () => shoeDashboardScreen(),
                  child: Text(
                    'Bake to home',
                    style: regularTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.darkblue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
 