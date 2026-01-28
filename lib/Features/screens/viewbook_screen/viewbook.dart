import 'package:books_app/Features/constant_assist_for_two_screen/assist_constant_widget.dart';
import 'package:books_app/Features/constant_assist_for_two_screen/texts.dart';
import 'package:books_app/Features/screens/viewbook_screen/items/custombutton.dart';
import 'package:books_app/Features/screens/viewbook_screen/items/show_book.dart';
import 'package:books_app/Features/screens/viewbook_screen/items/show_other_books.dart';
import 'package:books_app/Features/screens/viewbook_screen/items/top_line_view_book_screen.dart';
import 'package:books_app/data/book_model/book_model.dart';
import 'package:books_app/data/manger_view_model/cubit_similar_books/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Viewbook extends StatefulWidget {
   Viewbook({super.key, this.bookmodel});
   BookModel? bookmodel;
  @override
  State<Viewbook> createState() => _ViewbookState();
}

class _ViewbookState extends State<Viewbook> {
 @override
  void initState() {
    super.initState();
    SimilarBooksCubit.get(context).fetchSimilarBooks(
      widget.bookmodel?.items?[0].volumeInfo?.categories != null
          ? widget.bookmodel!.items![0].volumeInfo!.categories![0]
          : "Programming",
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: Constantwidgetrepeated().screencolor,
        ),
        child: 
               Column(
                  children: [
                    Top_line_view_book(),
                    Showbook(),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.only(bottom: 35.h),
                      child: Custombutton(),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 22.w),
                        child: Texts.anytext("You can also read : ", 15.sp),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    ShowOtherBooks(),
                  ],
                ),
      ),
    );
  }
}


