import 'package:InventaPro/screens/home/admin/update_inventry_seller_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../inventory track list/inventory_detail_screen_two.dart';

class SearchInventryScreen extends StatefulWidget {
  const SearchInventryScreen({Key? key}) : super(key: key);

  @override
  State<SearchInventryScreen> createState() => _SearchInventryScreenState();
}

class _SearchInventryScreenState extends State<SearchInventryScreen> {

  final searchInventry = TextEditingController();

  var search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(color: Colors.black),
              controller: searchInventry,
              decoration: InputDecoration(
                labelText: 'Search by Car',
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
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("inventoryTrackList")
                    .orderBy("carName")
                    .startAt([search]).endAt([search + "\uf8ff"]).snapshots(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return searchInventry.text.isEmpty ?
                    Center(
                      child: Text(
                        "Search Your Car",style: TextStyle(
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
                            title: Text("Car Name"),
                            subtitle: Text(snapshot.data!.docs[index]["carName"]),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateInventryInformation(
                                      uid: snapshot.data!.docs[index].id,),
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
                                        .collection("inventoryTrackList")
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                  InventoryDetailScreenTwo(
                                    id: snapshot.data!.docs[index].id,
                                    carName: snapshot.data!.docs[index]["carName"],
                                    by_name_of_parts: snapshot.data!.docs[index]["by_name_of_parts"],
                                    condition: snapshot.data!.docs[index]["condition"],
                                    make: snapshot.data!.docs[index]["make"],
                                    model: snapshot.data!.docs[index]["model"],
                                    make2: snapshot.data!.docs[index]["make2"],
                                    tires: snapshot.data!.docs[index]["tires"],
                                    year: snapshot.data!.docs[index]["year"],
                                    size: snapshot.data!.docs[index]["size"],
                                    image12: snapshot.data!.docs[index]["image12"],
                                    vinn: snapshot.data!.docs[index]["vinn"],
                                    Receipt: snapshot.data!.docs[index]["search_list_by_size_of_tires"],
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
