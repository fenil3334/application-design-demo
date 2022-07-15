import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SpiralMatrixControler extends GetxController{
  TextEditingController rowcontroler=TextEditingController();
  TextEditingController columncontroler=TextEditingController();


  RxList<int> intList=RxList([]);



  void displayMatrix(){
    int count=int.parse(columncontroler.text);
    matrix(count);
  }


  void matrix(int n) {
    final results = <List<int>>[];

    for (var i = 0; i < n; i++) {
      results.add(List<int>.filled(n, 0));
    }

    int counter = 1;
    int startColumn = 0;
    int endColumn = n - 1;
    int startRow = 0;
    int endRow = n - 1;

    while (startColumn <= endColumn && startRow <= endRow) {
      // Top row
      for (var i = startColumn; i <= endColumn; i++) {
        results[startColumn][i] = counter;
        counter++;
      }
      startRow++;

      // Right column
      for (var i = startRow; i <= endRow; i++) {
        results[i][endColumn] = counter; // Switched i and endColumn
        counter++;
      }

      endColumn--;

      // Bottom row
      for (var i = endColumn; i >= startColumn; i--) {
        results[endRow][i] = counter;
        counter++;
      }

      endRow--;

      // Start column
      for (var i = endRow; i >= startRow; i--) {
        results[i][startColumn] = counter; // Switched i and startColumn
        counter++;
      }
      startColumn++;
    }

    print('-------Matrix------->${results}');


    intList.value = results.expand((i) => i).toList();
  }
}