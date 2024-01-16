import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'admin/email_verification_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();

  Future<void> _resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text.trim());
      // Navigate to password reset confirmation page
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResetPasswordConfirmationPage()),
      );
    } catch (e) {
      // Handle password reset errors
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.green,
                size: 30,
              ),
            ),
            SizedBox(height: 50.h),
            Text(
              "Forgot \nPassword",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 30.sp),
            ),
            const Spacer(),
            Container(
              width: 380.w,
              height: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(width: 1, color: Colors.black),
                  shape: BoxShape.rectangle,
                  color: const Color.fromARGB(255, 84, 87, 103)),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: _emailController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 15.h),
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintStyle: const TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: _resetPassword,
              child: Container(
                height: 55.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(40.r)),
                child: Center(
                  child: Text(
                    'Send',
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const LoginScreen()));
                },
                child: Text(
                  'Signin',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp),
                ),
              ),
            ),
            SizedBox(height: 20.h)
          ],
        ),
      ),
    ));
  }
}
