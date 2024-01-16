import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventra_pro/screens/home/vehicale%20saller%20information/vehical_detail_screen_two.dart';

class VehiclesellerDetailScreen extends StatefulWidget {
  const VehiclesellerDetailScreen({super.key});

  @override
  State<VehiclesellerDetailScreen> createState() =>
      VehiclesellerDetailScreenState();
}

class VehiclesellerDetailScreenState extends State<VehiclesellerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Center(
            child: Text(
              'Vehicle seller Information\nDetails Screen',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20.h),
          Container(
              height: 540.h,
              width: 378.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("vehicleandSalllerInformaation")
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

                            {
                              return InkWell(
                                onTap: () {
                                  Get.to(VehicleDetailScreenTwo(
                                    date: data['date'],
                                    name_of_seller: data['name_of_seller'],
                                    address: data['address'],
                                    purchase_Price: data['purchase_Price'],
                                    year: data['year'],
                                    make: data['make'],
                                    model: data['model'],
                                    vinn: data['vinn'],
                                    image1: data['image1'],
                                    image2: data['image2'],
                                    image3: data['image3'],
                                    image4: data['image4'],
                                    image5: data['image5'],
                                    image6: data['image6'],
                                    image7: data['image7'],
                                    image8: data['image8'],
                                    image9: data['image9'],
                                    image10: data['image10'],
                                    image11: data['image11'],
                                  ));
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w,
                                            right: 10.w,
                                            top: 10,
                                            bottom: 10.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${data['name_of_seller']}',
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
                            }
                          });
                    }
                  })),
        ],
      ),
    ));
  }
}
