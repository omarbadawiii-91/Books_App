import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Check_user {
  Check_user();
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
