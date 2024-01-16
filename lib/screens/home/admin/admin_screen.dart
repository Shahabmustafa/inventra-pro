import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../provider/WidgetsViewModel1.dart';
import '../../../provider/change_email_controller.dart';
import '../home_screen.dart';
import '../inventory track list/inventory_track_list_detail_scree_one.dart';
import 'email_verification_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
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

  bool loading = false;

  EmailChangeService emailChangeService = EmailChangeService();

  @override
  Widget build(BuildContext context) {
    return Consumer2<WidgetsViewModel1, WidgetsViewModel1>(
        builder: (context, widgetProvider, signUpProvider, child) => SafeArea(
                child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Center(
                      child: Text(
                        'Admin',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.w, top: 10.h, bottom: 10.h),
                          child: Container(
                            height: 40.h,
                            width: 160.w,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                    width: 1.w, color: Colors.blue)),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              //  controller: passwordController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 15.h),
                                  labelText: 'Search by VIN#1',
                                  labelStyle: TextStyle(
                                      color: Colors.white, fontSize: 8.sp),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.w, top: 10.h, bottom: 10.h),
                          child: Container(
                            height: 40.h,
                            width: 160.w,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                    width: 1.w, color: Colors.blue)),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              //  controller: passwordController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 15.h),
                                  labelText: 'Track Inventory List Search',
                                  labelStyle: TextStyle(
                                      color: Colors.white, fontSize: 8.sp),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    ///////////////////////////

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
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        const Spacer(),
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
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.w, top: 10.h, bottom: 10.h),
                          child: Container(
                            height: 40.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                    width: 1.w, color: Colors.blue)),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: byNameOfPartController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 15.h),
                                  labelText: 'By Name of parts',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5.w, top: 10.h, bottom: 10.h),
                          child: Container(
                            height: 40.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                    width: 1.w, color: Colors.blue)),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: yearController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 15.h),
                                  labelText: 'Year',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5.w, top: 10.h, bottom: 10.h),
                          child: Container(
                            height: 40.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                    width: 1.w, color: Colors.blue)),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: makeController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 15.h),
                                  labelText: 'Make',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Container(
                        height: 40.h,
                        width: 250.w,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.r),
                            border:
                                Border.all(width: 1.w, color: Colors.blue)),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: modelController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 15.h),
                              labelText: 'Model',
                              labelStyle:
                                  const TextStyle(color: Colors.white),
                              hintStyle:
                                  const TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 10.h,
                      ),
                      child: Container(
                        height: 40.h,
                        width: 250.w,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.r),
                            border:
                                Border.all(width: 1.w, color: Colors.blue)),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: vinnController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 15.h),
                              labelText: 'VIN#1',
                              labelStyle:
                                  const TextStyle(color: Colors.white),
                              hintStyle:
                                  const TextStyle(color: Colors.white)),
                        ),
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
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25.w,
                            top: 10.h,
                            bottom: 10.h,
                          ),
                          child: Container(
                            height: 40.h,
                            width: 140.w,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                    width: 1.w, color: Colors.blue)),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: tiresController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 15.h),
                                  labelText: 'Tires',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5.w,
                              top: 10.h,
                              bottom: 10.h,
                              right: 10.w),
                          child: Container(
                            height: 40.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                    width: 1.w, color: Colors.blue)),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: receiptController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 15.h),
                                  labelText: 'receipt',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  // prefixIcon: const Icon(
                                  //   Icons.password,
                                  //   color: Colors.white,
                                  // ),
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.w,
                            top: 10.h,
                            bottom: 10.h,
                          ),
                          child: Container(
                            height: 40.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                    width: 1.w, color: Colors.blue)),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: sizeController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 6.h),
                                  labelText: 'Size',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5.w, top: 10.h, bottom: 10.h),
                          child: Container(
                            height: 40.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                    width: 1.w, color: Colors.blue)),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: conditionController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 6.h),
                                  labelText: 'Condition',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5.w, top: 10.h, bottom: 10.h),
                          child: Container(
                            height: 40.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                    width: 1.w, color: Colors.blue)),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              controller: make2Controller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 6.h),
                                  labelText: 'Make',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),

                    GestureDetector(
                      onTap: () {
                        widgetProvider.selectGalleryImage12();
                        // selectGalleryImage();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Center(
                          child: Container(
                            height: 140,
                            width: 120,
                            child: Stack(
                              children: [
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      radius: 80,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 75,
                                        backgroundColor: Colors.grey.shade400,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              const Color(0xfffe661b),
                                          radius: 72,
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
                                                  size: 80,
                                                  color: Color(0xFF3c3966),
                                                )
                                              : null,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    ////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 40.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Center(
                            child: InkWell(
                              onTap: () async {
                                await widgetProvider.uploadImage12(context);
                                await Firebase.initializeApp();
                                return await FirebaseFirestore.instance
                                    .collection('inventoryTrackList')
                                    .doc()
                                    .set({
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
                                  'image12':
                                      widgetProvider.imageUrlDownload12,
                                  ////////////////
                                }).then(
                                  (value) {
                                    Get.to(const HomeScreen());
                                    print(
                                        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
                                  },
                                );
                              },
                              child: Text(
                                'Approve User',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Center(
                            child: Text(
                              'Cancel User',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Divider(
                      height: 1.h,
                      color: Colors.black,
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Text(
                        'Change Admin',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 50.h,
                      width: 330.w,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(width: 1.w, color: Colors.blue)),
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
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: (){
                        if(_emailController.text.isEmpty){
                          Get.snackbar("Error", "Please Enter Your New Email");
                        }else{
                          emailChangeService.changeEmail(_emailController.text).then((value){
                            print("Your Email is update");
                          }).onError((error, stackTrace){
                            print("Error is Not Found $error");
                          });
                        }
                      },
                      child: Container(
                        height: 40.h,
                        width: 130.w,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Center(
                          child: loading ? Center(child: CircularProgressIndicator(color: Colors.white,)) : Text(
                            'Send',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height:
                            MediaQuery.of(context).viewInsets.bottom + 20),
                  ],
                ),
              ),
            )));
  }
}
