import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InventoryDetailScreenTwo extends StatefulWidget {
  String? id;
  String? carName;
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
  String? image13;
  String? image14;
  String Receipt;
  InventoryDetailScreenTwo(
      {super.key,
      this.id,
      this.carName,
      this.by_name_of_parts,
      this.condition,
      this.make,
      this.make2,
      this.model,
      this.size,
      this.tires,
      this.vinn,
      this.year,
      this.image12,
      this.image13,
      this.image14,
       required this.Receipt,
      });

  @override
  State<InventoryDetailScreenTwo> createState() =>
      _InventoryDetailScreenTwoState();
}

class _InventoryDetailScreenTwoState extends State<InventoryDetailScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: (){
              FirebaseFirestore.instance.collection("inventoryTrackList").doc(widget.id).delete().then((value){
                Navigator.pop(context);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.delete,color: Colors.red,),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            Card(
              child: ListTile(
                title: Text("Car Name"),
                trailing: Text(widget.carName.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Parts Name"),
                trailing: Text(widget.by_name_of_parts.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Year"),
                trailing: Text(widget.year.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Make"),
                trailing: Text(widget.make.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Model"),
                trailing: Text(widget.model.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("VIN#1"),
                trailing: Text(widget.vinn.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Tires"),
                trailing: Text(widget.tires.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Receipt"),
                trailing: Text(widget.Receipt.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Size"),
                trailing: Text(widget.size.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Condition"),
                trailing: Text(widget.condition.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Make"),
                trailing: Text(widget.make2.toString()),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                Center(
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.image13.toString())
                    ),
                  ),
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
                        image: NetworkImage(widget.image14.toString())),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
