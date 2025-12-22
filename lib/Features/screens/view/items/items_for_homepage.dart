import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Bestseller extends StatefulWidget {
  const Bestseller({super.key});

  @override
  State<Bestseller> createState() => _BestsellerState();
}

class _BestsellerState extends State<Bestseller> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder:(context,index)=>
        Padding(
          padding: EdgeInsets.all(1.0),
          child: Container(
            color: const Color.fromARGB(255, 240, 248, 255),
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png")
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Book Name",style: GoogleFonts.poppins(fontSize: 20.sp,fontWeight: FontWeight.bold),),
                ),
         ] ),
        )
         ),
    ));
  }
}