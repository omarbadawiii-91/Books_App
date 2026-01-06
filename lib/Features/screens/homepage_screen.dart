import 'package:books_app/Features/constant_assist/assist_constant_widget.dart';
import 'package:books_app/Features/screens/signup.dart';
import 'package:books_app/Features/screens/view/items/best_seller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme(
      data: ThemeData(primaryColor: const Color.fromARGB(255, 255, 255, 255)),
      child: Text(
        "Best Seller",
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: Constantwidgetrepeated().screencolor,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Topscreen(),
                  Showbookes(),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h, left: 20.w),
                    child: Align(alignment: Alignment.centerLeft, child: theme),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: Bestseller()),
          ],
        ),
      ),
    );
  }
}

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

class Topscreen extends StatelessWidget {
  const Topscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15.h, right: 70.w),
          child: Container(
            height: 100.h,
            width: 120.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.h, left: 100.w),
          child: IconButton(
            onPressed: () {},
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
