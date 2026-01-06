import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  Button({
    super.key,
    required this.width,
    required this.color,
    required this.text,
    required this.onTap,
  });
  GestureTapCallback? onTap;
  final double? width;
  final Color? color;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
            Center(
              child: Text(
                text!,
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Constantwidgetrepeated {
  Constantwidgetrepeated();

  LinearGradient screencolor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color.fromARGB(255, 8, 7, 7),
      const Color.fromARGB(255, 10, 179, 170),
    ],
  );

  Future<void> messagesforemail(String message, BuildContext context) async {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Error',
      headerAnimationLoop: true,
      customHeader: Icon(Icons.error_outline, size: 80, color: Colors.red),
      desc: message,
      descTextStyle: TextStyle(
        color: const Color.fromARGB(255, 255, 255, 255),
        fontSize: 15.sp,
      ),
      btnOkOnPress: () {},
    ).show();
  }

  Future<void> messagesforpassword(String message, BuildContext context) async {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Error',
      headerAnimationLoop: true,
      customHeader: Icon(Icons.error_outline, size: 80, color: Colors.red),
      desc: message,
      descTextStyle: TextStyle(
        color: const Color.fromARGB(255, 255, 255, 255),
        fontSize: 15.sp,
      ),
      btnOkOnPress: () {},
    ).show();
  }

  Future<void> messagesforsuccess(String message, BuildContext context) async {
    if (context.mounted) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Success',
        headerAnimationLoop: true,
        customHeader: Icon(
          Icons.check_outlined,
          size: 80,
          color: const Color.fromARGB(255, 0, 143, 12),
        ),
        desc: message,
        descTextStyle: TextStyle(
          color: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 15.sp,
        ),
        btnOkOnPress: () {
          Navigator.pop(context);
        },
      ).show();
    }
  }

  Future<void> messagesalert(String message, BuildContext context) async {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Alert',
      headerAnimationLoop: true,
      customHeader: Icon(
        Icons.error_outline,
        size: 80,
        color: const Color.fromARGB(255, 88, 59, 5),
      ),
    ).show();
  }
}
