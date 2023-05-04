import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/assets_manager.dart';
import 'package:flutter_google_street_view/flutter_google_street_view.dart';

class PharmacyLocationScreen extends StatefulWidget {
  static const String id = 'PharmacyLocationScreen';
  const PharmacyLocationScreen({super.key});

  @override
  State<PharmacyLocationScreen> createState() => _PharmacyLocationScreenState();
}

class _PharmacyLocationScreenState extends State<PharmacyLocationScreen> {
//   static const LatLng _center = LatLng(23.0225, 72.5714);
//   StreetViewController? streetViewController;
//   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Street View Init Demo'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            FlutterGoogleStreetView(
              /**
                 * It not necessary but you can set init position
                 * choice one of initPos or initPanoId
                 * do not feed param to both of them, or you should get assert error
                 */
              initPos: LatLng(37.769263, -122.450727),
              //initPanoId: "WddsUw1geEoAAAQIt9RnsQ",

              /**
                 *  It is worked while you set initPos or initPanoId.
                 *  initSource is a filter setting to filter panorama
                 */
              initSource: StreetViewSource.outdoor,

              /**
                 *  It is worked while you set initPos or initPanoId.
                 *  initBearing can set default bearing of camera.
                 */
              initBearing: 30,

              /**
                 *  It is worked while you set initPos or initPanoId.
                 *  initTilt can set default tilt of camera.
                 */
              initTilt: 30,

              /**
                 *  It is worked while you set initPos or initPanoId.
                 *  initZoom can set default zoom of camera.
                 */
              initZoom: 1.5,

              /**
                 *  iOS Only
                 *  It is worked while you set initPos or initPanoId.
                 *  initFov can set default fov of camera.
                 */
              //initFov: 120,

              /**
                 *  Set street view can panning gestures or not.
                 *  default setting is true
                 */
              //panningGesturesEnabled: false,

              /**
                 *  Set street view shows street name or not.
                 *  default setting is true
                 */
              //streetNamesEnabled: false,

              /**
                 *  Set street view can allow user move to other panorama or not.
                 *  default setting is true
                 */
              //userNavigationEnabled: false,

              /**
                 *  Set street view can zoom gestures or not.
                 *  default setting is true
                 */
              //zoomGesturesEnabled: false,

              /**
                 *  To control street view after street view was initialized.
                 *  You should set [StreetViewCreatedCallback] to onStreetViewCreated.
                 *  And you can using [StreetViewController] object(controller) to control street view.
                 */
              onStreetViewCreated: (controller) async {
                controller.animateTo(
                    duration: 50,
                    camera: StreetViewPanoramaCamera(
                        bearing: 15, tilt: 10, zoom: 3));
              },
            ),
          ],
        ),
      ),
    );
  }
}
//     return Stack(
//       children: [
//         FlutterGoogleStreetView(
//   initPos: LatLng(23.0225, 72.5714),
//   onStreetViewCreated: (StreetViewController controller) async {
//    //save controller for late using
//    streetViewController = controller;
//    //change position by controller
//    controller.setPosition(position: LatLng(23.0225, 72.5714));
//  }
// )
//         // Image.asset(
//         //   AssetsManager.pharmacylocationimage,
//         //   height: 810.h,
//         //   width: 370.w,
//         //   fit: BoxFit.cover,
//         // ),
//         // Positioned(
//         //     top: 335.h,
//         //     left: 114.w,
//         //     right: 206.w,
//         //     child: Image.asset(
//         //       AssetsManager.locationarrowimage,
//         //       height: 54.h,
//         //       width: 54.w,
//         //     )),
//         // _pharmacylocation,
//       ],
//     );
//   }
// }

// Widget _pharmacylocation = Positioned(
//     left: 28.w,
//     right: 28.w,
//     top: 65.h,
//     child: Container(
//       height: 120.h,
//       width: 315.w,
//       decoration: BoxDecoration(
//           color: Color(0xffFFFFFF), borderRadius: BorderRadius.circular(24.r)),
//       child: Row(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//                 left: 10.w, right: 20.w, top: 8.h, bottom: 10.h),
//             child: Image.asset(AssetsManager.pharmaimage),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 20.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Near California',
//                   style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 12.sp,
//                       color: Color(0xff4A545E),
//                       fontFamily: 'NunitoSans'),
//                 ),
//                 Text(
//                   'Virgo Pharma',
//                   style: TextStyle(
//                       color: Color(0xff253141),
//                       fontFamily: 'NunitoSans',
//                       fontWeight: FontWeight.w800,
//                       fontSize: 20.sp),
//                 ),
//                 SizedBox(
//                   height: 7.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       height: 26.h,
//                       width: 26.w,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.r),
//                           color: Color(0xffFFFFFF),
//                           border: Border.all(color: Color(0xffBECADA))),
//                       child: Image.asset(
//                         AssetsManager.locationimage,
//                         height: 11.h,
//                         width: 8.w,
//                         color: Color(0xff4A545E),
//                       ),
//                     ),
//                     Text(
//                       '10.5 Km',
//                       style: TextStyle(
//                           color: Color(0xff4A545E),
//                           fontFamily: 'NunitoSans',
//                           fontWeight: FontWeight.w700,
//                           fontSize: 14.sp),
//                     ),
//                     SizedBox(
//                       width: 7.w,
//                     ),
//                     Container(
//                       height: 26.h,
//                       width: 26.w,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.r),
//                           color: Color(0xffFFFFFF),
//                           border: Border.all(color: Color(0xffBECADA))),
//                       child: Image.asset(
//                         AssetsManager.smallclockimage,
//                       ),
//                     ),
//                     Text(
//                       '30 Min',
//                       style: TextStyle(
//                           color: Color(0xff4A545E),
//                           fontFamily: 'NunitoSans',
//                           fontWeight: FontWeight.w700,
//                           fontSize: 14.sp),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     ));
