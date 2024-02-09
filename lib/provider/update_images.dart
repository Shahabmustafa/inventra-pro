


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class updateImagesController with ChangeNotifier{

  final uid = Uuid();
  ImagePicker imagePicker = ImagePicker();
  final _user = FirebaseFirestore.instance.collection('vehicleandSalllerInformaation');
  final inventoryTrackList = FirebaseFirestore.instance.collection('inventoryTrackList');
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  XFile? _image1;
  XFile? get image1 => _image1;

  XFile? _image2;
  XFile? get image2 => _image2;

  XFile? _image3;
  XFile? get image3 => _image3;

  XFile? _image4;
  XFile? get image4 => _image4;

  XFile? _image5;
  XFile? get image5 => _image5;

  XFile? _image6;
  XFile? get image6 => _image6;

  XFile? _image7;
  XFile? get image7 => _image7;

  XFile? _image8;
  XFile? get image8 => _image8;

  XFile? _image9;
  XFile? get image9 => _image9;

  XFile? _image10;
  XFile? get image10 => _image10;

  XFile? _image11;
  XFile? get image11 => _image11;

  XFile? _image12;
  XFile? get image12 => _image12;

  XFile? _image13;
  XFile? get image13 => _image13;

  XFile? _image14;
  XFile? get image14 => _image14;

  Future pickCameraImage1(BuildContext context,String id,ImageSource imageSource)async{
    final picked = await imagePicker.pickImage(source: imageSource);
    if(picked != null){
      _image1 = XFile(picked.path);
      notifyListeners();
      uploadImage1(context,id);
    }
  }

  Future pickCameraImage2(BuildContext context,String id,ImageSource imageSource)async{
    final picked = await imagePicker.pickImage(source: imageSource);
    if(picked != null){
      _image2 = XFile(picked.path);
      notifyListeners();
      uploadImage2(context,id);
    }
  }

  Future pickCameraImage3(BuildContext context,String id,ImageSource imageSource)async{
    final picked = await imagePicker.pickImage(source: imageSource);
    if(picked != null){
      _image3 = XFile(picked.path);
      notifyListeners();
      uploadImage3(context,id);
    }
  }

  Future pickCameraImage4(BuildContext context,String id,ImageSource imageSource)async{
    final picked = await imagePicker.pickImage(source: imageSource);
    if(picked != null){
      _image4 = XFile(picked.path);
      notifyListeners();
      uploadImage4(context,id);
    }
  }

  Future pickCameraImage5(BuildContext context,String id,ImageSource imageSource)async{
    final picked = await imagePicker.pickImage(source: imageSource);
    if(picked != null){
      _image5 = XFile(picked.path);
      notifyListeners();
      uploadImage5(context,id);
    }
  }

  Future pickCameraImage6(BuildContext context,String id,ImageSource imageSource)async{
    final picked = await imagePicker.pickImage(source: imageSource);
    if(picked != null){
      _image6 = XFile(picked.path);
      notifyListeners();
      uploadImage6(context,id);
    }
  }

  Future pickCameraImage7(BuildContext context,String id,ImageSource imageSource)async{
    final picked = await imagePicker.pickImage(source: imageSource);
    if(picked != null){
      _image7 = XFile(picked.path);
      notifyListeners();
      uploadImage7(context,id);
    }
  }

  Future pickCameraImage8(BuildContext context,String id,ImageSource imageSource)async{
    final picked = await imagePicker.pickImage(source: imageSource);
    if(picked != null){
      _image8 = XFile(picked.path);
      notifyListeners();
      uploadImage8(context,id);
    }
  }

  Future pickCameraImage9(BuildContext context,String id,ImageSource imageSource)async{
    final picked = await imagePicker.pickImage(source: imageSource);
    if(picked != null){
      _image9 = XFile(picked.path);
      notifyListeners();
      uploadImage9(context,id);
    }
  }


  Future pickCameraImage10(BuildContext context,String id,ImageSource imageSource)async{
    final picked = await imagePicker.pickImage(source: imageSource);
    if(picked != null){
      _image10 = XFile(picked.path);
      notifyListeners();
      uploadImage10(context,id);
    }
  }

  Future pickCameraImage11(BuildContext context,String id,ImageSource imageSource)async{
    final picked = await imagePicker.pickImage(source: imageSource);
    if(picked != null){
      _image11 = XFile(picked.path);
      notifyListeners();
      uploadImage11(context,id);
    }
  }

  Future pickCameraImage12(BuildContext context,String id,ImageSource imageSource)async{
    final picked = await imagePicker.pickImage(source: imageSource);
    if(picked != null){
      _image12 = XFile(picked.path);
      notifyListeners();
      uploadImage12(context,id);
      Navigator.pop(context);
    }
  }

  Future pickCameraImage13(BuildContext context,String id,ImageSource imageSource)async{
    final picked = await imagePicker.pickImage(source: imageSource);
    if(picked != null){
      _image13 = XFile(picked.path);
      notifyListeners();
      uploadImage13(context,id);
    }
  }

  Future pickCameraImage14(BuildContext context,String id,ImageSource imageSource)async{
    final picked = await imagePicker.pickImage(source: imageSource);
    if(picked != null){
      _image14 = XFile(picked.path);
      notifyListeners();
      uploadImage14(context,id);
    }
  }



  void uploadImage1(BuildContext context,String id)async{
    var imageUid = uid.v4();
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref(imageUid);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image1!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    _user.doc(id).update({
      'image1' : newUrl.toString(),
    }).then((value){
      print('Update Peofile');
      _image1 = null;
    }).onError((error, stackTrace){
      // Utils.toasstMessage(error.toString());
    });
  }
  void uploadImage2(BuildContext context,String id)async{
    var imageUid = uid.v4();
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref(imageUid);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image2!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    _user.doc(id).update({
      'image2' : newUrl.toString(),
    }).then((value){
      print('Update Peofile');
      _image2 = null;
    }).onError((error, stackTrace){
      // Utils.toasstMessage(error.toString());
    });
  }
  void uploadImage3(BuildContext context,String id)async{
    var imageUid = uid.v4();
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref(imageUid);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image3!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    _user.doc(id).update({
      'image3' : newUrl.toString(),
    }).then((value){
      print('Update Peofile');
      _image3 = null;
    }).onError((error, stackTrace){
      // Utils.toasstMessage(error.toString());
    });
  }
  void uploadImage4(BuildContext context,String id)async{
    var imageUid = uid.v4();
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref(imageUid);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image4!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    _user.doc(id).update({
      'image4' : newUrl.toString(),
    }).then((value){
      print('Update Peofile');
      _image4 = null;
    }).onError((error, stackTrace){
      // Utils.toasstMessage(error.toString());
    });
  }
  void uploadImage5(BuildContext context,String id)async{
    var imageUid = uid.v4();
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref(imageUid);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image5!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    _user.doc(id).update({
      'image5' : newUrl.toString(),
    }).then((value){
      print('Update Peofile');
      _image5 = null;
    }).onError((error, stackTrace){
      // Utils.toasstMessage(error.toString());
    });
  }
  void uploadImage6(BuildContext context,String id)async{
    var imageUid = uid.v4();
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref(imageUid);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image6!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    _user.doc(id).update({
      'image6' : newUrl.toString(),
    }).then((value){
      print('Update Peofile');
      _image6 = null;
    }).onError((error, stackTrace){
      // Utils.toasstMessage(error.toString());
    });
  }
  void uploadImage7(BuildContext context,String id)async{
    var imageUid = uid.v4();
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref(imageUid);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image7!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    _user.doc(id).update({
      'image7' : newUrl.toString(),
    }).then((value){
      print('Update Peofile');
      _image7 = null;
    }).onError((error, stackTrace){
      // Utils.toasstMessage(error.toString());
    });
  }
  void uploadImage8(BuildContext context,String id)async{
    var imageUid = uid.v4();
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref(imageUid);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image8!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    _user.doc(id).update({
      'image8' : newUrl.toString(),
    }).then((value){
      print('Update Peofile');
      _image8 = null;
    }).onError((error, stackTrace){
      // Utils.toasstMessage(error.toString());
    });
  }
  void uploadImage9(BuildContext context,String id)async{
    var imageUid = uid.v4();
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref(imageUid);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image9!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    _user.doc(id).update({
      'image9' : newUrl.toString(),
    }).then((value){
      print('Update Peofile');
      _image9 = null;
    }).onError((error, stackTrace){
      // Utils.toasstMessage(error.toString());
    });
  }
  void uploadImage10(BuildContext context,String id)async{
    var imageUid = uid.v4();
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref(imageUid);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image10!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    _user.doc(id).update({
      'image10' : newUrl.toString(),
    }).then((value){
      print('Update Peofile');
      _image10 = null;
    }).onError((error, stackTrace){
      // Utils.toasstMessage(error.toString());
    });
  }
  void uploadImage11(BuildContext context,String id)async{
    var imageUid = uid.v4();
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref(imageUid);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image11!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    _user.doc(id).update({
      'image11' : newUrl.toString(),
    }).then((value){
      print('Update Peofile');
      _image11 = null;
    }).onError((error, stackTrace){
      // Utils.toasstMessage(error.toString());
    });
  }
  void uploadImage12(BuildContext context,String id)async{
    var imageUid = uid.v4();
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref(imageUid);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image12!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    inventoryTrackList.doc(id).update({
      'image12' : newUrl.toString(),
    }).then((value){
      print('Update Peofile');
      _image12 = null;
    }).onError((error, stackTrace){
      // Utils.toasstMessage(error.toString());
    });
  }
  void uploadImage13(BuildContext context,String id)async{
    var imageUid = uid.v4();
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref(imageUid);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image13!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    inventoryTrackList.doc(id).update({
      'image13' : newUrl.toString(),
    }).then((value){
      print('Update Peofile');
      _image13 = null;
    }).onError((error, stackTrace){
      // Utils.toasstMessage(error.toString());
    });
  }
  void uploadImage14(BuildContext context,String id)async{
    var imageUid = uid.v4();
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref(imageUid);
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image14!.path).absolute);
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    inventoryTrackList.doc(id).update({
      'image14' : newUrl.toString(),
    }).then((value){
      print('Update Peofile');
      _image14 = null;
    }).onError((error, stackTrace){
      // Utils.toasstMessage(error.toString());
    });
  }

}