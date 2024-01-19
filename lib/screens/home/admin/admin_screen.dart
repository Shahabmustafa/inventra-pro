import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventra_pro/screens/home/admin/admin_home_screen.dart';
import 'package:inventra_pro/screens/home/admin/search_vin_screen.dart';
import 'package:inventra_pro/screens/home/admin/serach_inventry_screen.dart';
import 'package:provider/provider.dart';
import '../../../provider/WidgetsViewModel1.dart';
import '../../login/login_screen.dart';
import '../home_screen.dart';
import '../inventory track list/inventory_track_list_detail_scree_one.dart';
import 'email_verification_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {



  // Future resetEmail(String newEmail) async {
  //   try{
  //     if(verifyEmail != null){
  //       FirebaseAuth.instance.currentUser!.updateEmail(newEmail).then((value){
  //         print("sucess");
  //       }).onError((error, stackTrace){
  //         print(error);
  //         print(stackTrace);
  //       });
  //     }else{
  //       print("Please Enter Your Verify Email");
  //     }
  //
  //   }catch(e){
  //
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Consumer2<WidgetsViewModel1, WidgetsViewModel1>(
      builder: (context, widgetProvider, signUpProvider, child) => SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Admin"),
              automaticallyImplyLeading: false,
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: (){
                      FirebaseAuth.instance.signOut().then((value){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      });
                    },
                    child: Icon(Icons.exit_to_app),
                  ),
                ),
              ],
              bottom: TabBar(
                indicatorColor: Colors.black,
                dividerColor: Colors.grey.shade200,
                unselectedLabelColor: Colors.black,
                labelPadding: EdgeInsets.only(bottom: 10,top: 10),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                unselectedLabelStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                ),
                tabs: [
                  Text("Inventry Track"),
                  Text("VIN Search"),
                  Text("Inventry Search"),
                ],
              ),
            ),
            // resizeToAvoidBottomInset: false,
            body: TabBarView(
              children: [
                AdminHomeScreen(),
                SearchVinScreen(),
                SearchInventryScreen(),
              ],
            ),

          ),
        ),
       ),
    );
  }
}
