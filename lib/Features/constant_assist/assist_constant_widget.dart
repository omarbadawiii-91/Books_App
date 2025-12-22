import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Constantwidgetrepeated {
  Constantwidgetrepeated();
  String logo ="assets/images/Group.svg";
  LinearGradient screencolor=LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
       const Color.fromARGB(255, 8, 7, 7),
      const Color.fromARGB(255, 10, 179, 170),
     
  ]) ;
}

abstract class Calssficationtext{
static TextStyle text1=TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold);

}