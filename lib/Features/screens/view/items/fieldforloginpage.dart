import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Itemforlogin extends StatefulWidget {
  String? text;
  Icon ?icon;
   Itemforlogin( {super.key, required this.text,required this.icon});

  @override
  State<Itemforlogin> createState() => _ItemforloginState();
}

class _ItemforloginState extends State<Itemforlogin> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          filled: true,
          fillColor: const Color.fromARGB(43, 174, 175, 175),
          hintTextDirection: TextDirection.ltr,
          labelText: widget.text,
          suffix: Icon(widget.icon!.icon,color: Colors.black,),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(137, 125, 126, 125)),
            borderRadius: BorderRadius.circular(20.r),gapPadding: 10.w,),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(117, 0, 0, 0)),
            borderRadius: BorderRadius.circular(20.r),gapPadding: 10.w,),
       
        ),
      ),
    );
  }
}