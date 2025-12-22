import 'package:books_app/Features/constant_assist/assist_constant_widget.dart';
import 'package:books_app/Features/screens/view/items/items_for_homepage.dart';
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
    var theme = Theme(data:ThemeData(primaryColor: const Color.fromARGB(255, 255, 255, 255)) , child: Text("Best Seller",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),));
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: Constantwidgetrepeated().screencolor,
     ),
     child:
     Column(
       children: [
         Topscreen(),
         Showbookes(),
        Padding(
          padding:  EdgeInsets.only(top: 15.h,left: 20.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: theme),
        ),
        Bestseller()

         ],
     ),
      ),
    );
  }
}

class Showbookes extends StatelessWidget {
  const Showbookes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.15.h,
     width: MediaQuery.of(context).size.width,
      child: ListView.builder(
       scrollDirection: Axis.horizontal,
       itemCount: 10,
       itemBuilder:(context,index)=>
        Padding(
          padding: EdgeInsets.all(8.0),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: 200.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber
            )
            ),
          ),
        )
           ),
    );
  }
}

class Topscreen extends StatelessWidget {
  const Topscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
       Padding(
         padding:EdgeInsets.only(top: 15.h,right: 70.w),
         child: Container(
           height: 100.h,
           width: 120.w,
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage("assets/images/logo.png")
             )
           ),
         ),
       ),
     Padding(
       padding: EdgeInsets.only(top: 15.h,left: 100.w),
       child: IconButton(onPressed:(){}, icon: Icon(Icons.search,color: Colors.white,size: 30,fontWeight: FontWeight.bold)),
     )
     ],
    );
  }
}