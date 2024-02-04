import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'inventory_detail_screen_two.dart';

class InventoryTrackListDetaolScreenOne extends StatefulWidget {
  const InventoryTrackListDetaolScreenOne({super.key});

  @override
  State<InventoryTrackListDetaolScreenOne> createState() =>
      _InventoryTrackListDetaolScreenOneState();
}

class _InventoryTrackListDetaolScreenOneState
    extends State<InventoryTrackListDetaolScreenOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
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
                '  View All',
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          Container(
              height: 540.h,
              width: 378.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
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
                            DocumentSnapshot data = snapshot.data!.docs[index];

                            // final title = '${data['by_name_of_parts']}';
                            // if (searchFilter.text.isEmpty) {
                            //   return InkWell(
                            //     onTap: () {
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (context) =>
                            //                   CustomerDetailScreen(
                            //                     id: snapshot
                            //                         .data!.docs[index].id,
                            //                     name: data['customer_name'],
                            //                     comapanyName:
                            //                         data['company_name'],
                            //                     email: data['email_adress'],
                            //                     addressLine:
                            //                         data['address_line'],
                            //                     addressLine1:
                            //                         data['address_line_1'],
                            //                     addressLine2:
                            //                         data['address_ine_2'],
                            //                     city: data['city'],
                            //                     country: data['country'],
                            //                     identificationNo:
                            //                         data['identification_no'],
                            //                     shippingName:
                            //                         data['shipping_name'],
                            //                     stateorProvince:
                            //                         data['state_or_province'],
                            //                     postalCode:
                            //                         data['postal_code'],
                            //                   )));
                            //     },
                            //     child: Container(
                            //       child: Column(
                            //         children: [
                            //           Padding(
                            //             padding: EdgeInsets.only(
                            //                 left: 8.w,
                            //                 right: 8.w,
                            //                 top: 10,
                            //                 bottom: 10.h),
                            //             child: Row(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.spaceBetween,
                            //               children: [
                            //                 Text(
                            //                   '${data['customer_name']}',
                            //                   style: const TextStyle(
                            //                       color: Colors.white),
                            //                 ),
                            //                 const Icon(
                            //                   Icons.arrow_forward_ios,
                            //                   size: 15,
                            //                   color: Colors.white,
                            //                 )
                            //               ],
                            //             ),
                            //           ),
                            //           const Divider(
                            //             thickness: 0.2,
                            //             color: Colors.grey,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   );
                            // } else if (title.toLowerCase().contains(
                            //     searchFilter.text.toLowerCase().toString())) {
                            //   return InkWell(
                            //     onTap: () {
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (context) =>
                            //                   CustomerDetailScreen(
                            //                     id: snapshot
                            //                         .data!.docs[index].id,
                            //                     name: data['customer_name'],
                            //                     comapanyName:
                            //                         data['company_name'],
                            //                     email: data['email_adress'],
                            //                     addressLine:
                            //                         data['address_line'],
                            //                     addressLine1:
                            //                         data['address_line_1'],
                            //                     addressLine2:
                            //                         data['address_ine_2'],
                            //                     city: data['city'],
                            //                     country: data['country'],
                            //                     identificationNo:
                            //                         data['identification_no'],
                            //                     shippingName:
                            //                         data['shipping_name'],
                            //                     stateorProvince:
                            //                         data['state_or_province'],
                            //                     postalCode:
                            //                         data['postal_code'],
                            //                   )));
                            //     },
                            //     child: Container(
                            //       child: Column(
                            //         children: [
                            //           Padding(
                            //             padding: EdgeInsets.only(
                            //                 left: 8.w,
                            //                 right: 8.w,
                            //                 top: 10,
                            //                 bottom: 10.h),
                            //             child: Row(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.spaceBetween,
                            //               children: [
                            //                 Text(
                            //                   '${data['customer_name']}',
                            //                   style: const TextStyle(
                            //                       color: Colors.white),
                            //                 ),
                            //                 const Icon(
                            //                   Icons.arrow_forward_ios,
                            //                   size: 15,
                            //                   color: Colors.white,
                            //                 )
                            //               ],
                            //             ),
                            //           ),
                            //           const Divider(
                            //             thickness: 0.2,
                            //             color: Colors.grey,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   );
                            // } else {
                            //   return Container();
                            // }

                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InventoryDetailScreenTwo(
                                              id: data.id,
                                              carName: data["carName"],
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
                                              image12: data['image12'],
                                              image13: data['image13'],
                                              image14: data['image14'],
                                              Receipt: data["search_list_by_size_of_tires"],
                                            )));
                              },
                              child: Card(
                                elevation: 5,
                                color: Colors.white,
                                child: ListTile(
                                  title: Text(data['carName']),
                                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                                ),
                              )
                            );
                          });
                    }
                  })),
        ],
      ),
    ));
  }
}
