import 'package:books_app/Features/screens/homepage_screen/item_search_for_books/show_search.dart';
import 'package:books_app/data/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: must_be_immutable
class Topscreen extends StatefulWidget {
   Topscreen({super.key, this.bookmodel});
BookModel ? bookmodel;
String ? querytext;
  @override
  State<Topscreen> createState() => _TopscreenState();
}

class _TopscreenState extends State<Topscreen> {
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
              showSearch(context: context, delegate: Showsearch(bookmodel: widget.bookmodel, ));
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