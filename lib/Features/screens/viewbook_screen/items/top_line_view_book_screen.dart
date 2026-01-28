import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Top_line_view_book extends StatelessWidget {
  const Top_line_view_book({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, left: 20.w),
            child: IconButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement('/homepage');
              },
              icon: Icon(
                Icons.clear_outlined,
                color: Colors.white,
                size: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 215.w),
          Padding(
            padding: EdgeInsets.only(top: 15.h, left: 20.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
