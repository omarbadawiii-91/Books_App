import 'package:books_app/Features/constant_assist_for_two_screen/assist_constant_widget.dart';
import 'package:books_app/Features/constant_assist_for_two_screen/texts.dart';
import 'package:books_app/Features/screens/viewbook_screen/items/custombutton.dart';
import 'package:books_app/Features/screens/viewbook_screen/items/show_other_books.dart';
import 'package:books_app/Features/screens/viewbook_screen/items/top_line_view_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Viewbook extends StatefulWidget {
  const Viewbook({super.key});

  @override
  State<Viewbook> createState() => _ViewbookState();
}

class _ViewbookState extends State<Viewbook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: Constantwidgetrepeated().screencolor,
        ),
        child: Column(
          children: [
            Top_line_view_book(),
            Container(
              height: 160.h,
              width: MediaQuery.of(context).size.width*0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/7813793.jpg"),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Texts.headertitle("Book Name"),
          SizedBox(
            height: 10.h,
          ),
            Padding(padding: EdgeInsets.only(bottom: 10.h),
            child: Texts.subtitle("Author Name"),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 30,),
             Texts.rating("4.9", 25),
             SizedBox(
              width: 10.w,
             ),
              Texts.rating("(222)", 15),
            ]),
            SizedBox(
              height: 30.h,
            )
            , Padding(
              padding: EdgeInsets.only(bottom: 35.h),
              child: Custombutton()),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 22.w),
                child: Texts.anytext("You can also read : ", 15.sp),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ShowOtherBooks()
          ],
        ),
      ),
    );
  }
}

