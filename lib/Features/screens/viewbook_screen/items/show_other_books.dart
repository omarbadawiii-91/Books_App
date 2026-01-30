import 'package:books_app/data/manger_view_model/all_cubits/cubit_similar_books/similar_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ShowOtherBooks extends StatefulWidget {
   const ShowOtherBooks({super.key});
  @override
  State<ShowOtherBooks> createState() => _ShowOtherBooksState();
}

class _ShowOtherBooksState extends State<ShowOtherBooks> {
  CarouselSliderController? carouselSliderController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15.h,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
            builder: (context, state) {
              if (state is SimilarBooksSuccess) {
                return CarouselSlider.builder(
                carouselController: carouselSliderController,
                itemCount: state.books.items!.length,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.4,
                  height: 200.h,
                  scrollDirection: Axis.horizontal,
                ),
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        height: 200.h,
                        width: 100.w,
                       child: CachedNetworkImage(imageUrl: state.books.items![index].volumeInfo!.imageLinks!.thumbnail!, fit: BoxFit.fill,),
                      ),
                    ),
                  );
                },
              );
              }
              else if (state is SimilarBooksError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
