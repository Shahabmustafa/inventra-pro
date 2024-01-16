import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InventoryDetailScreenTwo extends StatefulWidget {
  String? by_name_of_parts;
  String? condition;
  String? make;
  String? make2;
  String? model;
  String? size;
  String? tires;
  String? vinn;
  String? year;
  String? image12;
  InventoryDetailScreenTwo(
      {super.key,
      this.by_name_of_parts,
      this.condition,
      this.make,
      this.make2,
      this.model,
      this.size,
      this.tires,
      this.vinn,
      this.year,
      this.image12});

  @override
  State<InventoryDetailScreenTwo> createState() =>
      _InventoryDetailScreenTwoState();
}

class _InventoryDetailScreenTwoState extends State<InventoryDetailScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                '  Details',
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
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
                padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                child: Container(
                    height: 40.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(width: 1.w, color: Colors.blue)),
                    child: Center(
                      child: Text(widget.by_name_of_parts.toString(),
                          style: const TextStyle(color: Colors.white)),
                    )),
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
                      child: Text(widget.year.toString(),
                          style: const TextStyle(color: Colors.white)),
                    )),
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
                    )),
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
                child: Center(
                  child: Text(widget.model.toString(),
                      style: const TextStyle(color: Colors.white)),
                )),
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
                child: Center(
                  child: Text(widget.vinn.toString(),
                      style: const TextStyle(color: Colors.white)),
                )),
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
                    child: Center(
                      child: Text(widget.tires.toString(),
                          style: const TextStyle(color: Colors.white)),
                    )),
              ),
              // Padding(
              //   padding: EdgeInsets.only(
              //       left: 5.w, top: 10.h, bottom: 10.h, right: 10.w),
              //   child: Container(
              //     height: 40.h,
              //     width: 200.w,
              //     decoration: BoxDecoration(
              //         color: Colors.blue,
              //         borderRadius: BorderRadius.circular(6.r),
              //         border: Border.all(width: 1.w, color: Colors.blue)),
              //     child: TextFormField(
              //       obscureText: true,
              //       style: const TextStyle(color: Colors.white),
              //       // controller: searchListBySizeController,
              //       decoration: InputDecoration(
              //           border: InputBorder.none,
              //           contentPadding: EdgeInsets.only(bottom: 15.h),
              //           labelText: 'Search List by size of tire',
              //           labelStyle: const TextStyle(color: Colors.white),
              //           // prefixIcon: const Icon(
              //           //   Icons.password,
              //           //   color: Colors.white,
              //           // ),
              //           hintStyle: const TextStyle(color: Colors.white)),
              //     ),
              //   ),
              // ),
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
                    child: Center(
                      child: Text(widget.size.toString(),
                          style: const TextStyle(color: Colors.white)),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w, top: 10.h, bottom: 10.h),
                child: Container(
                    height: 40.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(width: 1.w, color: Colors.blue)),
                    child: Center(
                      child: Text(widget.condition.toString(),
                          style: const TextStyle(color: Colors.white)),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w, top: 10.h, bottom: 10.h),
                child: Container(
                    height: 40.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(width: 1.w, color: Colors.blue)),
                    child: Center(
                      child: Text(widget.make2.toString(),
                          style: const TextStyle(color: Colors.white)),
                    )),
              ),
            ],
          ),
          Center(
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.image12.toString())),
            ),
          ),
          // SizedBox(height: 5.h),
          // Center(
          //   child: InkWell(
          //     onTap: () {

          //     },
          //     child: Container(
          //       height: 40.h,
          //       width: 130.w,
          //       decoration: BoxDecoration(
          //           color: Colors.green,
          //           borderRadius: BorderRadius.circular(10.r)),
          //       child: Center(
          //         child: Text(
          //           'Send',
          //           style:
          //               TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          const Spacer()
        ],
      ),
    ));
  }
}
