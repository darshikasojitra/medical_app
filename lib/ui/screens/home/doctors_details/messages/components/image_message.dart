
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/resources/resources.dart';

class ImageMessage extends StatelessWidget {
  final String path;
  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>? snapshot;
  QuerySnapshot<Map<String, dynamic>>? data;
   ImageMessage({
    Key? key,
    required this.isSender,
    required this.path,
     this.snapshot,
     this.data,
  }) : super(key: key);

  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        height: 150.h,
        width: 200.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
            width: 2,
            color: isSender ? ColorManager.darkblue : ColorManager.lightyellow,
          ),
          color: isSender ? ColorManager.darkblue : ColorManager.lightyellow,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(15.w),
          ),
          child: 
          Image.network(
            path,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}