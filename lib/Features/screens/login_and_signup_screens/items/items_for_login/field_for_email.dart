import 'package:books_app/Features/screens/login_and_signup_screens/items/fieldforloginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Field_for_email extends StatelessWidget {
  const Field_for_email({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Fieldfortext(
        text: "Email Address",
        icon: Icon(Icons.email),
        controller: emailController,
        validator: (Value) =>
            Value!.isEmpty ? "Please Enter Email Address" : null,
      ),
    );
  }
}