import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VehicleDetailScreenTwo extends StatefulWidget {
  String? address;
  String? data;
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
      this.image9,
      });

  @override
  State<VehicleDetailScreenTwo> createState() => _VehicleDetailScreenTwoState();
}

class _VehicleDetailScreenTwoState extends State<VehicleDetailScreenTwo> {

  static String admin = "admininventapro21@gmail.com";


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
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
              Card(
                child: ListTile(
                  leading: Icon(Icons.date_range),
                  title: Text("Date"),
                  trailing: Text(widget.date.toString()),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Seller Name"),
                  trailing: Text(widget.name_of_seller.toString()),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text("Address"),
                  trailing: Text(widget.address.toString()),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.price_change),
                  title: Text("Purchase Price"),
                  trailing: Text(widget.purchase_Price.toString()),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.price_change),
                  title: Text("Purchase Price"),
                  trailing: Text(widget.purchase_Price.toString()),
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30.r)),
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
              SizedBox(
                height: 10,
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
              SizedBox(
                height: 20,
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
              SizedBox(
                height: 10,
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
              SizedBox(
                height: 10,
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.date_range),
                  title: Text("Year"),
                  trailing: Text(widget.year.toString()),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.coffee_maker),
                  title: Text("Make"),
                  trailing: Text(widget.make.toString()),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.model_training),
                  title: Text("Model"),
                  trailing: Text(widget.model.toString()),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.numbers),
                  title: Text("Vin#1"),
                  trailing: Text(widget.vinn.toString()),
                ),
              ),
              SizedBox(
                height: 10,
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
              SizedBox(
                height: 10,
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
      ),
    ));
  }
}
