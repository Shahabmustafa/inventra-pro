import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventra_pro/provider/WidgetsViewModel1.dart';
import 'package:inventra_pro/screens/home/home_screen.dart';
import 'package:inventra_pro/screens/home/vehicale%20saller%20information/vehical_saller_details_screen.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class VehicleSllerInformationScreen extends StatefulWidget {
  const VehicleSllerInformationScreen({super.key});

  @override
  State<VehicleSllerInformationScreen> createState() =>
      VehicleSllerInformationScreenState();
}

class VehicleSllerInformationScreenState
    extends State<VehicleSllerInformationScreen> {
  final dateController = TextEditingController();
  final sellerNameController = TextEditingController();
  final addressController = TextEditingController();
  final purchasePriceController = TextEditingController();
  final yearController = TextEditingController();
  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final vinnController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WidgetsViewModel1(),
        ),
        ChangeNotifierProvider(
          create: (context) => WidgetsViewModel1(),
        ),
      ],
      child: Consumer2<WidgetsViewModel1, WidgetsViewModel1>(
        builder: (context, widgetProvider, signUpProvider, child) => SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Center(
                    child: Text(
                      'Vehicle and',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      'seller Information',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Get.to(const VehiclesellerDetailScreen());
                        },
                        child: Text(
                          'View All',
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(
                        width: 25.w,
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.all(10.r),
                    child: Container(
                      height: 40.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(width: 1.w, color: Colors.blue)),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: dateController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 6.h),
                            labelText: 'Date',
                            labelStyle: const TextStyle(color: Colors.white),
                            // prefixIcon: const Icon(
                            //   Icons.password,
                            //   color: Colors.white,
                            // ),
                            hintStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.r),
                    child: Container(
                      height: 40.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(width: 1.w, color: Colors.blue)),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: sellerNameController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 15.h),
                            labelText: 'Name of seller',
                            labelStyle: const TextStyle(color: Colors.white),
                            hintStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Container(
                          height: 40.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(6.r),
                              border:
                                  Border.all(width: 1.w, color: Colors.blue)),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: addressController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(bottom: 15.h),
                                labelText: 'Address',
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
                      Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Container(
                          height: 40.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(6.r),
                              border:
                                  Border.all(width: 1.w, color: Colors.blue)),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: purchasePriceController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(bottom: 15.h),
                                labelText: 'Purchase Price',
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
                    padding: EdgeInsets.only(left: 10.w, top: 10.h),
                    child: Text(
                      'Upload Pictures',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      '#Id Pic',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          widgetProvider.selectGalleryImage();
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
                                            backgroundImage: widgetProvider
                                                        .imageFile ==
                                                    null
                                                ? null
                                                : FileImage(
                                                    widgetProvider.imageFile!),
                                            child: widgetProvider.imageFile ==
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
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          widgetProvider.selectGalleryImage1();
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
                                            backgroundImage: widgetProvider
                                                        .imageFile1 ==
                                                    null
                                                ? null
                                                : FileImage(
                                                    widgetProvider.imageFile1!),
                                            child: widgetProvider.imageFile1 ==
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
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      'Bill of Sale Pictures',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.all(10.r),
                      //   child: Container(
                      //     height: 100.h,
                      //     width: 100.w,
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey,
                      //         borderRadius: BorderRadius.circular(10.r)),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: const [
                      //         Text(
                      //           'Upload Pic',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //         Icon(
                      //           Icons.add,
                      //           color: Colors.white,
                      //           size: 50,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.all(10.r),
                      //   child: Container(
                      //     height: 100.h,
                      //     width: 100.w,
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey,
                      //         borderRadius: BorderRadius.circular(10.r)),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: const [
                      //         Text(
                      //           'Upload Pic',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //         Icon(
                      //           Icons.add,
                      //           color: Colors.white,
                      //           size: 50,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.all(10.r),
                      //   child: Container(
                      //     height: 100.h,
                      //     width: 100.w,
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey,
                      //         borderRadius: BorderRadius.circular(10.r)),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: const [
                      //         Text(
                      //           'Upload Pic',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //         Icon(
                      //           Icons.add,
                      //           color: Colors.white,
                      //           size: 50,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          widgetProvider.selectGalleryImage2();
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
                                            backgroundImage: widgetProvider
                                                        .imageFile2 ==
                                                    null
                                                ? null
                                                : FileImage(
                                                    widgetProvider.imageFile2!),
                                            child: widgetProvider.imageFile2 ==
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
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          widgetProvider.selectGalleryImage3();
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
                                            backgroundImage: widgetProvider
                                                        .imageFile3 ==
                                                    null
                                                ? null
                                                : FileImage(
                                                    widgetProvider.imageFile3!),
                                            child: widgetProvider.imageFile3 ==
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
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          widgetProvider.selectGalleryImage4();
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
                                            backgroundImage: widgetProvider
                                                        .imageFile4 ==
                                                    null
                                                ? null
                                                : FileImage(
                                                    widgetProvider.imageFile4!),
                                            child: widgetProvider.imageFile4 ==
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
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      'Type of vehicle Purchase',
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
                          width: 80.w,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(6.r),
                              border:
                                  Border.all(width: 1.w, color: Colors.blue)),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: yearController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(bottom: 15.h),
                                labelText: 'Year',
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
                      Padding(
                        padding:
                            EdgeInsets.only(left: 5.w, top: 10.h, bottom: 10.h),
                        child: Container(
                          height: 40.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(6.r),
                              border:
                                  Border.all(width: 1.w, color: Colors.blue)),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: makeController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(bottom: 15.h),
                                labelText: 'Make',
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
                      Padding(
                        padding:
                            EdgeInsets.only(left: 5.w, top: 10.h, bottom: 10.h),
                        child: Container(
                          height: 40.h,
                          width: 80.w,
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
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                    child: Container(
                      height: 40.h,
                      width: 250.w,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(width: 1.w, color: Colors.blue)),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: vinnController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 15.h),
                            labelText: 'VIN#1',
                            labelStyle: const TextStyle(color: Colors.white),
                            // prefixIcon: const Icon(
                            //   Icons.password,
                            //   color: Colors.white,
                            // ),
                            hintStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(
                      'Vehicle Pictures Upload',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.all(10.r),
                      //   child: Container(
                      //     height: 100.h,
                      //     width: 100.w,
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey,
                      //         borderRadius: BorderRadius.circular(10.r)),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: const [
                      //         Text(
                      //           'Upload Pic',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //         Icon(
                      //           Icons.add,
                      //           color: Colors.white,
                      //           size: 50,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.all(10.r),
                      //   child: Container(
                      //     height: 100.h,
                      //     width: 100.w,
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey,
                      //         borderRadius: BorderRadius.circular(10.r)),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: const [
                      //         Text(
                      //           'Upload Pic',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //         Icon(
                      //           Icons.add,
                      //           color: Colors.white,
                      //           size: 50,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.all(10.r),
                      //   child: Container(
                      //     height: 100.h,
                      //     width: 100.w,
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey,
                      //         borderRadius: BorderRadius.circular(10.r)),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: const [
                      //         Text(
                      //           'Upload Pic',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //         Icon(
                      //           Icons.add,
                      //           color: Colors.white,
                      //           size: 50,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      GestureDetector(
                        onTap: () {
                          widgetProvider.selectGalleryImage5();
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
                                            backgroundImage: widgetProvider
                                                        .imageFile5 ==
                                                    null
                                                ? null
                                                : FileImage(
                                                    widgetProvider.imageFile5!),
                                            child: widgetProvider.imageFile5 ==
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
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          widgetProvider.selectGalleryImage6();
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
                                            backgroundImage: widgetProvider
                                                        .imageFile6 ==
                                                    null
                                                ? null
                                                : FileImage(
                                                    widgetProvider.imageFile6!),
                                            child: widgetProvider.imageFile6 ==
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
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          widgetProvider.selectGalleryImage7();
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
                                            backgroundImage: widgetProvider
                                                        .imageFile7 ==
                                                    null
                                                ? null
                                                : FileImage(
                                                    widgetProvider.imageFile7!),
                                            child: widgetProvider.imageFile7 ==
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
                    ],
                  ),
                  Row(
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.all(10.r),
                      //   child: Container(
                      //     height: 100.h,
                      //     width: 100.w,
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey,
                      //         borderRadius: BorderRadius.circular(10.r)),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: const [
                      //         Text(
                      //           'Upload Pic',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //         Icon(
                      //           Icons.add,
                      //           color: Colors.white,
                      //           size: 50,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.all(10.r),
                      //   child: Container(
                      //     height: 100.h,
                      //     width: 100.w,
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey,
                      //         borderRadius: BorderRadius.circular(10.r)),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: const [
                      //         Text(
                      //           'Upload Pic',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //         Icon(
                      //           Icons.add,
                      //           color: Colors.white,
                      //           size: 50,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.all(10.r),
                      //   child: Container(
                      //     height: 100.h,
                      //     width: 100.w,
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey,
                      //         borderRadius: BorderRadius.circular(10.r)),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: const [
                      //         Text(
                      //           'Upload Pic',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //         Icon(
                      //           Icons.add,
                      //           color: Colors.white,
                      //           size: 50,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      GestureDetector(
                        onTap: () {
                          widgetProvider.selectGalleryImage8();
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
                                            backgroundImage: widgetProvider
                                                        .imageFile8 ==
                                                    null
                                                ? null
                                                : FileImage(
                                                    widgetProvider.imageFile8!),
                                            child: widgetProvider.imageFile8 ==
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
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          widgetProvider.selectGalleryImag9();
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
                                            backgroundImage: widgetProvider
                                                        .imageFile9 ==
                                                    null
                                                ? null
                                                : FileImage(
                                                    widgetProvider.imageFile9!),
                                            child: widgetProvider.imageFile9 ==
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
                      const SizedBox(
                        width: 10,
                      ),

                      GestureDetector(
                        onTap: () {
                          widgetProvider.selectGalleryImage10();
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
                                                widgetProvider.imageFile10 ==
                                                        null
                                                    ? null
                                                    : FileImage(widgetProvider
                                                        .imageFile10!),
                                            child: widgetProvider.imageFile10 ==
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
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        await widgetProvider.uploadImage(context);
                        await widgetProvider.uploadImage1(context);
                        await widgetProvider.uploadImage2(context);
                        await widgetProvider.uploadImage3(context);
                        await widgetProvider.uploadImage4(context);
                        await widgetProvider.uploadImage5(context);
                        await widgetProvider.uploadImage6(context);
                        await widgetProvider.uploadImage7(context);
                        await widgetProvider.uploadImage8(context);
                        await widgetProvider.uploadImage9(context);
                        await widgetProvider.uploadImage10(context);

                        await Firebase.initializeApp();
                        return await FirebaseFirestore.instance
                            .collection('vehicleandSalllerInformaation')
                            .doc()
                            .set({
                          'date': dateController.text.trim(),
                          'name_of_seller': sellerNameController.text.trim(),
                          'address': addressController.text.trim(),
                          'purchase_Price': purchasePriceController.text.trim(),
                          'year': yearController.text.trim(),
                          'make': makeController.text.trim(),
                          'model': modelController.text.trim(),
                          'vinn': vinnController.text.trim(),

                          'image1': widgetProvider.imageUrlDownload,
                          'image2': widgetProvider.imageUrlDownload1,
                          'image3': widgetProvider.imageUrlDownload2,
                          'image4': widgetProvider.imageUrlDownload3,
                          'image5': widgetProvider.imageUrlDownload4,
                          'image6': widgetProvider.imageUrlDownload5,
                          'image7': widgetProvider.imageUrlDownload6,
                          'image8': widgetProvider.imageUrlDownload7,
                          'image9': widgetProvider.imageUrlDownload8,
                          'image10': widgetProvider.imageUrlDownload9,
                          'image11': widgetProvider.imageUrlDownload10,

                          ////////////////
                        }).then((value) {
                          Get.to(const HomeScreen());
                          print(
                              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 130.w,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Center(
                          child: Text(
                            'Send',
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void setData() async {}
}
