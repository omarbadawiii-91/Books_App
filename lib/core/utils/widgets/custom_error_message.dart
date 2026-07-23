import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomErrorMessage extends StatelessWidget {
  CustomErrorMessage({required this.errormessage, super.key});
  String errormessage;
  @override
  Widget build(BuildContext context) {
    return Text(errormessage);
  }
}
