import 'package:flutter/material.dart';
import 'package:flutter_filereader/flutter_filereader.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFOpenScreem extends StatelessWidget {
  PDFOpenScreem({Key? key,this.path}) : super(key: key);

  final String? path;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              /*child: PDFView(
                filePath: path,
              ),*/
              child: FileReaderView(filePath: path!),


            )
          ],
        ),
      ),
    );
  }
}
