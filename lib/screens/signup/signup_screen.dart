import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventra_pro/screens/login/login_screen.dart';

import '../email_verification_screen.dart';
import '../utils/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> _signUp() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // Map<String, dynamic> data = {
      //   'firstname': '',
      //   'secondname ': '',
      //   'email': '',
      //   'phone': '',
      //   'profission': '',
      //   'profile': 'false',
      // };

      // FirebaseFirestore.instance
      //         .collection('Profile')
      //         .doc(FirebaseAuth.instance.currentUser!.uid)
      //         .set(data)
      // .whenComplete(
      //     () => FirebaseAuth.instance.currentUser!.updateDisplayName(
      //           secondnamecontroller.text,
      //         )
      // )
      // ;

      User? user = userCredential.user;
      if (user != null) {
        await user.sendEmailVerification();
        // Navigate to email verification page
        Get.to(const LoginScreen());
      }
    } catch (e) {
      // Handle signup errors
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Text(
            'Create an Account',
            style: TextStyle(
                color: Colors.black,
                fontSize: 35.sp,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 70.h),
          Text(
            'Sign Up',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
          SizedBox(
            height: 15.h,
          ),
          Form(
            key: _formkey,
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 50.h,
                    width: 330.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(width: 1.w, color: Colors.blue)),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: nameController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 15.h),
                          labelText: 'Name',
                          labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          hintStyle: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Container(
                    height: 50.h,
                    width: 330.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(width: 1.w, color: Colors.blue)),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: phoneController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 15.h),
                          labelText: 'Phone',
                          labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          hintStyle: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Container(
                    height: 50.h,
                    width: 330.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(width: 1.w, color: Colors.blue)),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 15.h),
                          labelText: 'Login ID',
                          labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintStyle: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Container(
                    height: 50.h,
                    width: 330.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(width: 1.w, color: Colors.blue)),
                    child: TextFormField(
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 15.h),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Colors.white,
                          ),
                          hintStyle: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          InkWell(
            onTap: () async {
              if (_formkey.currentState!.validate()) {
                setState(() {
                  loading = true;
                });
              }
              try {
                await _signUp();
              } on FirebaseAuthException catch (e) {
                Utils().toastMessage(e.message.toString());
                setState(() {
                  loading = false;
                });
              }
            },
            child: Container(
              height: 50.h,
              width: 300.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.green),
              child: Center(
                  child: loading
                      ? const CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.white,
                        )
                      : Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        )),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Get.to(const LoginScreen());
            },
            child: Text(
              'Already have an account',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    ));
  }
}
