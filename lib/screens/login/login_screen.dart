import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventra_pro/screens/home/admin/admin_screen.dart';
import 'package:inventra_pro/screens/home/home_screen.dart';
import 'package:inventra_pro/screens/signup/signup_screen.dart';

import '../home/forgotpassword_screen.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Inventa',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  ' Pro',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            SizedBox(height: 70.h),
            Text(
              'Sign In',
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
                  TextFormField(
                    controller: emailController,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Login ID',
                      prefixIcon: const Icon(
                          Icons.email,
                        ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 15.h),
                        labelText: 'Password',
                        prefixIcon: const Icon(
                          Icons.password,
                        ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.to(const ForgotPassword());
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  ),
                ),
                SizedBox(width: 20.w)
              ],
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () async {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });
                }

                try {
                  await _auth
                      .signInWithEmailAndPassword(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString())
                      .then((value) {
                    setState(() {
                      loading = false;
                    });
                    FirebaseFirestore.instance.collection("admin")
                        .doc("admin")
                        .get().then((DocumentSnapshot documentSnapshot){
                      if(documentSnapshot.exists){
                        if(documentSnapshot.get("email") == FirebaseAuth.instance.currentUser!.email){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminScreen()));
                        }else{
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        }
                      }else{
                        print('Document does not exist on the database');
                      }
                    });
                  });
                } on FirebaseAuthException catch (e) {
                  Utils().toastMessage(e.message.toString());
                  setState(() {
                    loading = false;
                  });
                }
              },
              child: Container(
                height: 40.h,
                width: 400.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.black),
                child: Center(
                    child: loading
                        ? const CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Colors.white,
                          )
                        : Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          )),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Get.to(const SignupScreen());
              },
              child: Text(
                'Create an account',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    ));
  }
}
