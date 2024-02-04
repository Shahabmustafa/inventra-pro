import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../email_verification_screen.dart';
import '../login/login_screen.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                    ),                    controller: nameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Name',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: phoneController,
                    decoration: InputDecoration(
                        labelText: 'Phone',
                        prefixIcon: const Icon(
                          Icons.phone,
                        ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: emailController,
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
                    style: const TextStyle(color: Colors.black),
                    controller: passwordController,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(
                          Icons.password,
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
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
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
      ),
    ));
  }
}
