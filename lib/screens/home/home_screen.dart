import 'package:InventaPro/screens/home/vehicale%20saller%20information/vehical_saller_info_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../login/login_screen.dart';
import '../utils/utils.dart';
import 'admin/admin_screen.dart';
import 'inventory track list/inventory_detail_screen_two.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchFilter = TextEditingController();
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  Future<String?> adminAccess()async{
   var doc = await FirebaseFirestore.instance.collection("admin").doc("admin").get();
   if(doc.exists){
    if(doc.data() != null){
      String adminEmail = (doc.data()!["email"] as dynamic);
      return adminEmail;
    }else{
      return null;
    }
   }
  }

  bool visibility = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(FirebaseAuth.instance.currentUser?.email);
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Vehicle Track List"),
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: (){
                    FirebaseAuth.instance.signOut().then((value){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    });
                  },
                  child: Icon(Icons.exit_to_app),
                ),
              ),
            ],
          ),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: TextField(
                onChanged: (String value) {
                  setState(() {});
                },
                style: TextStyle(color: Colors.black),
                controller: searchFilter,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: ' Parts Search',
                ),
              ),
            ),
            //////////////////////////////////
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                  height: 100.h,
                  width: 378.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r)),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("inventoryTrackList").where("carName",isGreaterThanOrEqualTo: searchFilter.text.toString())
                          .snapshots(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          return searchFilter.text.isEmpty ?
                          Center(child: Text("Please Search your Car Parts",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)) :
                          ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context,index){

                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => InventoryDetailScreenTwo(
                                    carName: snapshot.data!.docs[index]["carName"],
                                    by_name_of_parts: snapshot.data!.docs[index]["by_name_of_parts"],
                                    year: snapshot.data!.docs[index]["year"],
                                    make: snapshot.data!.docs[index]["make"],
                                    model: snapshot.data!.docs[index]["model"],
                                    vinn: snapshot.data!.docs[index]["vinn"],
                                    tires: snapshot.data!.docs[index]["tires"],
                                    Receipt: snapshot.data!.docs[index]["search_list_by_size_of_tires"],
                                    size: snapshot.data!.docs[index]["size"],
                                    condition: snapshot.data!.docs[index]["condition"],
                                    make2: snapshot.data!.docs[index]["make2"],
                                    image12: snapshot.data!.docs[index]["image12"],

                                  )));
                                },
                                child: Card(
                                  color: Colors.white,
                                  child: ListTile(
                                    title: Text(snapshot.data!.docs[index]["carName"]),
                                  ),
                                ),
                              );
                            },
                          );
                        }else{
                          return Center(child: CircularProgressIndicator());
                        }
                      })),
            ),
            ///
            SizedBox(height: 20.h),
            SizedBox(height: 10.h),
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(const VehicleSllerInformationScreen());
                },
                child: Container(
                  height: 40.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  child: Center(
                      child: Text(
                        'Vehicle seller Information',
                        style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 10.h),
            Divider(thickness: 1.w),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: emailController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Admin Email',
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: passwordController,
                obscureText: visibility,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: InkWell(
                    onTap: (){
                      visibility =! visibility;
                      setState(() {

                      });
                    },
                    child: Icon(visibility ? Icons.visibility_off : Icons.visibility),
                  ),
                  hintText: 'Admin Password',
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: InkWell(
                onTap: ()async{
                  // print(admin);
                  String? admin = await adminAccess();
                  setState(() {
                    loading = true;
                  });
                  if(emailController.text.toString() != admin){
                    setState(() {
                      loading = false;
                    });
                    Get.snackbar("Error","Your Email has not Match Admin Email");
                  }else{
                    _auth.signInWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString())
                        .then((value) {
                      setState(() {
                        loading = false;
                      });
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminScreen()));
                    }).onError((error, stackTrace){
                      setState(() {
                        loading = false;
                      });
                    });
                  }
                },
                child: Container(
                  height: 40.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.black),
                  child: Center(
                      child: loading
                          ? Center(
                            child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.white,
                              ),
                          )
                          : Text(
                              'Login Admin',
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                            )),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            Container(
              height: 300.h,
            )
          ],
        ),
      ),
    ));
  }
}

