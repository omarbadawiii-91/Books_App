import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          child: CarouselSlider.builder(
            carouselController: carouselSliderController,
            itemCount: 15,
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}