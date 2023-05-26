import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';
import 'package:medical_app/ui/screens/home/doctors_details/search_doctors/doctor.dart';

import '../../home_screen.dart';
import '../all_doctors_screen.dart';
import '../doctordetails_screen.dart';

class SearchDoctorsScreen extends StatefulWidget {
  const SearchDoctorsScreen({super.key});

  @override
  State<SearchDoctorsScreen> createState() => _SearchDoctorsScreenState();
}

class _SearchDoctorsScreenState extends State<SearchDoctorsScreen> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Doctors');
  final _textContoller = TextEditingController();
  List<Doctor> doctors = allDoctors;
  List<String> searchResults = [];
  void search(String query) {
    final suggestions = allDoctors.where((doctor) {
      final nametitle = doctor.name!.toLowerCase();
      final input = query.toLowerCase();
      return nametitle.contains(input);
    }).toList();
    setState(() {
      doctors = suggestions;
    });
  }

  int _category = 0;
  Future<void> _selectCategory(index) async {
    setState(() {
      _category = index;
    });
  }

  final List _categoryText = [
    'All',
    'General',
    'Dentist',
    'Surgeon',
    'Allergist',
    'Urologist',
    'Lungs',
    'Heart'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.darkblue,
        title: customSearchBar,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (customIcon.icon == Icons.search) {
                    customIcon = const Icon(Icons.cancel);
                    customSearchBar = ListTile(
                      leading: Icon(
                        Icons.search,
                        color: ColorManager.white,
                        size: 28.sp,
                      ),
                      title: TextField(
                        controller: _textContoller,
                        decoration: InputDecoration(
                          hintText: 'Search Doctor Name',
                          hintStyle: TextStyle(
                            color: ColorManager.white,
                            fontSize: 13.sp,
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: ColorManager.white,
                        ),
                        onChanged: (query) {
                          search(query);
                        },
                      ),
                    );
                  } else {
                    customIcon = const Icon(Icons.search);
                    customSearchBar = const Text('Doctors');
                  }
                });
              },
              icon: customIcon)
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 0.w, bottom: 15.w),
            child: SizedBox(
              height: 40.h,
              width: double.infinity,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _categoryText.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? EdgeInsets.only(left: 25.w, right: 10.w)
                        : EdgeInsets.only(right: 10.w),
                    child: GestureDetector(
                      onTap: () => _selectCategory(index),
                      child: Container(
                        height: 20.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.w),
                          color: _category == index
                              ? ColorManager.darkblue
                              : ColorManager.white,
                          border: Border.all(color: ColorManager.bordercolor),
                        ),
                        child: Center(
                          child: Text(
                            _categoryText[index],
                            style: regularTextStyle(
                                color: _category == index
                                    ? ColorManager.white
                                    : ColorManager.black,
                                fontSize: 14.sp,
                                fontWeight: _category == index
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return Padding(
                  padding: index == 0
                      ? EdgeInsets.only(bottom: 17.h, left: 25.w, top: 20.h)
                      : EdgeInsets.only(bottom: 17.h, left: 25.w, top: 0.h),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorDetailScreen(
                              Image.asset(
                                doctor.image.toString(),
                              ),
                              (doctor.name).toString(),
                            ),
                          ));
                    },
                    child: Row(
                      children: [
                        Image.asset((doctor.image).toString()),
                        buildSizedBoxSpacer(
                          width: 20.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (doctor.name).toString(),
                              style: regularTextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 19.sp,
                                color: ColorManager.darkblack,
                              ),
                            ),
                            buildSizedBoxSpacer(height: 3.h),
                            Text(
                              StringManager.cardiologistinapolohospital,
                              style: regularTextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: ColorManager.settingiconcolor,
                              ),
                            ),
                            buildSizedBoxSpacer(height: 7.h),
                            starandsearch
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
