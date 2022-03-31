import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController{
  var selectImagePath=''.obs;
  var selectImageSize=''.obs;


  void getImage(ImageSource source) async{
    final pickfile=await ImagePicker().getImage(source: source);
    if(pickfile!=null){
      selectImagePath.value=pickfile.path;
      selectImageSize.value=((File(selectImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2);
      
    }else{
      Get.snackbar('Error', "No Image Selected",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,

      );
    }
  }
}