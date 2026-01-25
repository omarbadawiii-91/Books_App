import 'package:books_app/Features/constant_assist_for_two_screen/assist_constant_widget.dart';
import 'package:books_app/Features/screens/homepage_screen/items/best_seller.dart';
import 'package:books_app/Features/screens/homepage_screen/items/showbooks_top_screen.dart';
import 'package:books_app/Features/screens/homepage_screen/items/top_headline_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        "Newest Books",
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

