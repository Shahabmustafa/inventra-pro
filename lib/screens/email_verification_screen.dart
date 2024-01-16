import 'package:flutter/material.dart';

import 'login/login_screen.dart';

class Emailverificationscreen extends StatelessWidget {
  const Emailverificationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1B22),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff1A1B22),
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Text('Email Verification'),
            Spacer(),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'A verification email has been sent to your email address. \n Please verifyand to continue.',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
