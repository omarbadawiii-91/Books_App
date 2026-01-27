import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
   CustomErrorMessage({required this.errormessage,super.key});
 String errormessage;
  @override
  Widget build(BuildContext context) {
    return  Text(errormessage);
  }
}