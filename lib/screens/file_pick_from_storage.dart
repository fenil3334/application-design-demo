import 'dart:io';

import 'package:application_design_demo/screens/pdf_open_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class FilePickFromStorage extends StatelessWidget {
  const FilePickFromStorage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [

            SizedBox(height: 20),
            MaterialButton(
                onPressed: () {
                  _getStoragePermission(context);
              //  pickfile();
                },
              child: const Text("Pick FIle From Storage",
                style: TextStyle(
                    fontSize: 13
                ),),
              textColor: Colors.white,
              color: Colors.blue,
                )
          ],
        ),
      ),
    );
  }



  Future _getStoragePermission(BuildContext context) async {
    if (await Permission.storage.request().isGranted) {
      pickfile(context);
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {

    }
  }

  pickfile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [ 'pdf', 'doc','docx'],
    );

    if (result != null) {
      //File file = File(result.files.single.path);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFOpenScreem(path: result.files.single.path),
        ),
      );
    } else {
      // User canceled the picker
    }
  }
}
