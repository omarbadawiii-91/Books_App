import 'package:books_app/Features/constant_assist/assist_constant_widget.dart';
import 'package:books_app/Features/screens/view/items/fieldforloginpage.dart';
import'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Logologinpage(),
            Padding(
              padding:  EdgeInsets.only(top:20.h),
              child: Text("Welcome To Booke App",style: GoogleFonts.poppins(fontSize: 20.sp,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 0, 0, 0)),),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:  EdgeInsets.only(top: 50.h,left: 20.w),
                child: Text("Login",style: GoogleFonts.poppins(fontSize: 20.sp,fontWeight: FontWeight.w600,color: const Color.fromARGB(255, 0, 0, 0)),),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(15),
              child: Itemforlogin(text: "Email Address",icon: Icon(Icons.email),),
            ),
            Padding(
              padding:  EdgeInsets.all(15),
              child: Itemforlogin(text: "Password",icon: Icon(Icons.remove_red_eye_outlined),),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(padding: EdgeInsets.only(top: 0.h,right: 20.w),
              child: Text("Forgot Password?",style: GoogleFonts.roboto(fontSize: 12.sp,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 0, 0, 0)),),),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Constantwidgetrepeated(text: "Login",color: Colors.cyan,width: 200).buttton,
            ),
             Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: InkWell(
                onTap: (){},
                child: Container(
                  height:40.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 97, 28, 6),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text( "Login With",style: GoogleFonts.poppins(fontSize: 19.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                        Padding(
                          padding:  EdgeInsets.only(left: 15.w),
                          child: Image.asset("assets/images/google-logo-9808 1.png",height: 30.h,width: 30.w,),
                        )
                      ],
                    ),
                ),
              )
            ),
            Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Text.rich( TextSpan(
                text: "Don't have an account? ",
                style: GoogleFonts.poppins(fontSize: 15.sp,fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 0, 0, 0)),
                children: [
                  TextSpan(
                    text: "Sign Up",
                    style: GoogleFonts.poppins(fontSize: 15.sp,fontWeight: FontWeight.w500,color: Colors.cyan),)
                        ],
                      ),
                    ),
            )
          ],
        ),
      ),
    );
    
  }
}

class Logologinpage extends StatelessWidget {
  const Logologinpage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 80.h),
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