import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetEmail extends StatefulWidget {
  const ResetEmail({super.key});

  @override
  State<ResetEmail> createState() => _ResetEmailState();
}

class _ResetEmailState extends State<ResetEmail> {

  final resetEmail = TextEditingController();
  final password = TextEditingController();
  final auth = FirebaseAuth.instance.currentUser;
  bool loading = false;
  resetYourEmail()async{
    setState(() {
      loading = true;
    });
    try {
      final user = FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: resetEmail.text,
        password: password.text,
      ).then((value){
        setState(() {
          loading = false;
        });
        FirebaseFirestore.instance.collection("admin").doc("admin").update({
          "email" : resetEmail.text,
        });
      }).onError((error, stackTrace){
        setState(() {
          loading = false;
        });
      });
    } catch (e) {
      print("Error updating email: $e");
      setState(() {
        loading = false;
      });
      // Handle errors here
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(FirebaseAuth.instance.currentUser!.email);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Email"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: resetEmail,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Reset Email",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: password,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => resetYourEmail(),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: loading ?
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ) :
                Center(
                  child: Text(
                    "Reset Email",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
