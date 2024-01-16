import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VehicleDetailScreenTwo extends StatefulWidget {
  String? address;
  String? date;
  String? make;
  String? model;
  String? name_of_seller;
  String? purchase_Price;
  String? vinn;
  String? year;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  String? image6;
  String? image7;
  String? image8;
  String? image9;
  String? image10;
  String? image11;

  VehicleDetailScreenTwo(
      {super.key,
      this.address,
      this.date,
      this.make,
      this.model,
      this.name_of_seller,
      this.purchase_Price,
      this.vinn,
      this.year,
      this.image1,
      this.image10,
      this.image11,
      this.image2,
      this.image3,
      this.image4,
      this.image5,
      this.image6,
      this.image7,
      this.image8,
      this.image9});

  @override
  State<VehicleDetailScreenTwo> createState() => _VehicleDetailScreenTwoState();
}

class _VehicleDetailScreenTwoState extends State<VehicleDetailScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Container(
                height: 40.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(width: 1.w, color: Colors.blue)),
                child: Center(
                  child: Text(widget.date.toString(),
                      style: const TextStyle(color: Colors.white)),
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
                child: Center(
                  child: Text(widget.name_of_seller.toString(),
                      style: const TextStyle(color: Colors.white)),
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
                        border: Border.all(width: 1.w, color: Colors.blue)),
                    child: Center(
                      child: Text(widget.address.toString(),
                          style: const TextStyle(color: Colors.white)),
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
                    child: Center(
                      child: Text(widget.purchase_Price.toString(),
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
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
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.image1.toString())),
                ),
                SizedBox(width: 10.w),
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.image2.toString())),
                )
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.image3.toString())),
                ),
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.image4.toString())),
                ),
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.image5.toString())),
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
                  padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                  child: Container(
                    height: 40.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(width: 1.w, color: Colors.blue)),
                    child: Center(
                      child: Text(widget.year.toString(),
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 10.h, bottom: 10.h),
                  child: Container(
                    height: 40.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(width: 1.w, color: Colors.blue)),
                    child: Center(
                      child: Text(widget.make.toString(),
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 10.h, bottom: 10.h),
                  child: Container(
                    height: 40.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(width: 1.w, color: Colors.blue)),
                    child: Center(
                      child: Text(widget.model.toString(),
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
              child: Container(
                height: 40.h,
                width: 250.w,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(width: 1.w, color: Colors.blue)),
                child: Center(
                  child: Text(widget.vinn.toString(),
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Vehicle Pictures ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.image6.toString())),
                ),
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.image7.toString())),
                ),
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.image8.toString())),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.image9.toString())),
                ),
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.image10.toString())),
                ),
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.image11.toString())),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
