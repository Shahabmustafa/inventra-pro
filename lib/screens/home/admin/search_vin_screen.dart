import 'package:InventaPro/screens/home/admin/update_vehical_seller_information_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../vehicale saller information/vehical_detail_screen_two.dart';

class SearchVinScreen extends StatefulWidget {
  const SearchVinScreen({Key? key}) : super(key: key);

  @override
  State<SearchVinScreen> createState() => _SearchVinScreenState();
}

class _SearchVinScreenState extends State<SearchVinScreen> {

  final vin = TextEditingController();
  final make = TextEditingController();
  var search = "";
  var search1 = "";
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: vin,
                    decoration: InputDecoration(
                      labelText: 'Search VIN#1',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    onChanged: (String value){
                      setState(() {
                        search = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: make,
                    decoration: InputDecoration(
                      labelText: 'Search Cars',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    onChanged: (String value){
                      setState(() {
                        search1 = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder(
                stream: search.isNotEmpty ? FirebaseFirestore.instance.collection("vehicleandSalllerInformaation")
                    .orderBy("vinn").startAt([search]).endAt([search + "\uf8ff"]).snapshots() :
                    search1.isNotEmpty ?
                FirebaseFirestore.instance.collection("vehicleandSalllerInformaation")
                    .orderBy("make").startAt([search1]).endAt([search1 + "\uf8ff"]).snapshots() : null,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return vin.text.isNotEmpty ?
                    ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,index){
                        return Card(
                          // key: snapshot.data!.docs[index].id,
                          color: Colors.white,
                          child: ListTile(
                            leading: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                  imageUrl: snapshot.data!.docs[index]["image6"],
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                            title: Text(snapshot.data!.docs[index]["make"]),
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
                    ) :
                    make.text.isNotEmpty ?
                    ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,index){
                        return Card(
                          // key: snapshot.data!.docs[index].id,
                          color: Colors.white,
                          child: ListTile(
                            leading: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                  imageUrl: snapshot.data!.docs[index]["image6"],
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                            title: Text(snapshot.data!.docs[index]["make"]),
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
                    ) : Text("");
                  }else{
                    return Center(child: Text(""));
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
