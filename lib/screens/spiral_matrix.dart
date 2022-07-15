import 'package:application_design_demo/controlers/spiral_matrix_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpiralMatrixScreen extends StatelessWidget {
  SpiralMatrixScreen({Key? key}) : super(key: key);

  SpiralMatrixControler controler=Get.put(SpiralMatrixControler());

  @override
  Widget build(BuildContext context) {
    return Material(child: SafeArea(child: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [

          Row(
            children: [

              Expanded(
                child: TextField(
                  controller: controler.rowcontroler,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter Row",
                      fillColor: Colors.white70),
                ),
              ),

              SizedBox(width: 20),

              Expanded(
                child: TextField(
                  controller: controler.columncontroler,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Enter Column",
                      fillColor: Colors.white70),
                ),
              )
            ],
          ),


          SizedBox(height: 16),


          GestureDetector(
            onTap: (){
              controler.displayMatrix();
            },
            child: Container(
              width: 120,
              height: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue
              ),
              child: Center(
                child: Text('Display',style: TextStyle(color: Colors.white,fontSize: 15)),
              ),
            ),
          ),


          SizedBox(height: 15),


          Obx((){
            return Expanded(child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: controler.intList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: int.parse(controler.rowcontroler.text.isEmpty ? '1' : controler.rowcontroler.text)),
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(controler.intList[index].toString(),style: TextStyle(color: Colors.black,fontSize: 14)),
                      ),
                    );
                  },
                )
              ],
            ));
          })

        ],
      ),
    )));
  }
}
