import 'dart:io';
import 'dart:math';

import 'package:InventaPro/provider/update_images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
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


  ImagePicker imagePicker = ImagePicker();


  File? pick1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataFromFirebase();
    print(widget.uid);
  }
  Widget build(BuildContext context) {
    sellerName = TextEditingController(text: widget.sellerName);
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
                                    onTap: ()async{
                                      // value.pickCameraImage1(context, widget.uid);
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.image1 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image1"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.image1!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      // value.pickCameraImage2(context, widget.uid);
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.image2 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image2"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.image2!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),                                       ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      // value.pickCameraImage3(context, widget.uid);
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.image3 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image3"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.image3!.path)),
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
                                      // value.pickCameraImage4(context, widget.uid);
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.image4 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image4"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.image4!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      // value.pickCameraImage5(context, widget.uid);
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.image5 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image5"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.image5!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),                                       ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      // value.pickCameraImage6(context, widget.uid);
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.image6 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image6"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.image6!.path)),
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
                                      // value.pickCameraImage7(context, widget.uid);
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.image7 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image7"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.image7!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),                                       ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      // value.pickCameraImage8(context, widget.uid);
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.image8 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image8"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.image8!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      // value.pickCameraImage9(context, widget.uid);
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.image9 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image9"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.image9!.path)),
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
                                      // value.pickCameraImage10(context, widget.uid);
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.image10 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image10"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.image10!.path)),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      // value.pickCameraImage11(context, widget.uid);
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.black,),
                                            image: value.image11 ==
                                                null ?
                                            DecorationImage(
                                                image: NetworkImage(data["image11"]),
                                                fit: BoxFit.cover
                                            ) : DecorationImage(
                                                image: FileImage(File(value.image11!.path)),
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
