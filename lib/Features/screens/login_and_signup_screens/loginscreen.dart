import 'package:books_app/Features/constant_assist_for_two_screen/assist_constant_widget.dart';
import 'package:books_app/Features/screens/homepage_screen/homepage_screen.dart';
import 'package:books_app/Features/screens/login_and_signup_screens/items/items_for_login/field_for_email.dart';
import 'package:books_app/Features/screens/login_and_signup_screens/items/items_for_login/field_for_password.dart';
import 'package:books_app/Features/screens/login_and_signup_screens/items/items_for_login/login_word.dart';
import 'package:books_app/Features/screens/login_and_signup_screens/items/items_for_login/welcome_word.dart';
import 'package:books_app/Features/screens/login_and_signup_screens/items/logo_login_page.dart';
import 'package:books_app/Features/screens/login_and_signup_screens/items/show_dialog_for_check.dart';
import 'package:books_app/Features/screens/login_and_signup_screens/signup.dart';
import 'package:books_app/Features/screens/login_and_signup_screens/items/login_with_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
                Welcome_word(),
                Login_word(),
                Field_for_email(emailController: emailController),
                Field_for_password(passwordController: passwordController),
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
                         Check_user().messagesforemail(
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
                           Check_user().messagesalert(
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
                             Check_user().messagesforemail(
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
                            GoRouter.of(context).pushReplacement("/homepage");
                            setState(() {
                              isLoading = false;
                            });
                          } else {
                           Check_user().messagesforemail(
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
                             Check_user().messagesforemail(
                                "Email Address is not found. Please try again!",
                                context,
                              );
                            } else if (e.code == 'wrong-password') {
                             Check_user().messagesforpassword(
                                "Password is wrong. Please try again!",
                                context,
                              );
                            } else if (e.code ==
                                'The email address is badly formatted') {
                             Check_user().messagesforpassword(
                                "Email Address is not valid.",
                                context,
                              );
                            } else if (e.code ==
                                "The supplied auth credential is incorrect, malformed or has expired.") {
                             Check_user().messagesforemail(
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