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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
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
                  Text(
                    'Type of Parts',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          controller: byNameOfPartController,
                          decoration: InputDecoration(
                              labelText: 'By Name of parts',
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
                            labelStyle: const TextStyle(color: Colors.white),
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
                  SizedBox(height: 10.h),
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
                              labelText: 'receipt',
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
                          style: const TextStyle(color: Colors.white),
                          controller: make2Controller,
                          decoration: InputDecoration(
                            labelText: 'Make',
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
                        width: 400.w,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Center(
                          child: loading ?
                          CircularProgressIndicator(color: Colors.white,) :
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
      ),
    );
  }
}
