// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:inventra_pro/screens/home/admin/admin_screen.dart';
// import 'package:inventra_pro/screens/home/inventory%20track%20list/inventory_track_list_screen.dart';
// import 'package:inventra_pro/screens/home/vehiclee%20seller%20information/vehicle_seller_info_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final searchFilter = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Text(
//               'vehicle\nTrack List',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 30.sp,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(height: 20.h),
//           Padding(
//             padding: EdgeInsets.all(10.r),
//             child: Container(
//               height: 40.h,
//               width: double.infinity,
//               color: Colors.grey,
//               child: TextField(
//                 onChanged: (String value) {
//                   setState(() {});
//                 },
//                 controller: searchFilter,
//                 decoration: const InputDecoration(
//                   border: InputBorder.none,
//                   hintText: ' Search...',
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 20.h),
//           Center(
//             child: InkWell(
//               onTap: () {
//                 Get.to(const vehicleSllerInformationScreen());
//               },
//               child: Container(
//                 height: 50.h,
//                 width: 300.w,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.r),
//                     color: Colors.green),
//                 child: Center(
//                     child: Text(
//                   'vehicle seller Information',
//                   style:
//                       TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
//                 )),
//               ),
//             ),
//           ),
//           SizedBox(height: 10.h),
//           Center(
//             child: InkWell(
//               onTap: () {
//                 Get.to(const InventoryTrackListScreen());
//               },
//               child: Container(
//                 height: 50.h,
//                 width: 300.w,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.r),
//                     color: Colors.green),
//                 child: Center(
//                     child: Text(
//                   'Inventory Track List',
//                   style:
//                       TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
//                 )),
//               ),
//             ),
//           ),
//           SizedBox(height: 10.h),
//           Divider(thickness: 1.w),
//           SizedBox(height: 10.h),
//           Center(
//             child: Container(
//               height: 50.h,
//               width: 300.w,
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 borderRadius: BorderRadius.circular(20.r),
//               ),
//               child: TextFormField(
//                 style: const TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.only(bottom: 15.h),
//                     labelText: 'Admin Login ID',
//                     labelStyle: const TextStyle(color: Colors.white),
//                     prefixIcon: const Icon(
//                       Icons.email,
//                       color: Colors.white,
//                     ),
//                     hintStyle: const TextStyle(color: Colors.white)),
//               ),
//             ),
//           ),
//           //////////////////////////////////
//           Container(
//               height: 100.h,
//               width: 378.w,
//               decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 31, 31, 31),
//                   borderRadius: BorderRadius.circular(10.r)),
//               child: StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection("inventoryTrackList")
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting &&
//                         snapshot.data == null) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     } else {
//                       return ListView.builder(
//                           itemCount: snapshot.data?.docs.length,
//                           itemBuilder: (context, index) {
//                             DocumentSnapshot data = snapshot.data!.docs[index];

//                             final title = '${data['by_name_of_parts']}';
//                             if (searchFilter.text.isEmpty) {
//                               return InkWell(
//                                 onTap: () {
//                                   // Navigator.push(
//                                   //     context,
//                                   //     MaterialPageRoute(
//                                   //         builder: (context) =>
//                                   //             CustomerDetailScreen(
//                                   //               id: snapshot
//                                   //                   .data!.docs[index].id,
//                                   //               name: data['customer_name'],
//                                   //               comapanyName:
//                                   //                   data['company_name'],
//                                   //               email: data['email_adress'],
//                                   //               addressLine:
//                                   //                   data['address_line'],
//                                   //               addressLine1:
//                                   //                   data['address_line_1'],
//                                   //               addressLine2:
//                                   //                   data['address_ine_2'],
//                                   //               city: data['city'],
//                                   //               country: data['country'],
//                                   //               identificationNo:
//                                   //                   data['identification_no'],
//                                   //               shippingName:
//                                   //                   data['shipping_name'],
//                                   //               stateorProvince:
//                                   //                   data['state_or_province'],
//                                   //               postalCode:
//                                   //                   data['postal_code'],
//                                   //             )));
//                                 },
//                                 child: Container(
//                                     // child: Column(
//                                     //   children: [
//                                     //     Padding(
//                                     //       padding: EdgeInsets.only(
//                                     //           left: 8.w,
//                                     //           right: 8.w,
//                                     //           top: 10,
//                                     //           bottom: 10.h),
//                                     //       child: Row(
//                                     //         mainAxisAlignment:
//                                     //             MainAxisAlignment.spaceBetween,
//                                     //         children: [
//                                     //           Text(
//                                     //             '${data['by_name_of_parts']}',
//                                     //             style: const TextStyle(
//                                     //                 color: Colors.white),
//                                     //           ),
//                                     //           const Icon(
//                                     //             Icons.arrow_forward_ios,
//                                     //             size: 15,
//                                     //             color: Colors.white,
//                                     //           )
//                                     //         ],
//                                     //       ),
//                                     //     ),
//                                     //     const Divider(
//                                     //       thickness: 0.2,
//                                     //       color: Colors.grey,
//                                     //     ),
//                                     //   ],
//                                     // ),

//                                     ),
//                               );
//                             } else if (title.toLowerCase().contains(
//                                 searchFilter.text.toLowerCase().toString())) {
//                               return InkWell(
//                                 onTap: () {
//                                   // Navigator.push(
//                                   //     context,
//                                   //     MaterialPageRoute(
//                                   //         builder: (context) =>
//                                   //             CustomerDetailScreen(
//                                   //               id: snapshot
//                                   //                   .data!.docs[index].id,
//                                   //               name: data['customer_name'],
//                                   //               comapanyName:
//                                   //                   data['company_name'],
//                                   //               email: data['email_adress'],
//                                   //               addressLine:
//                                   //                   data['address_line'],
//                                   //               addressLine1:
//                                   //                   data['address_line_1'],
//                                   //               addressLine2:
//                                   //                   data['address_ine_2'],
//                                   //               city: data['city'],
//                                   //               country: data['country'],
//                                   //               identificationNo:
//                                   //                   data['identification_no'],
//                                   //               shippingName:
//                                   //                   data['shipping_name'],
//                                   //               stateorProvince:
//                                   //                   data['state_or_province'],
//                                   //               postalCode:
//                                   //                   data['postal_code'],
//                                   //             )));
//                                 },
//                                 child: Container(
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.only(
//                                             left: 8.w,
//                                             right: 8.w,
//                                             top: 10,
//                                             bottom: 10.h),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text(
//                                               '${data['by_name_of_parts']}',
//                                               style: const TextStyle(
//                                                   color: Colors.white),
//                                             ),
//                                             const Icon(
//                                               Icons.arrow_forward_ios,
//                                               size: 15,
//                                               color: Colors.white,
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       const Divider(
//                                         thickness: 0.2,
//                                         color: Colors.grey,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             } else {
//                               return Container();
//                             }
//                           });
//                     }
//                   })),

//           ///
//           SizedBox(height: 10.h),
//           Center(
//             child: Container(
//               height: 50.h,
//               width: 300.w,
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 borderRadius: BorderRadius.circular(20.r),
//               ),
//               child: TextFormField(
//                 style: const TextStyle(color: Colors.white),
//                 // controller: emailController,
//                 decoration: InputDecoration(
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.only(bottom: 15.h),
//                     labelText: 'Password',
//                     labelStyle: const TextStyle(color: Colors.white),
//                     prefixIcon: const Icon(
//                       Icons.password,
//                       color: Colors.white,
//                     ),
//                     hintStyle: const TextStyle(color: Colors.white)),
//               ),
//             ),
//           ),
//           SizedBox(height: 10.h),
//           Center(
//             child: InkWell(
//               onTap: () {
//                 Get.to(const AdminScreen());
//               },
//               child: Container(
//                 height: 50.h,
//                 width: 150.w,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.r),
//                     color: Colors.green),
//                 child: Center(
//                     child: Text(
//                   'Login Admin',
//                   style:
//                       TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
//                 )),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventra_pro/screens/home/admin/admin_screen.dart';
import 'package:inventra_pro/screens/home/inventory%20track%20list/inventory_track_list_screen.dart';
import 'package:inventra_pro/screens/home/vehicale%20saller%20information/vehical_saller_info_screen.dart';
import '../utils/utils.dart';
import 'inventory track list/inventory_detail_screen_two.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchFilter = TextEditingController();
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  // static String admin = "admininventapro21@gmail.com";

  @override

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Vehicle\nTrack List',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: TextField(
                onChanged: (String value) {
                  setState(() {});
                },
                controller: searchFilter,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: ' Parts Search',
                  hintStyle: TextStyle(color: Colors.black)
                ),
              ),
            ),
            //////////////////////////////////
            Container(
                height: 100.h,
                width: 378.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r)),
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("inventoryTrackList")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting &&
                          snapshot.data == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot data =
                                  snapshot.data!.docs[index];
                              final title = '${data['by_name_of_parts']}';
                              if (searchFilter.text.isEmpty) {
                                return InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             CustomerDetailScreen(
                                    //               id: snapshot
                                    //                   .data!.docs[index].id,
                                    //               name: data['customer_name'],
                                    //               comapanyName:
                                    //                   data['company_name'],
                                    //               email: data['email_adress'],
                                    //               addressLine:
                                    //                   data['address_line'],
                                    //               addressLine1:
                                    //                   data['address_line_1'],
                                    //               addressLine2:
                                    //                   data['address_ine_2'],
                                    //               city: data['city'],
                                    //               country: data['country'],
                                    //               identificationNo:
                                    //                   data['identification_no'],
                                    //               shippingName:
                                    //                   data['shipping_name'],
                                    //               stateorProvince:
                                    //                   data['state_or_province'],
                                    //               postalCode:
                                    //                   data['postal_code'],
                                    //             )));
                                  },
                                  child: Container(),
                                );
                              } else if (title.toLowerCase().contains(
                                  searchFilter.text.toLowerCase().toString())) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InventoryDetailScreenTwo(
                                                  // id: snapshot
                                                  //     .data!.docs[index].id,
                                                  by_name_of_parts:
                                                      data['by_name_of_parts'],
                                                  condition: data['condition'],
                                                  make: data['make'],
                                                  make2: data['make2'],
                                                  model: data['model'],
                                                  size: data['size'],
                                                  tires: data['tires'],
                                                  vinn: data['vinn'],
                                                  year: data['year'],
                                                )));
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.w,
                                              right: 8.w,
                                              top: 10,
                                              bottom: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${data['by_name_of_parts']}',
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_ios,
                                                size: 15,
                                                color: Colors.black,
                                              )
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.2,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            });
                      }
                    })),

            ///

            SizedBox(height: 20.h),
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(const VehicleSllerInformationScreen());
                },
                child: Container(
                  height: 40.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black),
                  child: Center(
                      child: Text(
                    'Vehicle seller Information',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(const InventoryTrackListScreen());
                },
                child: Container(
                  height: 40.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.black),
                  child: Center(
                      child: Text(
                    'Inventory Track List',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            // SizedBox(height: 10.h),
            // Divider(thickness: 1.w),
            // SizedBox(height: 10.h),
            // Center(
            //   child: Container(
            //     height: 50.h,
            //     width: 300.w,
            //     decoration: BoxDecoration(
            //       color: Colors.green,
            //       borderRadius: BorderRadius.circular(20.r),
            //     ),
            //     child: TextFormField(
            //       style: const TextStyle(color: Colors.white),
            //       controller: emailController,
            //       decoration: InputDecoration(
            //           border: InputBorder.none,
            //           contentPadding: EdgeInsets.only(bottom: 15.h),
            //           labelText: 'Admin Login ID',
            //           labelStyle: const TextStyle(color: Colors.white),
            //           prefixIcon: const Icon(
            //             Icons.email,
            //             color: Colors.white,
            //           ),
            //           hintStyle: const TextStyle(color: Colors.white)),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 10.h),
            // Center(
            //   child: Container(
            //     height: 50.h,
            //     width: 300.w,
            //     decoration: BoxDecoration(
            //       color: Colors.green,
            //       borderRadius: BorderRadius.circular(20.r),
            //     ),
            //     child: TextFormField(
            //       style: const TextStyle(color: Colors.white),
            //       controller: passwordController,
            //       decoration: InputDecoration(
            //           border: InputBorder.none,
            //           contentPadding: EdgeInsets.only(bottom: 15.h),
            //           labelText: 'Password',
            //           labelStyle: const TextStyle(color: Colors.white),
            //           prefixIcon: const Icon(
            //             Icons.password,
            //             color: Colors.white,
            //           ),
            //           hintStyle: const TextStyle(color: Colors.white)),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 10.h),
            // Center(
            //   child: InkWell(
            //     onTap: () async {
            //       // print(admin);
            //       var doc = await FirebaseFirestore.instance
            //           .collection("admin")
            //       .doc("admin").get();
            //
            //       if (emailController.text.trim() == doc.data()!["email"]){
            //         setState(() {
            //           loading = true;
            //         });
            //         try {
            //           _auth
            //               .signInWithEmailAndPassword(
            //               email: emailController.text.toString(),
            //               password: passwordController.text.toString())
            //               .then((value) {
            //             setState(() {
            //               loading = false;
            //               Get.to(const AdminScreen());
            //             });
            //           });
            //         } on FirebaseAuthException catch (e) {
            //           Utils().toastMessage(e.message.toString());
            //           setState(() {
            //             loading = false;
            //           });
            //         }
            //       } else {
            //         Utils().toastMessage('something wrong');
            //       }
            //     },
            //     child: Container(
            //       height: 50.h,
            //       width: 150.w,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20.r),
            //           color: Colors.green),
            //       child: Center(
            //           child: loading
            //               ? const CircularProgressIndicator(
            //                   strokeWidth: 3,
            //                   color: Colors.white,
            //                 )
            //               : Text(
            //                   'Login Admin',
            //                   style: TextStyle(
            //                       fontSize: 20.sp, fontWeight: FontWeight.bold),
            //                 )),
            //     ),
            //   ),
            // ),
            // SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            // Container(
            //   height: 300.h,
            // )
          ],
        ),
      ),
    ));
  }
}

