import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class Constantwidgetrepeated {
  Constantwidgetrepeated({this.text, this.color, this.width});
  Color ?color;
  String ?text;
  double ?width;
  String logo ="assets/images/logo.png";
  LinearGradient screencolor=LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
       const Color.fromARGB(255, 8, 7, 7),
      const Color.fromARGB(255, 10, 179, 170),
  ]) ;
   late Widget buttton =InkWell(
     onTap: (){},
     child: Container(
      height: 40.h,
      width: width!.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50.r),
      ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text(text!,style: GoogleFonts.poppins(fontSize: 18.sp,fontWeight: FontWeight.w400,color: const Color.fromARGB(255, 255, 255, 255)),))
            ],
          ),
       ),
   );
}

