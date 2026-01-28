import 'package:books_app/Features/constant_assist_for_two_screen/texts.dart';
import 'package:books_app/data/manger_view_model/all_cubits/cubit_allbooks/allbook_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Showbook extends StatefulWidget {
  Showbook({super.key});

  @override
  State<Showbook> createState() => _ShowbookState();
}

class _ShowbookState extends State<Showbook> {
  
  @override
  void initState() {
    super.initState();
    AllbooksCubit.get(context).fetchAllBooks("filter=free-ebooks&q=all");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllbooksCubit, AllbookscubitState>(
      builder: (context, state) {
        if(state is AllbookscubitStateSuccess){
          return Column(
          children: [
            SizedBox(
              height: 160.h,
              width: MediaQuery.of(context).size.width * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl: state.viewbooks.items![0].volumeInfo!.imageLinks!.thumbnail!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Texts.headertitle("Book Name"),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Texts.subtitle("Author Name", 15.sp),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 30),
                Texts.rating("4.9", 25),
                SizedBox(width: 10.w),
                Texts.rating("(222)", 15),
              ],
            ),
          ],
        );
        }
        else if(state is AllbookscubitStateError){
          return const Center(child: Text("Error"));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
