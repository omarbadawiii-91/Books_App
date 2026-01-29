// ignore_for_file: file_names

import 'package:books_app/Features/constant_assist_for_two_screen/texts.dart';
import 'package:books_app/Features/screens/viewbook_screen/viewbook.dart';
import 'package:books_app/data/manger_view_model/all_cubits/cubit_newest_boook/newestbooks_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
class Newestbook extends StatefulWidget {
  const Newestbook({super.key});

  @override
  State<Newestbook> createState() => _NewestbookState();
}

class _NewestbookState extends State<Newestbook> {
  @override
  void initState() {
    super.initState();
    NewestbooksCubit.get(context).fetchNewestBooks("filter=free-ebooks&Sorting=newest&q=all");
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<NewestbooksCubit, NewestbooksState>(
      builder: (context, state) {
        if (state is NewestbooksSuccess) {
        return ListView.builder(
          itemCount: state.booksmodel.items!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Viewbook(bookmodel: state.booksmodel,index: index,)));
              },
              child:
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 13.w),
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: CachedNetworkImage(
                          imageUrl: state.booksmodel.items![index].volumeInfo!.imageLinks!.thumbnail!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5.w,
                          child: Texts.headertitle(state.booksmodel.items![index].volumeInfo!.title!, 16.sp),
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5.w,
                          child:  Row(
  children: [
    SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Text(
        state.booksmodel.items![index].volumeInfo?.authors?.isNotEmpty == true
            ? state.booksmodel.items![index].volumeInfo!.authors![0]
            : " No Author",  
      
        style: TextStyle(fontSize: 12.sp),
      ),
    ),
    SizedBox(width: 30),
    SizedBox(
      width: MediaQuery.of(context).size.width * 0.1.w,
      child: Texts.anytext("Free", 16.sp),
    ),
  ],
),
                        )
                      ],
                    ),
                  ),
              ])
            ),
          ),
        );
      }
      else if (state is NewestbooksError) {
        return Center(child: Text(state.errormessage));
      } else {
        return  SizedBox(
          height: 200.h,
          child: Align(
            alignment: Alignment.center,
            child: Center(child: CircularProgressIndicator())),
        );
      }
      }
    );
  }
}
