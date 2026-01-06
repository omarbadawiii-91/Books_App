import 'package:books_app/Features/constant_assist/assist_constant_widget.dart';
import 'package:books_app/Features/screens/homepage_screen.dart';
import 'package:books_app/Features/screens/signup.dart';
import 'package:books_app/Features/screens/view/items/fieldforloginpage.dart';
import 'package:books_app/Features/screens/view/items/login_with_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  bool isLoading = false;
  @override
  bool mounted = false;
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
                  padding: EdgeInsets.only(top: 11.h),
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
                    padding: EdgeInsets.only(top: 50.h, left: 20.w),
                    child: Text(
                      "Login",
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
                    text: "Email Address",
                    icon: Icon(Icons.email),
                    controller: emailController,
                    validator: (Value) =>
                        Value!.isEmpty ? "Please Enter Email Address" : null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Fieldfortext(
                    text: "Password",
                    icon: Icon(Icons.remove_red_eye_outlined),
                    controller: passwordController,
                    validator: (Value) =>
                        Value!.isEmpty ? "Please Enter Password" : null,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0.h, right: 20.w),
                    child: InkWell(
                      onTap: () async {
                        if (mounted) {
                          setState(() {
                            isLoading = true;
                          });
                        }
                        if (emailController.text.isEmpty) {
                          Constantwidgetrepeated().messagesforemail(
                            "Please enter your email to reset password.",
                            context,
                          );
                          setState(() {
                            isLoading = false;
                          });
                        }
                        try {
                          if (context.mounted) {
                            await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: emailController.text.trim(),
                            );
                            Constantwidgetrepeated().messagesalert(
                              "Password reset email sent! Please check your email.",
                              context,
                            );
                            setState(() {
                              isLoading = false;
                            });
                          }
                        } catch (e) {
                          if (mounted) {
                            if (e == 'user-not-found') {
                              Constantwidgetrepeated().messagesforemail(
                                " Email not found.",
                                context,
                              );
                              dispose();
                            }
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Button(
                    text: "Login",
                    color: Colors.cyan,
                    width: 200,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          var userCredential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                          if (userCredential.user!.emailVerified) {
                            if (context.mounted) {
                              setState(() {
                                isLoading = true;
                              });
                            }
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomepageScreen(),
                              ),
                            );
                          } else {
                            Constantwidgetrepeated().messagesforemail(
                              "Email is not verified. Please verify your email.",
                              context,
                            );
                          }
                        } on FirebaseAuthException catch (e) {
                          if (mounted) {
                            setState(() {
                              isLoading = false;
                            });
                          }
                          if (context.mounted) {
                            if (e.code == 'user-not-found' ||
                                e.code == 'invalid-email') {
                              Constantwidgetrepeated().messagesforemail(
                                "Email Address is not found. Please try again!",
                                context,
                              );
                            } else if (e.code == 'wrong-password') {
                              Constantwidgetrepeated().messagesforpassword(
                                "Password is wrong. Please try again!",
                                context,
                              );
                            } else if (e.code ==
                                'The email address is badly formatted') {
                              Constantwidgetrepeated().messagesforpassword(
                                "Email Address is not valid.",
                                context,
                              );
                            } else if (e.code ==
                                "The supplied auth credential is incorrect, malformed or has expired.") {
                              Constantwidgetrepeated().messagesforemail(
                                "Email Address is not found. Please try again!",
                                context,
                              );
                            }
                          }
                        }
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: InkWell(
                    onTap: () {
                      if (Authgoogle().signInWithGoogle() != Null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomepageScreen(),
                          ),
                        );
                        if (mounted) {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },
                    child: Container(
                      height: 40.h,
                      width: 210.w,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 97, 28, 6),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login With",
                            style: GoogleFonts.poppins(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Image.asset(
                              "assets/images/google-logo-9808 1.png",
                              height: 30.h,
                              width: 30.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        children: [
                          TextSpan(
                            text: "Sign Up",
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
