import 'package:books_app/Features/constant_assist_for_two_screen/texts.dart';
import 'package:books_app/data/book_model/book_model.dart';
import 'package:books_app/data/manger_view_model/all_cubits/cubit_similar_books/similar_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Showbook extends StatefulWidget {
  Showbook({super.key, this.bookmodel, this.index = 0});
  final BookModel? bookmodel;
  int index;
  @override
  State<Showbook> createState() => _ShowbookState();
}

class _ShowbookState extends State<Showbook> {
  
  @override
  void initState() {
    super.initState();
    SimilarBooksCubit.get(context).fetchSimilarBooks(widget.bookmodel?.items?[widget.index].volumeInfo?.categories != null ? widget.bookmodel!.items![widget.index].volumeInfo!.categories![0] : "Programming");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            SizedBox(
              height: 160.h,
              width: MediaQuery.of(context).size.width * 0.35.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl: widget.bookmodel?.items?[widget.index].volumeInfo?.imageLinks?.thumbnail ?? '',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8.w,
                child: Center(
                  child: Texts.headertitle(
                  widget.bookmodel?.items?[widget.index].volumeInfo?.title ?? 'No Title',
                  20.sp,
                  3,
                ),
                )
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Center(
                child: Texts.anytext(
                  widget.bookmodel?.items?[widget.index].volumeInfo?.authors?[0] ?? 'No Author',
                  15.sp,
                ),
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 30),
                SizedBox(width: 5.w),
                Texts.rating("4.5", 18.sp),
                SizedBox(width: 10.w),
              ],
            ),
          ],
        );
     
  }
}
