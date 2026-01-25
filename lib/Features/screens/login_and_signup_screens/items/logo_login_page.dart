import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logologinpage extends StatelessWidget {
  const Logologinpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 80.h),
      child: Center(
        child: CircleAvatar(
          radius: 70.r,
          backgroundImage: AssetImage("assets/images/shelf help logo.png"),
          backgroundColor: const Color.fromARGB(0, 3, 33, 41),
        ),
      ),
    );
  }
}