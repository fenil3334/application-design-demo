import 'dart:io';

import 'package:application_design_demo/controlers/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickFromGallery extends StatefulWidget {
  const ImagePickFromGallery({Key? key}) : super(key: key);

  @override
  _ImagePickFromGalleryState createState() => _ImagePickFromGalleryState();
}

class _ImagePickFromGalleryState extends State<ImagePickFromGallery> {
  PickedFile? imageFile=null;
  final productController = Get.put(ImageController());


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                child: Obx(()=>productController.selectImagePath.value==''
                ? Text("Choose Image",style: TextStyle(fontSize: 15,color: Colors.black),)
                :Image.file(File(productController.selectImagePath.value))
                ),
              ),

              SizedBox(height: 14,),
              Obx(()=> Text(productController.selectImageSize.value=='' ? ''
              : productController.selectImageSize.value,style: TextStyle(fontSize: 14,color: Colors.black),)),

              MaterialButton(
                textColor: Colors.white,
                color: Colors.pink,
                onPressed: (){
                  _showChoiceDialog(context);
                },
                child: Text("Select Image"),

              )
            ],
          ),
        ),
      ),
    );
  }





  Future<void>_showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("Choose option",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                 // _openGallery(context);
                  productController.getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                title: Text("Gallery"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                 // _openCamera(context);
                  productController.getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                title: Text("Camera"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
  }


  void _openGallery(BuildContext context) async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery ,
    );

    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context)  async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera ,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
  }
}
