
import 'package:books_app/Features/constant_assist_for_two_screen/custom_error_message.dart';
import 'package:books_app/data/manger_view_model/all_cubits/cubit_allbooks/allbook_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Showbookes extends StatefulWidget {
  const Showbookes({super.key});
  @override
  State<Showbookes> createState() => _ShowbookesState();
}

class _ShowbookesState extends State<Showbookes> {
  @override
  void initState() {
    super.initState();
    AllbooksCubit.get(context).fetchAllBooks("filter=free-ebooks&q=all");
  }
  @override
  Widget build(BuildContext context) {
    CarouselSliderController? carouselSliderController;
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15.h,
          width: MediaQuery.of(context).size.width,
          child:  BlocBuilder<AllbooksCubit, AllbookscubitState>(
                  builder: (context, state) {
                    if (state is AllbookscubitStateSuccess) {
                      return CarouselSlider.builder(
                        carouselController: carouselSliderController,
                        itemCount:state.viewbooks.length, 
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
                                  image: DecorationImage(
                                    image: Image.network(state.viewbooks[index].items![0].volumeInfo!.imageLinks!.thumbnail!).image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              
                              ),
                            ),
                          );
                        },
                      );
                    }
                    else if (state is AllbookscubitStateError){
                      return CustomErrorMessage(errormessage: state.errormessage);
                    }
                    else{
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 201, 200, 196),
                        ),
                      );
                    }
                  }
                )
           
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
