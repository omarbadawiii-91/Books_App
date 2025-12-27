import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Fieldfortext extends StatefulWidget {
  bool ?obscureText;
  String? text;
  Icon ?icon;
  String? Function(String?)? validator;
  TextEditingController? controller;
   Fieldfortext( {super.key, required this.text, this.icon,required this.controller,required this.validator,this.obscureText=false});

  @override
  State<Fieldfortext> createState() => _FieldfortextState();
}

class _FieldfortextState extends State<Fieldfortext> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText! ,
      validator: (widget.validator),
      style: TextStyle(color: Colors.black,fontSize: 15.sp),
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        filled: true,
        fillColor: const Color.fromARGB(43, 174, 175, 175),
        hintTextDirection: TextDirection.ltr,
        labelText: widget.text,
        suffix: Icon(widget.icon!.icon,color: Colors.black,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),gapPadding: 10.w,),
      
     
      ),
    );
  }
}