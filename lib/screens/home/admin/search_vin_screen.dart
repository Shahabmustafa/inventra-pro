import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventra_pro/screens/home/admin/updat_vehical_seller_information_screen.dart';
import 'package:inventra_pro/screens/home/vehicale%20saller%20information/vehical_detail_screen_two.dart';

class SearchVinScreen extends StatefulWidget {
  const SearchVinScreen({Key? key}) : super(key: key);

  @override
  State<SearchVinScreen> createState() => _SearchVinScreenState();
}

class _SearchVinScreenState extends State<SearchVinScreen> {

  final vin = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(color: Colors.black),
              controller: vin,
              decoration: InputDecoration(
                labelText: 'Search by VIN#1',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              onChanged: (String value){
                setState(() {

                });
              },
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("vehicleandSalllerInformaation")
                    .where("vinn",isGreaterThanOrEqualTo: vin.text.toString()).snapshots(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return vin.text.isEmpty ?
                    Center(
                      child: Text(
                        "Search Your Vin",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),),
                    ) :
                    ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,index){
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text("Vin #"),
                            subtitle: Text(snapshot.data!.docs[index]["vinn"]),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateVehicalSellerInformation(
                                      uid: snapshot.data!.docs[index].id,
                                      sellerName: snapshot.data?.docs[index]["name_of_seller"],
                                    ),
                                    ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: (){
                                    FirebaseFirestore.instance
                                        .collection("vehicleandSalllerInformaation")
                                        .doc(snapshot.data!.docs[index].id).delete();
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => VehicleDetailScreenTwo(
                                image1: snapshot.data!.docs[index]["image1"],
                                image2: snapshot.data!.docs[index]["image2"],
                                image3: snapshot.data!.docs[index]["image3"],
                                image4: snapshot.data!.docs[index]["image4"],
                                image5: snapshot.data!.docs[index]["image5"],
                                image6: snapshot.data!.docs[index]["image6"],
                                image7: snapshot.data!.docs[index]["image7"],
                                image8: snapshot.data!.docs[index]["image8"],
                                image9: snapshot.data!.docs[index]["image9"],
                                image10: snapshot.data!.docs[index]["image10"],
                                image11: snapshot.data!.docs[index]["image11"],
                                date: snapshot.data!.docs[index]["date"],
                                address: snapshot.data!.docs[index]["address"],
                                model: snapshot.data!.docs[index]["model"],
                                make: snapshot.data!.docs[index]["make"],
                                name_of_seller: snapshot.data!.docs[index]["name_of_seller"],
                                vinn: snapshot.data!.docs[index]["vinn"],
                                year: snapshot.data!.docs[index]["year"],
                                purchase_Price: snapshot.data!.docs[index]["purchase_Price"],
                              ),
                              ),
                              );
                            },
                          ),
                        );
                      },
                    );

                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
