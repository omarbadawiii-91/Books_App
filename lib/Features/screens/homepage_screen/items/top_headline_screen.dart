import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Topscreen extends StatelessWidget {
  const Topscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15.h, left: 0.w),
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
          ),
        ),
        SizedBox(width: 180.w),
        Padding(
          padding: EdgeInsets.only(top: 15.h, left: 10.w),
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).push('/searchpage');
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
