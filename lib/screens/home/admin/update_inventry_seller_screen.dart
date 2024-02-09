import 'dart:io';

import 'package:InventaPro/provider/update_images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../provider/WidgetsViewModel1.dart';

class UpdateInventryInformation extends StatefulWidget {
  UpdateInventryInformation({Key? key,required this.uid}) : super(key: key);
  String uid;
  @override
  State<UpdateInventryInformation> createState() => _UpdateInventryInformationState();
}

class _UpdateInventryInformationState extends State<UpdateInventryInformation> {
  bool loading = false;

  TextEditingController carName = TextEditingController();
  TextEditingController partName = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController make = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController vinn = TextEditingController();
  TextEditingController tires = TextEditingController();
  TextEditingController receipt = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController condition = TextEditingController();
  TextEditingController makes1 = TextEditingController();
  TextEditingController make2 = TextEditingController();
  final _key = GlobalKey<FormState>();

  void fetchDataFromFirebase() async {
    try {
      DocumentSnapshot documentSnapshot =
      await FirebaseFirestore.instance.collection("inventoryTrackList").doc(widget.uid).get();

      if (documentSnapshot.exists) {
        Map<String, dynamic>? data = documentSnapshot.data() as Map<String, dynamic>?;

        setState(() {
          carName.text = data?["carName"];
          partName.text = data?["by_name_of_parts"];
          year.text = data?["year"];
          make.text = data?["make"];
          model.text = data?["model"];
          vinn.text = data?["vinn"];
          tires.text = data?["tires"];
          receipt.text = data?["search_list_by_size_of_tires"];
          size.text = data?["size"];
          condition.text = data?["condition"];
          makes1.text = data?["make1"];
          make2.text = data?["make2"];
        });
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching data from Firebase: $e');
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataFromFirebase();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Vehical"),
        centerTitle: true,
      ),
      body: Consumer<updateImagesController>(
        builder: (context,value,child){
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("inventoryTrackList").doc(widget.uid).snapshots(),
                      builder: (context,snapshot){
                       if(snapshot.hasData){
                         Map<String,dynamic> data = snapshot.data!.data() as Map<String,dynamic>;
                         return Column(
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 GestureDetector(
                                   onTap: (){
                                     // value.pickCameraImage12(context, widget.uid);
                                   },
                                   child: Center(
                                     child: Container(
                                       height: 100,
                                       width: 100,
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(100),
                                           border: Border.all(color: Colors.black,),
                                           image: value.image12 ==
                                               null ?
                                           DecorationImage(
                                               image: NetworkImage(data["image12"]),
                                               fit: BoxFit.cover
                                           ) : DecorationImage(
                                               image: FileImage(File(value.image12!.path)),
                                               fit: BoxFit.cover
                                           )
                                       ),
                                     ),
                                   ),
                                 ),
                                 GestureDetector(
                                   onTap: (){
                                     // value.pickCameraImage13(context, widget.uid);
                                   },
                                   child: Center(
                                     child: Container(
                                       height: 100,
                                       width: 100,
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(100),
                                           border: Border.all(color: Colors.black,),
                                           image: value.image13 ==
                                               null ?
                                           DecorationImage(
                                               image: NetworkImage(data["image13"]),
                                               fit: BoxFit.cover
                                           ) : DecorationImage(
                                               image: FileImage(File(value.image13!.path)),
                                               fit: BoxFit.cover
                                           )
                                       ),                                       ),
                                   ),
                                 ),
                                 GestureDetector(
                                   onTap: (){
                                     // value.pickCameraImage14(context, widget.uid);
                                   },
                                   child: Center(
                                     child: Container(
                                       height: 100,
                                       width: 100,
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(100),
                                           border: Border.all(color: Colors.black,),
                                           image: value.image14 ==
                                               null ?
                                           DecorationImage(
                                               image: NetworkImage(data["image14"]),
                                               fit: BoxFit.cover
                                           ) : DecorationImage(
                                               image: FileImage(File(value.image14!.path)),
                                               fit: BoxFit.cover
                                           )
                                       ),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ],
                         );
                       }else{
                         return Center(child: CircularProgressIndicator());
                       }
                      },
                    )
                  ),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: partName,
                          decoration: InputDecoration(
                            label: Text("Part Name"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: carName,
                          decoration: InputDecoration(
                            label: Text("Car Name"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: condition,
                          decoration: InputDecoration(
                            label: Text("Condition"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: make,
                          decoration: InputDecoration(
                            label: Text("Make"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: makes1,
                          decoration: InputDecoration(
                            label: Text("Make 1"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: make2,
                          decoration: InputDecoration(
                            label: Text("Make 2"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: model,
                          decoration: InputDecoration(
                            label: Text("Model"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: receipt,
                          decoration: InputDecoration(
                            label: Text("Receipt"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: size,
                          decoration: InputDecoration(
                            label: Text("Size"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: tires,
                          decoration: InputDecoration(
                            label: Text("Tires"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: vinn,
                          decoration: InputDecoration(
                            label: Text("VIN"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: year,
                          decoration: InputDecoration(
                            label: Text("Year"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          if(_key.currentState!.validate()){
                            setState(() {
                              loading = true;
                            });
                            try{
                              await FirebaseFirestore.instance
                                  .collection("inventoryTrackList")
                                  .doc(widget.uid).update({
                                "by_name_of_parts" : partName.text,
                                "carName" : carName.text,
                                "condition" : condition.text,
                                "make" : make.text,
                                "make1" : makes1.text,
                                "make2" : make2.text,
                                "model" : model.text,
                                "search_list_by_size_of_tires" : receipt.text,
                                "size" : size.text,
                                "tires" : tires.text,
                                "vinn" : vinn.text,
                                "year" : year.text,
                              }).then((value){
                                print("asaas");
                                Navigator.pop(context);
                                setState(() {
                                  loading = false;
                                });
                              }).onError((error, stackTrace){
                                setState(() {
                                  print(error);
                                  loading = false;
                                });
                              });
                            }catch(e){
                              setState(() {
                                loading = false;
                              });
                            }
                          }else{
                            print("Enter");
                          }
                        },
                        child: loading ?
                        Center(child: CircularProgressIndicator(color: Colors.white,)) :
                        Text(
                          'Update',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}


Widget showBottom(){
  return AlertDialog();
}