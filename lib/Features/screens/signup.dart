import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:books_app/Features/constant_assist/assist_constant_widget.dart';
import 'package:books_app/Features/screens/loginscreen.dart';
import 'package:books_app/Features/screens/view/items/fieldforloginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool is_obscure_text = true;
  String username() {
    return usernameController.text;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(color: Colors.cyan),
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Logologinpage(),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Text(
                    "Welcome To Booke App",
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 20.w),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Fieldfortext(
                    text: "Username",
                    icon: Icon(Icons.person),
                    controller: usernameController,
                    validator: (Value) =>
                        Value!.isEmpty ? "Enter username" : null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Fieldfortext(
                    text: "Email Address",
                    icon: Icon(Icons.email),
                    controller: emailController,
                    validator: (Value) => Value!.isEmpty ? "Enter email" : null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Fieldfortext(
                    text: "Password",
                    icon: Icon(Icons.remove_red_eye_outlined),
                    controller: passwordController,
                    validator: (Value) =>
                        Value!.isEmpty ? "Enter password" : null,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Button(
                    text: "Sign Up",
                    color: Colors.cyan,
                    width: 200,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                          Future.delayed(Duration(seconds: 1));
                          await FirebaseAuth.instance.currentUser!
                              .sendEmailVerification();
                          isLoading = false;
                          setState(() {});
                          GoRouter.of(context).go('/login');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            Constantwidgetrepeated().messagesforpassword(
                              "The password provided is too weak.",
                              context,
                            );
                          } else if (e.code == 'email-already-in-use') {
                            Constantwidgetrepeated().messagesforemail(
                              "The account already exists for that email.",
                              context,
                            );
                          } else if (e.code ==
                              "Password should be at least 6 characters") {
                            Constantwidgetrepeated().messagesforpassword(
                              "Password should be at least 6 characters",
                              context,
                            );
                          } else if (e.code == "invalid-email") {
                            Constantwidgetrepeated().messagesforemail(
                              "The email address is not valid.",
                              context,
                            );
                          }
                        } catch (e) {
                          print(e);
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Loginscreen()),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Have an account? ",
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        children: [
                          TextSpan(
                            text: "Login",
                            style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.cyan,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Logologinpage extends StatelessWidget {
  const Logologinpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 80.h),
      child: Center(
        child: CircleAvatar(
          radius: 70.r,
          backgroundImage: AssetImage("assets/images/shelf help logo.png"),
          backgroundColor: const Color.fromARGB(0, 3, 33, 41),
        ),
      ),
    );
  }
}
