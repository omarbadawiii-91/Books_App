import 'package:books_app/Features/screens/login_and_signup_screens/items/fieldforloginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Field_for_password extends StatelessWidget {
  const Field_for_password({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Fieldfortext(
        text: "Password",
        icon: Icon(Icons.remove_red_eye_outlined),
        controller: passwordController,
        validator: (Value) => Value!.isEmpty ? "Please Enter Password" : null,
      ),
    );
  }
}
