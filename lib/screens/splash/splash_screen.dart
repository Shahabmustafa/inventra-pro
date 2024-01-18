import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventra_pro/screens/home/admin/admin_screen.dart';
import 'package:inventra_pro/screens/home/home_screen.dart';
import 'package:inventra_pro/screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  isLogin(){
   if(FirebaseAuth.instance.currentUser != null){
     Timer(Duration(seconds: 3), () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
     });
   }else{
     Timer(Duration(seconds: 3),(){
       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
     });
   }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Inventre",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Pro",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFFffc500),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
