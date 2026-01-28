import 'package:books_app/Features/constant_assist_for_two_screen/assist_constant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: Constantwidgetrepeated().screencolor,
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                  width: MediaQuery.of(context).size.width * 0.8.w,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: false,
                      prefixIcon: IconButton(
                        onPressed: () {
                          GoRouter.of(context).pushReplacement('/homepage');
                        },
                        icon: Icon(Icons.clear),
                      ),
                      prefixIconColor: const Color.fromARGB(157, 90, 85, 85),
                      suffixIcon: Icon(Icons.search),
                      suffixIconColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        gapPadding: 10.w,
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      hintText: "Search",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
