import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class WidgetsViewModel1 with ChangeNotifier {
  bool _circular = false;
  bool get circular => _circular;

  void setCircular(bool circular) {
    _circular = circular;
    notifyListeners();
  }

  File? _imageFile;
  File? get imageFile => _imageFile;

  void selectGalleryImage() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    _imageFile = File(image!.path);
    notifyListeners();
  }

  void selectCameraImage() async {
    image = await _picker.pickImage(source: ImageSource.camera);
    _imageFile = File(image!.path);
    notifyListeners();
  }

  String? _imageUrlDownload;
  String? get imageUrlDownload => _imageUrlDownload;

  XFile? image;
  ImagePicker _picker = ImagePicker();
  Reference? task;

  Future uploadImage(BuildContext context) async {
    if (imageFile == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      _circular = false;
      notifyListeners();
    }

    String imageName = basename(_imageFile!.path);
    final destination = 'users/images/$imageName';
    task = FirebaseStorage.instance.ref(destination);

    await task!.putFile(File(imageFile!.path));
    _imageUrlDownload = await task!.getDownloadURL();
    print('Download-link: $imageUrlDownload');
  }

  File? _file;
  File? get file => _file;

  String? _fileName;
  String? get fileName => _fileName;

  void filePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      _file = File(result.files.single.path!);
      _fileName = basename(_file!.path);
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  String? _fileUrlDownload;
  String? get fileUrlDownload => _fileUrlDownload;
  Reference? task2;

  Future uploadFile(BuildContext context) async {
    if (_file == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your file")));
    }
    final destination = 'users/files/$_fileName';
    task2 = FirebaseStorage.instance.ref(destination);

    await task2!.putFile(File(_imageFile!.path));
    _fileUrlDownload = await task2!.getDownloadURL();
    print('Download-link: $imageUrlDownload');
  }

  int _bottomNavIndex = 0;
  int get bottomNavIndex => _bottomNavIndex;

  void setBottomNav(int bottomNavIndex) {
    _bottomNavIndex = bottomNavIndex;
    notifyListeners();
  }

  File? _imageFile1;
  File? get imageFile1 => _imageFile1;

  void selectGalleryImage1() async {
    image1 = await _picker1.pickImage(source: ImageSource.gallery);
    _imageFile1 = File(image1!.path);
    notifyListeners();
  }

  void selectCameraImage1() async {
    image1 = await _picker1.pickImage(source: ImageSource.camera);
    _imageFile1 = File(image1!.path);
    notifyListeners();
  }

  String? _imageUrlDownload1;
  String? get imageUrlDownload1 => _imageUrlDownload1;

  XFile? image1;
  ImagePicker _picker1 = ImagePicker();
  Reference? task1;

  Future uploadImage1(BuildContext context) async {
    if (imageFile1 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      notifyListeners();
    }

    String imageName1 = basename(_imageFile1!.path);
    final destination1 = 'users/images/$imageName1';
    task1 = FirebaseStorage.instance.ref(destination1);

    await task1!.putFile(File(imageFile1!.path));
    _imageUrlDownload1 = await task1!.getDownloadURL();
    print('Download-link: $imageUrlDownload1');
  }

  File? _file1;
  File? get file1 => _file1;

  String? _fileName1;
  String? get fileName1 => _fileName1;

  void filePicker1() async {
    FilePickerResult? result1 = await FilePicker.platform.pickFiles();
    if (result1 != null) {
      _file1 = File(result1.files.single.path!);
      _fileName1 = basename(_file1!.path);
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  String? _fileUrlDownload1;
  String? get fileUrlDownload1 => _fileUrlDownload1;
  Reference? task211;

  Future uploadFile1(BuildContext context) async {
    if (_file1 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your file")));
    }
    final destination1 = 'users/files/$_fileName1';
    task211 = FirebaseStorage.instance.ref(destination1);

    await task211!.putFile(File(_imageFile1!.path));
    _fileUrlDownload1 = await task211!.getDownloadURL();
    print('Download-link: $imageUrlDownload1');
  }

  File? _imageFile2;
  File? get imageFile2 => _imageFile2;

  void selectGalleryImage2() async {
    image2 = await _picker2.pickImage(source: ImageSource.gallery);
    _imageFile2 = File(image2!.path);
    notifyListeners();
  }

  void selectCameraImage2() async {
    image2 = await _picker2.pickImage(source: ImageSource.camera);
    _imageFile2 = File(image2!.path);
    notifyListeners();
  }

  String? _imageUrlDownload2;
  String? get imageUrlDownload2 => _imageUrlDownload2;

  XFile? image2;
  ImagePicker _picker2 = ImagePicker();
  Reference? task22;

  Future uploadImage2(BuildContext context) async {
    if (imageFile2 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      notifyListeners();
    }

    String imageName2 = basename(_imageFile2!.path);
    final destination2 = 'users/images/$imageName2';
    task2 = FirebaseStorage.instance.ref(destination2);

    await task2!.putFile(File(imageFile2!.path));
    _imageUrlDownload2 = await task2!.getDownloadURL();
    print('Download-link: $imageUrlDownload2');
  }

  File? _file2;
  File? get file2 => _file2;

  String? _fileName2;
  String? get fileName2 => _fileName2;

  void filePicker2() async {
    FilePickerResult? result2 = await FilePicker.platform.pickFiles();
    if (result2 != null) {
      _file2 = File(result2.files.single.path!);
      _fileName2 = basename(_file2!.path);
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  String? _fileUrlDownload2;
  String? get fileUrlDownload2 => _fileUrlDownload2;
  Reference? task212;

  Future uploadFile2(BuildContext context) async {
    if (_file2 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your file")));
    }
    final destination2 = 'users/files/$_fileName2';
    task212 = FirebaseStorage.instance.ref(destination2);

    await task212!.putFile(File(_imageFile2!.path));
    _fileUrlDownload2 = await task212!.getDownloadURL();
    print('Download-link: $imageUrlDownload2');
  }

  File? _imageFile3;
  File? get imageFile3 => _imageFile3;

  void selectGalleryImage3() async {
    image3 = await _picker3.pickImage(source: ImageSource.gallery);
    _imageFile3 = File(image3!.path);
    notifyListeners();
  }

  void selectCameraImage3() async {
    image3 = await _picker3.pickImage(source: ImageSource.camera);
    _imageFile3 = File(image3!.path);
    notifyListeners();
  }

  String? _imageUrlDownload3;
  String? get imageUrlDownload3 => _imageUrlDownload3;

  XFile? image3;
  ImagePicker _picker3 = ImagePicker();
  Reference? task3;

  Future uploadImage3(BuildContext context) async {
    if (imageFile3 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      notifyListeners();
    }

    String imageName3 = basename(_imageFile3!.path);
    final destination3 = 'users/images/$imageName3';
    task3 = FirebaseStorage.instance.ref(destination3);

    await task3!.putFile(File(imageFile3!.path));
    _imageUrlDownload3 = await task3!.getDownloadURL();
    print('Download-link: $imageUrlDownload3');
  }

  File? _file3;
  File? get file3 => _file3;

  String? _fileName3;
  String? get fileName3 => _fileName3;

  void filePicker3() async {
    FilePickerResult? result3 = await FilePicker.platform.pickFiles();
    if (result3 != null) {
      _file3 = File(result3.files.single.path!);
      _fileName3 = basename(_file3!.path);
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  String? _fileUrlDownload3;
  String? get fileUrlDownload3 => _fileUrlDownload3;
  Reference? task313;

  Future uploadFile3(BuildContext context) async {
    if (_file3 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your file")));
    }
    final destination3 = 'users/files/$_fileName3';
    task313 = FirebaseStorage.instance.ref(destination3);

    await task313!.putFile(File(_imageFile3!.path));
    _fileUrlDownload3 = await task313!.getDownloadURL();
    print('Download-link: $imageUrlDownload3');
  }

  File? _imageFile4;
  File? get imageFile4 => _imageFile4;

  void selectGalleryImage4() async {
    image4 = await _picker4.pickImage(source: ImageSource.gallery);
    _imageFile4 = File(image4!.path);
    notifyListeners();
  }

  void selectCameraImage4() async {
    image4 = await _picker4.pickImage(source: ImageSource.camera);
    _imageFile4 = File(image4!.path);
    notifyListeners();
  }

  String? _imageUrlDownload4;
  String? get imageUrlDownload4 => _imageUrlDownload4;

  XFile? image4;
  ImagePicker _picker4 = ImagePicker();
  Reference? task4;

  Future uploadImage4(BuildContext context) async {
    if (imageFile4 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      notifyListeners();
    }

    String imageName4 = basename(_imageFile4!.path);
    final destination4 = 'users/images/$imageName4';
    task4 = FirebaseStorage.instance.ref(destination4);

    await task4!.putFile(File(imageFile4!.path));
    _imageUrlDownload4 = await task4!.getDownloadURL();
    print('Download-link: $imageUrlDownload4');
  }

  File? _file4;
  File? get file4 => _file4;

  String? _fileName4;
  String? get fileName4 => _fileName4;

  void filePicker4() async {
    FilePickerResult? result4 = await FilePicker.platform.pickFiles();
    if (result4 != null) {
      _file4 = File(result4.files.single.path!);
      _fileName4 = basename(_file4!.path);
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  String? _fileUrlDownload4;
  String? get fileUrlDownload4 => _fileUrlDownload4;
  Reference? task414;

  Future uploadFile5(BuildContext context) async {
    if (_file4 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your file")));
    }
    final destination4 = 'users/files/$_fileName4';
    task414 = FirebaseStorage.instance.ref(destination4);

    await task414!.putFile(File(_imageFile4!.path));
    _fileUrlDownload4 = await task414!.getDownloadURL();
    print('Download-link: $imageUrlDownload4');
  }

  File? _imageFile5;
  File? get imageFile5 => _imageFile5;

  void selectGalleryImage5() async {
    image5 = await _picker5.pickImage(source: ImageSource.gallery);
    _imageFile5 = File(image5!.path);
    notifyListeners();
  }

  void selectCameraImage5() async {
    image5 = await _picker5.pickImage(source: ImageSource.camera);
    _imageFile5 = File(image5!.path);
    notifyListeners();
  }

  String? _imageUrlDownload5;
  String? get imageUrlDownload5 => _imageUrlDownload5;

  XFile? image5;
  ImagePicker _picker5 = ImagePicker();
  Reference? task5;

  Future uploadImage5(BuildContext context) async {
    if (imageFile5 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      notifyListeners();
    }

    String imageName5 = basename(_imageFile5!.path);
    final destination5 = 'users/images/$imageName5';
    task5 = FirebaseStorage.instance.ref(destination5);

    await task5!.putFile(File(imageFile5!.path));
    _imageUrlDownload5 = await task5!.getDownloadURL();
    print('Download-link: $imageUrlDownload5');
  }

  File? _file5;
  File? get file5 => _file5;

  String? _fileName5;
  String? get fileName5 => _fileName5;

  void filePicker5() async {
    FilePickerResult? result5 = await FilePicker.platform.pickFiles();
    if (result5 != null) {
      _file5 = File(result5.files.single.path!);
      _fileName5 = basename(_file5!.path);
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  String? _fileUrlDownload5;
  String? get fileUrlDownload5 => _fileUrlDownload5;
  Reference? task515;

  Future uploadFile6(BuildContext context) async {
    if (_file5 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your file")));
    }
    final destination5 = 'users/files/$_fileName5';
    task515 = FirebaseStorage.instance.ref(destination5);

    await task515!.putFile(File(_imageFile5!.path));
    _fileUrlDownload5 = await task515!.getDownloadURL();
    print('Download-link: $imageUrlDownload5');
  }

  File? _imageFile6;
  File? get imageFile6 => _imageFile6;

  void selectGalleryImage6() async {
    image6 = await _picker6.pickImage(source: ImageSource.gallery);
    _imageFile6 = File(image6!.path);
    notifyListeners();
  }

  void selectCameraImage6() async {
    image6 = await _picker6.pickImage(source: ImageSource.camera);
    _imageFile6 = File(image6!.path);
    notifyListeners();
  }

  String? _imageUrlDownload6;
  String? get imageUrlDownload6 => _imageUrlDownload6;

  XFile? image6;
  ImagePicker _picker6 = ImagePicker();
  Reference? task6;

  Future uploadImage6(BuildContext context) async {
    if (imageFile6 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      notifyListeners();
    }

    String imageName6 = basename(_imageFile6!.path);
    final destination6 = 'users/images/$imageName6';
    task6 = FirebaseStorage.instance.ref(destination6);

    await task6!.putFile(File(imageFile6!.path));
    _imageUrlDownload6 = await task6!.getDownloadURL();
    print('Download-link: $imageUrlDownload6');
  }

  File? _file6;
  File? get file6 => _file6;

  String? _fileName6;
  String? get fileName6 => _fileName6;

  void filePicker6() async {
    FilePickerResult? result6 = await FilePicker.platform.pickFiles();
    if (result6 != null) {
      _file6 = File(result6.files.single.path!);
      _fileName6 = basename(_file6!.path);
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  String? _fileUrlDownload6;
  String? get fileUrlDownload6 => _fileUrlDownload6;
  Reference? task616;

  Future uploadFile7(BuildContext context) async {
    if (_file6 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your file")));
    }
    final destination6 = 'users/files/$_fileName6';
    task616 = FirebaseStorage.instance.ref(destination6);

    await task616!.putFile(File(_imageFile6!.path));
    _fileUrlDownload6 = await task616!.getDownloadURL();
    print('Download-link: $imageUrlDownload6');
  }

  File? _imageFile7;
  File? get imageFile7 => _imageFile7;

  void selectGalleryImage7() async {
    image7 = await _picker7.pickImage(source: ImageSource.gallery);
    _imageFile7 = File(image7!.path);
    notifyListeners();
  }

  void selectCameraImage7() async {
    image7 = await _picker7.pickImage(source: ImageSource.camera);
    _imageFile7 = File(image7!.path);
    notifyListeners();
  }

  String? _imageUrlDownload7;
  String? get imageUrlDownload7 => _imageUrlDownload7;

  XFile? image7;
  ImagePicker _picker7 = ImagePicker();
  Reference? task7;

  Future uploadImage7(BuildContext context) async {
    if (imageFile7 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      notifyListeners();
    }

    String imageName7 = basename(_imageFile7!.path);
    final destination7 = 'users/images/$imageName7';
    task7 = FirebaseStorage.instance.ref(destination7);

    await task7!.putFile(File(imageFile7!.path));
    _imageUrlDownload7 = await task7!.getDownloadURL();
    print('Download-link: $imageUrlDownload7');
  }

  File? _file7;
  File? get file7 => _file7;

  String? _fileName7;
  String? get fileName7 => _fileName7;

  void filePicker7() async {
    FilePickerResult? result7 = await FilePicker.platform.pickFiles();
    if (result7 != null) {
      _file7 = File(result7.files.single.path!);
      _fileName7 = basename(_file7!.path);
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  String? _fileUrlDownload7;
  String? get fileUrlDownload7 => _fileUrlDownload7;
  Reference? task717;

  Future uploadFile8(BuildContext context) async {
    if (_file7 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your file")));
    }
    final destination7 = 'users/files/$_fileName7';
    task717 = FirebaseStorage.instance.ref(destination7);

    await task717!.putFile(File(_imageFile7!.path));
    _fileUrlDownload7 = await task717!.getDownloadURL();
    print('Download-link: $imageUrlDownload7');
  }

  File? _imageFile8;
  File? get imageFile8 => _imageFile8;

  void selectGalleryImage8() async {
    image8 = await _picker8.pickImage(source: ImageSource.gallery);
    _imageFile8 = File(image8!.path);
    notifyListeners();
  }

  void selectCameraImage8() async {
    image8 = await _picker8.pickImage(source: ImageSource.camera);
    _imageFile8 = File(image8!.path);
    notifyListeners();
  }

  String? _imageUrlDownload8;
  String? get imageUrlDownload8 => _imageUrlDownload8;

  XFile? image8;
  ImagePicker _picker8 = ImagePicker();
  Reference? task8;

  Future uploadImage8(BuildContext context) async {
    if (imageFile8 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      notifyListeners();
    }

    String imageName8 = basename(_imageFile8!.path);
    final destination8 = 'users/images/$imageName8';
    task8 = FirebaseStorage.instance.ref(destination8);

    await task8!.putFile(File(imageFile8!.path));
    _imageUrlDownload8 = await task8!.getDownloadURL();
    print('Download-link: $imageUrlDownload8');
  }

  File? _file8;
  File? get file8 => _file8;

  String? _fileName8;
  String? get fileName8 => _fileName8;

  void filePicker8() async {
    FilePickerResult? result8 = await FilePicker.platform.pickFiles();
    if (result8 != null) {
      _file8 = File(result8.files.single.path!);
      _fileName8 = basename(_file8!.path);
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  String? _fileUrlDownload8;
  String? get fileUrlDownload8 => _fileUrlDownload8;
  Reference? task818;

  Future uploadFile9(BuildContext context) async {
    if (_file8 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your file")));
    }
    final destination8 = 'users/files/$_fileName8';
    task818 = FirebaseStorage.instance.ref(destination8);

    await task818!.putFile(File(_imageFile8!.path));
    _fileUrlDownload8 = await task818!.getDownloadURL();
    print('Download-link: $imageUrlDownload8');
  }

  File? _imageFile9;
  File? get imageFile9 => _imageFile9;

  void selectGalleryImag9() async {
    image9 = await _picker9.pickImage(source: ImageSource.gallery);
    _imageFile9 = File(image9!.path);
    notifyListeners();
  }

  void selectCameraImage9() async {
    image9 = await _picker9.pickImage(source: ImageSource.camera);
    _imageFile9 = File(image9!.path);
    notifyListeners();
  }

  String? _imageUrlDownload9;
  String? get imageUrlDownload9 => _imageUrlDownload9;

  XFile? image9;
  ImagePicker _picker9 = ImagePicker();
  Reference? task9;

  Future uploadImage9(BuildContext context) async {
    if (imageFile9 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      notifyListeners();
    }

    String imageName9 = basename(_imageFile9!.path);
    final destination9 = 'users/images/$imageName9';
    task9 = FirebaseStorage.instance.ref(destination9);

    await task9!.putFile(File(imageFile9!.path));
    _imageUrlDownload9 = await task9!.getDownloadURL();
    print('Download-link: $imageUrlDownload9');
  }

  File? _file9;
  File? get file9 => _file9;

  String? _fileName9;
  String? get fileName9 => _fileName9;

  void filePicker9() async {
    FilePickerResult? result9 = await FilePicker.platform.pickFiles();
    if (result9 != null) {
      _file9 = File(result9.files.single.path!);
      _fileName9 = basename(_file9!.path);
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  String? _fileUrlDownload9;
  String? get fileUrlDownload9 => _fileUrlDownload9;
  Reference? task919;

  Future uploadFile10(BuildContext context) async {
    if (_file9 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your file")));
    }
    final destination9 = 'users/files/$_fileName9';
    task919 = FirebaseStorage.instance.ref(destination9);

    await task919!.putFile(File(_imageFile9!.path));
    _fileUrlDownload9 = await task919!.getDownloadURL();
    print('Download-link: $imageUrlDownload9');
  }

///////////////////////////////////
  File? _imageFile10;
  File? get imageFile10 => _imageFile10;

  void selectGalleryImage10() async {
    image10 = await _picker10.pickImage(source: ImageSource.gallery);
    _imageFile10 = File(image10!.path);
    notifyListeners();
  }

  void selectCameraImage10() async {
    image10 = await _picker10.pickImage(source: ImageSource.camera);
    _imageFile10 = File(image10!.path);
    notifyListeners();
  }

  String? _imageUrlDownload10;
  String? get imageUrlDownload10 => _imageUrlDownload10;

  XFile? image10;
  ImagePicker _picker10 = ImagePicker();
  Reference? task10;

  Future uploadImage10(BuildContext context) async {
    if (imageFile10 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      notifyListeners();
    }

    String imageName10 = basename(_imageFile10!.path);
    final destination10 = 'users/images/$imageName10';
    task10 = FirebaseStorage.instance.ref(destination10);

    await task10!.putFile(File(imageFile10!.path));
    _imageUrlDownload10 = await task10!.getDownloadURL();
    print('Download-link: $imageUrlDownload10');
  }

  File? _file10;
  File? get file10 => _file10;

  String? _fileName10;
  String? get fileName10 => _fileName10;

  void filePicker10() async {
    FilePickerResult? result10 = await FilePicker.platform.pickFiles();
    if (result10 != null) {
      _file10 = File(result10.files.single.path!);
      _fileName10 = basename(_file10!.path);
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  String? _fileUrlDownload10;
  String? get fileUrlDownload10 => _fileUrlDownload10;
  Reference? task10110;

  Future uploadFile11(BuildContext context) async {
    if (_file10 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your file")));
    }
    final destination10 = 'users/files/$_fileName10';
    task10110 = FirebaseStorage.instance.ref(destination10);

    await task10110!.putFile(File(_imageFile10!.path));
    _fileUrlDownload10 = await task10110!.getDownloadURL();
    print('Download-link: $imageUrlDownload10');
  }

////////////////////////////
  File? _imageFile11;
  File? get imageFile11 => _imageFile11;

  void selectGalleryImage11() async {
    image11 = await _picker11.pickImage(source: ImageSource.gallery);
    _imageFile11 = File(image11!.path);
    notifyListeners();
  }

  void selectCameraImage11() async {
    image11 = await _picker11.pickImage(source: ImageSource.camera);
    _imageFile11 = File(image11!.path);
    notifyListeners();
  }

  String? _imageUrlDownload11;
  String? get imageUrlDownload11 => _imageUrlDownload11;

  XFile? image11;
  ImagePicker _picker11 = ImagePicker();
  Reference? task11;

  Future uploadImage11(BuildContext context) async {
    if (imageFile11 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      notifyListeners();
    }

    String imageName11 = basename(_imageFile11!.path);
    final destination11 = 'users/images/$imageName11';
    task11 = FirebaseStorage.instance.ref(destination11);

    await task11!.putFile(File(imageFile11!.path));
    _imageUrlDownload11 = await task11!.getDownloadURL();
    print('Download-link: $imageUrlDownload11');
  }

  File? _file11;
  File? get file11 => _file11;

  String? _fileName11;
  String? get fileName11 => _fileName11;

  void filePicker11() async {
    FilePickerResult? result11 = await FilePicker.platform.pickFiles();
    if (result11 != null) {
      _file11 = File(result11.files.single.path!);
      _fileName11 = basename(_file11!.path);
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  String? _fileUrlDownload11;
  String? get fileUrlDownload11 => _fileUrlDownload11;
  Reference? task11111;

  Future uploadFile12(BuildContext context) async {
    if (_file11 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your file")));
    }
    final destination11 = 'users/files/$_fileName11';
    task11111 = FirebaseStorage.instance.ref(destination11);

    await task11111!.putFile(File(_imageFile11!.path));
    _fileUrlDownload11 = await task11111!.getDownloadURL();
    print('Download-link: $imageUrlDownload11');
  }

///////////////////////
  ///
  File? _imageFile12;
  File? get imageFile12 => _imageFile12;
  String? _imageUrlDownload12;
  String? get imageUrlDownload12 => _imageUrlDownload12;
  XFile? image12;
  ImagePicker _picker12 = ImagePicker();
  Reference? task112;

  void selectGalleryImage12() async {
    image12 = await _picker12.pickImage(source: ImageSource.gallery);
    _imageFile12 = File(image12!.path);
    notifyListeners();
  }

  void selectCameraImage12() async {
    image12 = await _picker12.pickImage(source: ImageSource.camera);
    _imageFile12 = File(image12!.path);
    notifyListeners();
  }

  Future uploadImage12(BuildContext context) async {
    if (imageFile12 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      notifyListeners();
    }

    String imageName12 = basename(_imageFile12!.path);
    final destination12 = 'users/images/$imageName12';
    task112 = FirebaseStorage.instance.ref(destination12);

    await task112!.putFile(File(imageFile12!.path));
    _imageUrlDownload12 = await task112!.getDownloadURL();
    print('Download-link: $imageUrlDownload12');
  }

  ///////////////

  File? _file12;
  File? get file12 => _file12;

  String? _fileName12;
  String? get fileName12 => _fileName12;

  void filePicker12() async {
    FilePickerResult? result12 = await FilePicker.platform.pickFiles();
    if (result12 != null) {
      _file12 = File(result12.files.single.path!);
      _fileName12 = basename(_file12!.path);
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  String? _fileUrlDownload12;
  String? get fileUrlDownload12 => _fileUrlDownload12;
  Reference? task111112;

  Future uploadFile13(BuildContext context) async {
    if (_file12 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your file")));
    }
    final destination12 = 'users/files/$_fileName12';
    task111112 = FirebaseStorage.instance.ref(destination12);

    await task111112!.putFile(File(_imageFile12!.path));
    _fileUrlDownload12 = await task111112!.getDownloadURL();
    print('Download-link: $imageUrlDownload12');
  }




  File? _imageFile13;
  File? get imageFile13 => _imageFile13;
  String? _imageUrlDownload13;
  String? get imageUrlDownload13 => _imageUrlDownload13;
  XFile? image13;
  ImagePicker _picker13 = ImagePicker();
  Reference? task13;



  void cameraPicker() async {
    image13 = await _picker13.pickImage(source: ImageSource.gallery);
    _imageFile13 = File(image13!.path);
    notifyListeners();
  }

  Future uploadImage13(BuildContext context) async {
    if (imageFile13 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      notifyListeners();
    }

    String imageName13 = basename(_imageFile13!.path);
    final destination13 = 'users/images/$imageName13';
    task13 = FirebaseStorage.instance.ref(destination13);

    await task13!.putFile(File(imageFile13!.path));
    _imageUrlDownload13 = await task13!.getDownloadURL();
    print('Download-link: $imageUrlDownload13');
  }



  File? _imageFile14;
  File? get imageFile14 => _imageFile14;
  String? _imageUrlDownload14;
  String? get imageUrlDownload14 => _imageUrlDownload14;
  XFile? image14;
  ImagePicker _picker14 = ImagePicker();
  Reference? task14;



  void cameraPicker14() async {
    image14 = await _picker14.pickImage(source: ImageSource.gallery);
    _imageFile14 = File(image14!.path);
    notifyListeners();
  }

  Future uploadImage14(BuildContext context) async {
    if (imageFile14 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Upload your Picture")));
      notifyListeners();
    }

    String imageName14 = basename(_imageFile14!.path);
    final destination14 = 'users/images/$imageName14';
    task14 = FirebaseStorage.instance.ref(destination14);

    await task14!.putFile(File(imageFile14!.path));
    _imageUrlDownload14 = await task14!.getDownloadURL();
    print('Download-link: $imageUrlDownload14');
  }



}
