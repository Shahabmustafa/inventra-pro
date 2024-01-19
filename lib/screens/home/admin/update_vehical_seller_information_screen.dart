import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
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
              Container(
                height: 40.h,
                width: 350.w,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Center(
                  child: InkWell(
                    onTap: () async {
                      print("sasa");
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
            ],
          ),
        ),
      ),
    );
  }
}
