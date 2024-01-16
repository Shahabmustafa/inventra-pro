import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../provider/WidgetsViewModel1.dart';
import '../home_screen.dart';
import 'inventory_track_list_detail_scree_one.dart';

class InventoryTrackListScreen extends StatefulWidget {
  const InventoryTrackListScreen({super.key});

  @override
  State<InventoryTrackListScreen> createState() =>
      _InventoryTrackListScreenState();
}

class _InventoryTrackListScreenState extends State<InventoryTrackListScreen> {
  final byNameOfPartController = TextEditingController();
  final yearController = TextEditingController();
  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final vinnController = TextEditingController();
  final tiresController = TextEditingController();
  final receiptController = TextEditingController();
  final sizeController = TextEditingController();
  final conditionController = TextEditingController();
  final make2Controller = TextEditingController();
  bool loading = false;

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
            resizeToAvoidBottomInset: false,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
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
                        style: TextStyle(color: Colors.black, fontSize: 18.sp),
                      ),
                    ),
                    SizedBox(
                      width: 25.w,
                    )
                  ],
                ),
                const Spacer(),
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
                      padding:
                          EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                      child: Container(
                        height: 40.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(width: 1.w, color: Colors.blue)),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: byNameOfPartController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 15.h),
                              labelText: 'By Name of parts',
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
                      padding:
                          EdgeInsets.only(left: 5.w, top: 10.h, bottom: 10.h),
                      child: Container(
                        height: 40.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(width: 1.w, color: Colors.blue)),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: yearController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 15.h),
                              labelText: 'Year',
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
                      padding:
                          EdgeInsets.only(left: 5.w, top: 10.h, bottom: 10.h),
                      child: Container(
                        height: 40.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(width: 1.w, color: Colors.blue)),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: makeController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 15.h),
                              labelText: 'Make',
                              labelStyle: const TextStyle(color: Colors.white),
                              // prefixIcon: const Icon(
                              //   Icons.password,
                              //   color: Colors.white,
                              // ),
                              hintStyle: const TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 10.h, bottom: 10.h),
                  child: Container(
                    height: 40.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(width: 1.w, color: Colors.blue)),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: modelController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 15.h),
                          labelText: 'Model',
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
                  padding: EdgeInsets.only(
                      left: 5.w, top: 10.h, bottom: 10.h, right: 30.w),
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
                            border: Border.all(width: 1.w, color: Colors.blue)),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: tiresController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 15.h),
                              labelText: 'Tires',
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
                      padding: EdgeInsets.only(
                          left: 5.w, top: 10.h, bottom: 10.h, right: 10.w),
                      child: Container(
                        height: 40.h,
                        width: 170.w,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(width: 1.w, color: Colors.blue)),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: receiptController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 15.h),
                              labelText: 'receipt',
                              labelStyle: const TextStyle(color: Colors.white),
                              // prefixIcon: const Icon(
                              //   Icons.password,
                              //   color: Colors.white,
                              // ),
                              hintStyle: const TextStyle(color: Colors.white)),
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
                            border: Border.all(width: 1.w, color: Colors.blue)),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: sizeController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 6.h),
                              labelText: 'Size',
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
                      padding:
                          EdgeInsets.only(left: 5.w, top: 10.h, bottom: 10.h),
                      child: Container(
                        height: 40.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(width: 1.w, color: Colors.blue)),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: conditionController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 6.h),
                              labelText: 'Condition',
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
                      padding:
                          EdgeInsets.only(left: 5.w, top: 10.h, bottom: 10.h),
                      child: Container(
                        height: 40.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(width: 1.w, color: Colors.blue)),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: make2Controller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 6.h),
                              labelText: 'Make',
                              labelStyle: const TextStyle(color: Colors.white),
                              // prefixIcon: const Icon(
                              //   Icons.password,
                              //   color: Colors.white,
                              // ),
                              hintStyle: const TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
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
                                      backgroundColor: const Color(0xfffe661b),
                                      radius: 72,
                                      backgroundImage:
                                          widgetProvider.imageFile12 == null
                                              ? null
                                              : FileImage(
                                                  widgetProvider.imageFile12!),
                                      child: widgetProvider.imageFile12 == null
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
                Center(
                  child: InkWell(
                    onTap: () async {
                      setState(() {
                        loading = true;
                      });
                     try{
                       await widgetProvider.uploadImage12(context);
                       await Firebase.initializeApp();
                       return await FirebaseFirestore.instance
                           .collection('inventoryTrackList')
                           .doc()
                           .set({
                         'by_name_of_parts': byNameOfPartController.text.trim(),
                         'year': yearController.text.trim(),
                         'make': makeController.text.trim(),
                         'model': modelController.text.trim(),
                         'vinn': vinnController.text.trim(),
                         'tires': tiresController.text.trim(),
                         'size': sizeController.text.trim(),
                         'search_list_by_size_of_tires':
                         receiptController.text.trim(),
                         'condition': conditionController.text.trim(),
                         'make2': make2Controller.text.trim(),
                         'image12': widgetProvider.imageUrlDownload12,
                         ////////////////
                       }).then(
                             (value) {
                           Get.to(const HomeScreen());
                           setState(() {
                             loading = false;
                           });
                           print(
                               'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
                         },
                       );
                     }catch(e){
                       Get.snackbar("Error", e.toString());
                       setState(() {
                         loading = true;
                       });
                     }
                    },
                    child: Container(
                      height: 40.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                        child: loading ?
                        Text(
                          'Please Wait.....',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ) :
                        Text("Send",
                          style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
