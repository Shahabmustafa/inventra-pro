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
import 'package:inventra_pro/screens/login/login_screen.dart';
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

  bool visibility = true;

  static String admin = "admininventapro21@gmail.com";

  @override

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Vehicle Track List"),
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
          ),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: TextField(
                onChanged: (String value) {
                  setState(() {});
                },
                style: TextStyle(color: Colors.black),
                controller: searchFilter,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: ' Parts Search',
                ),
              ),
            ),
            //////////////////////////////////
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                  height: 100.h,
                  width: 378.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r)),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("inventoryTrackList").where("carName",isGreaterThanOrEqualTo: searchFilter.text.toString())
                          .snapshots(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          return searchFilter.text.isEmpty ?
                          Center(child: Text("Please Search your Car Parts",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)) :
                          ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context,index){

                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => InventoryDetailScreenTwo(
                                    carName: snapshot.data!.docs[index]["carName"],
                                    by_name_of_parts: snapshot.data!.docs[index]["by_name_of_parts"],
                                    year: snapshot.data!.docs[index]["year"],
                                    make: snapshot.data!.docs[index]["make"],
                                    model: snapshot.data!.docs[index]["model"],
                                    vinn: snapshot.data!.docs[index]["vinn"],
                                    tires: snapshot.data!.docs[index]["tires"],
                                    Receipt: snapshot.data!.docs[index]["search_list_by_size_of_tires"],
                                    size: snapshot.data!.docs[index]["size"],
                                    condition: snapshot.data!.docs[index]["condition"],
                                    make2: snapshot.data!.docs[index]["make2"],
                                    image12: snapshot.data!.docs[index]["image12"],

                                  )));
                                },
                                child: Card(
                                  color: Colors.white,
                                  child: ListTile(
                                    title: Text(snapshot.data!.docs[index]["carName"]),
                                  ),
                                ),
                              );
                            },
                          );
                        }else{
                          return Center(child: CircularProgressIndicator());
                        }
                      })),
            ),
            ///
            SizedBox(height: 20.h),
            SizedBox(height: 10.h),
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(const VehicleSllerInformationScreen());
                },
                child: Container(
                  height: 40.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
            // Center(
            //   child: InkWell(
            //     onTap: () {
            //       Get.to(const InventoryTrackListScreen());
            //     },
            //     child: Container(
            //       height: 40.h,
            //       width: 340.w,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           color: Colors.black),
            //       child: Center(
            //           child: Text(
            //         'Inventory Track List',
            //         style:
            //             TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            //       )),
            //     ),
            //   ),
            // ),
            SizedBox(height: 10.h),
            Divider(thickness: 1.w),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: emailController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Admin Email',
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: passwordController,
                obscureText: visibility,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: InkWell(
                    onTap: (){
                      visibility =! visibility;
                      setState(() {

                      });
                    },
                    child: Icon(visibility ? Icons.visibility_off : Icons.visibility),
                  ),
                  hintText: 'Admin Password',
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: InkWell(
                onTap: () {
                  // print(admin);
                  setState(() {
                    loading = true;
                  });
                  if(emailController.text.toString() != admin.toString()){
                    setState(() {
                      loading = false;
                    });
                    Get.snackbar("Error","Your Email has not Match Admin Email");
                  }else{
                    _auth.signInWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString())
                        .then((value) {
                      setState(() {
                        loading = false;
                      });
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminScreen()));
                    }).onError((error, stackTrace){
                      setState(() {
                        loading = false;
                      });
                    });
                  }
                },
                child: Container(
                  height: 40.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.black),
                  child: Center(
                      child: loading
                          ? Center(
                            child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.white,
                              ),
                          )
                          : Text(
                              'Login Admin',
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                            )),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            Container(
              height: 300.h,
            )
          ],
        ),
      ),
    ));
  }
}

