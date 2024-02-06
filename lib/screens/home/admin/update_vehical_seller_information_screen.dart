import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../provider/WidgetsViewModel1.dart';

class UpdateVehicalSellerInformation extends StatefulWidget {
  UpdateVehicalSellerInformation({Key? key,required this.uid,required this.sellerName}) : super(key: key);
  String uid;
  String sellerName;
  @override
  State<UpdateVehicalSellerInformation> createState() => _UpdateVehicalSellerInformationState();
}

class _UpdateVehicalSellerInformationState extends State<UpdateVehicalSellerInformation> {
  bool loading = false;

  TextEditingController sellerName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController make = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController vinn = TextEditingController();
  TextEditingController purchasePrice = TextEditingController();
  TextEditingController year = TextEditingController();


  void fetchDataFromFirebase() async {
    try {
      DocumentSnapshot documentSnapshot =
      await FirebaseFirestore.instance.collection("vehicleandSalllerInformaation").doc(widget.uid).get();

      if (documentSnapshot.exists) {
        Map<String, dynamic>? data = documentSnapshot.data() as Map<String, dynamic>?;

        setState(() {
          sellerName.text = data?["name_of_seller"];
          address.text = data?["address"];
          date.text = data?["date"];
          make.text = data?["make"];
          model.text = data?["model"];
          vinn.text = data?["vinn"];
          purchasePrice.text = data?["purchase_Price"];
          year.text = data?["year"];
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
    sellerName = TextEditingController(text: widget.sellerName);
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Vehical"),
        centerTitle: true,
      ),
      body: Consumer<WidgetsViewModel1>(
        builder: (context,value,child){
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    height: 450,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("vehicleandSalllerInformaation").doc(widget.uid).snapshots(),
                      builder: (context,snapshot){
                        if(snapshot.hasData){
                          Map<String,dynamic> data = snapshot.data!.data() as Map<String,dynamic>;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      value.selectCameraImage1();
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.imageFile1 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image1"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.imageFile1!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      value.selectCameraImage2();
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.imageFile2 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image2"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.imageFile2!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),                                       ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      value.selectCameraImage3();
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.imageFile3 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image3"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.imageFile3!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      value.selectCameraImage4();
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.imageFile4 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image4"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.imageFile4!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      value.selectCameraImage5();
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.imageFile5 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image5"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.imageFile5!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),                                       ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      value.selectCameraImage6();
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.imageFile6 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image6"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.imageFile6!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      value.selectCameraImage7();
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.imageFile7 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image7"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.imageFile7!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),                                       ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      value.selectCameraImage8();
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.imageFile8 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image8"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.imageFile8!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      value.selectCameraImage9();
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.imageFile9 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image9"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.imageFile9!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      value.selectCameraImage10();
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.imageFile10 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image10"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.imageFile10!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      value.selectCameraImage11();
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.imageFile11 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image11"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.imageFile11!.path)),
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
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: sellerName,
                    decoration: InputDecoration(
                      hintText: "Seller Name",
                    ),
                    onSaved: (String? newValue) {},
                    validator: (String? sellerName) {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: address,
                    decoration: InputDecoration(
                      hintText: "Address",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: date,
                    decoration: InputDecoration(
                      hintText: "Date",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: make,
                    decoration: InputDecoration(
                      hintText: "Make",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: model,
                    decoration: InputDecoration(
                      hintText: "Model",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: vinn,
                    decoration: InputDecoration(
                      hintText: "Vinn",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: purchasePrice,
                    decoration: InputDecoration(
                      hintText: "Purchase Price",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: year,
                    decoration: InputDecoration(
                      hintText: "Year",
                    ),
                    onChanged: (dynamic value){
                      year.text = value;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 40.h,
                      width: 350.w,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });
                            try{
                              await value.uploadImage1(context);
                              await value.uploadImage2(context);
                              await value.uploadImage3(context);
                              await value.uploadImage4(context);
                              await value.uploadImage5(context);
                              await value.uploadImage6(context);
                              await value.uploadImage7(context);
                              await value.uploadImage8(context);
                              await value.uploadImage9(context);
                              await value.uploadImage10(context);
                              await value.uploadImage11(context);
                              await FirebaseFirestore.instance
                                  .collection("vehicleandSalllerInformaation")
                                  .doc(widget.uid).update({
                                "name_of_seller" : sellerName.text,
                                "address" : address.text,
                                "date" : date.text,
                                "make" : make.text,
                                "model" : model.text,
                                "vinn" : vinn.text,
                                "purchase_Price" : purchasePrice.text,
                                "year" : year.text,
                                "image1" : value.imageUrlDownload1,
                                "image2" : value.imageUrlDownload2,
                                "image3" : value.imageUrlDownload3,
                                "image4" : value.imageUrlDownload4,
                                "image5" : value.imageUrlDownload5,
                                "image6" : value.imageUrlDownload6,
                                "image7" : value.imageUrlDownload7,
                                "image8" : value.imageUrlDownload8,
                                "image9" : value.imageUrlDownload9,
                                "image10" : value.imageUrlDownload10,
                                "image11" : value.imageUrlDownload11,
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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
