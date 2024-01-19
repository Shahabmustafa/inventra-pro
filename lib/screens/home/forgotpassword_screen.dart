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
      _emailController.clear();
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
          appBar: AppBar(
            title: Text("Forget Password"),
          ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Forgot Password",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.black),
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintStyle: const TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 80,
            ),
            InkWell(
              onTap: _resetPassword,
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40.r)),
                child: Center(
                  child: Text(
                    'Send',
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
