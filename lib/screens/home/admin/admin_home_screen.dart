import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../provider/WidgetsViewModel1.dart';
import '../inventory track list/inventory_track_list_detail_scree_one.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {

  final _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final byNameOfPartController = TextEditingController();
  final yearController = TextEditingController();
  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final vinnController = TextEditingController();
  final tiresController = TextEditingController();
  final searchListBySizeController = TextEditingController();
  final sizeController = TextEditingController();
  final conditionController = TextEditingController();
  final make2Controller = TextEditingController();
  final receiptController = TextEditingController();
  final carName = TextEditingController();

  bool loading = false;
  bool approve = false;

  final verifyEmail = FirebaseAuth.instance.currentUser!.emailVerified;
  @override
  Widget build(BuildContext context) {
    return  Consumer2<WidgetsViewModel1, WidgetsViewModel1>(
      builder: (context, widgetProvider, signUpProvider, child) => SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Inventory',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '  Track List',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(const InventoryTrackListDetaolScreenOne());
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                            color: Colors.black, fontSize: 18.sp),
                      ),
                    ),
                    SizedBox(
                      width: 25.w,
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 10.h),
                  child: Text(
                    'Type of Parts',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 30.h),
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: carName,
                  decoration: InputDecoration(
                    labelText: 'Car Name',
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: byNameOfPartController,
                        decoration: InputDecoration(
                          labelText: 'Name of Parts',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: yearController,
                        decoration: InputDecoration(
                          labelText: 'Year',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: makeController,
                        decoration: InputDecoration(
                          labelText: 'Make',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: modelController,
                  decoration: InputDecoration(
                    labelText: 'Model',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: vinnController,
                  decoration: InputDecoration(
                    labelText: 'VIN#1',
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  height: 1.h,
                  color: Colors.black,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: tiresController,
                        decoration: InputDecoration(
                          labelText: 'Tires',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: receiptController,
                        decoration: InputDecoration(
                          hintText: "Receipt",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: sizeController,
                        decoration: InputDecoration(
                          labelText: 'Size',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: conditionController,
                        decoration: InputDecoration(
                          labelText: 'Condition',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: make2Controller,
                        decoration: InputDecoration(
                          labelText: 'Make',
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          widgetProvider.selectGalleryImage12();
                        },
                        child: CircleAvatar(
                          backgroundColor:
                          const Color(0xfffe661b),
                          radius: 50,
                          backgroundImage:
                          widgetProvider.imageFile12 ==
                              null
                              ? null
                              : FileImage(widgetProvider
                              .imageFile12!),
                          child: widgetProvider.imageFile12 ==
                              null
                              ? const Icon(
                            Icons.person,
                            size: 50,
                            color: Color(0xFF3c3966),
                          )
                              : null,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          widgetProvider.cameraPicker();
                        },
                        child: CircleAvatar(
                          backgroundColor:
                          const Color(0xfffe661b),
                          radius: 50,
                          backgroundImage:
                          widgetProvider.imageFile13 ==
                              null
                              ? null
                              : FileImage(widgetProvider.imageFile13!),
                          child: widgetProvider.imageFile13 ==
                              null
                              ? const Icon(
                            Icons.person,
                            size: 50,
                            color: Color(0xFF3c3966),
                          )
                              : null,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          widgetProvider.cameraPicker14();
                        },
                        child: CircleAvatar(
                          backgroundColor:
                          const Color(0xfffe661b),
                          radius: 50,
                          backgroundImage:
                          widgetProvider.imageFile14 ==
                              null
                              ? null
                              : FileImage(widgetProvider
                              .imageFile14!),
                          child: widgetProvider.imageFile14 ==
                              null
                              ? const Icon(
                            Icons.person,
                            size: 50,
                            color: Color(0xFF3c3966),
                          )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                ////////
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: 40.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            approve = true;
                          });
                          await widgetProvider.uploadImage12(context);
                          await widgetProvider.uploadImage13(context);
                          await widgetProvider.uploadImage14(context);
                          await Firebase.initializeApp();
                          return await FirebaseFirestore.instance
                              .collection('inventoryTrackList')
                              .doc()
                              .set({
                            "carName" :
                            carName.text.trim(),
                            'by_name_of_parts':
                            byNameOfPartController.text.trim(),
                            'year': yearController.text.trim(),
                            'make': makeController.text.trim(),
                            'model': modelController.text.trim(),
                            'vinn': vinnController.text.trim(),
                            'tires': tiresController.text.trim(),
                            'size': sizeController.text.trim(),
                            'search_list_by_size_of_tires':
                            receiptController.text.trim(),
                            'condition':
                            conditionController.text.trim(),
                            'make2': make2Controller.text.trim(),
                            'image12': widgetProvider.imageUrlDownload12,
                            "image13" : widgetProvider.imageUrlDownload13,
                            "image14" : widgetProvider.imageUrlDownload13,
                            ////////////////
                          }).then(
                                (value) {
                              byNameOfPartController.clear();
                              yearController.clear();
                              makeController.clear();
                              modelController.clear();
                              vinnController.clear();
                              tiresController.clear();
                              sizeController.clear();
                              receiptController.clear();
                              conditionController.clear();
                              make2Controller.clear();
                              setState(() {
                                approve = false;
                              });
                              print(
                                  'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
                            },
                          ).onError((error, stackTrace){
                            setState(() {
                              approve = false;
                            });
                          });
                        },
                        child: approve ?
                        Center(child: CircularProgressIndicator(color: Colors.white,)) :
                        Text(
                          'Approve User',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }
}
