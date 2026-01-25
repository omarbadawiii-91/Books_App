import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Showbookes extends StatelessWidget {
  const Showbookes({super.key});

  @override
  Widget build(BuildContext context) {
    CarouselSliderController? carouselSliderController;
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
        const SizedBox(height: 30),
        AnimatedSmoothIndicator(
          activeIndex: 0,
          count: 5,
          effect: JumpingDotEffect(
            dotHeight: 10.h,
            dotWidth: 10.w,
            dotColor: Colors.grey,
            activeDotColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
