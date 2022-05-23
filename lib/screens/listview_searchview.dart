import 'package:application_design_demo/controlers/listview_searchview_controler.dart';
import 'package:application_design_demo/res/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListviewSearchview extends StatelessWidget {
  ListviewSearchview({Key? key}) : super(key: key);

  ListviewSearchviewControler controler=Get.put(ListviewSearchviewControler());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: AppColor.white,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                  onChanged: (text) {
                   controler.productNameSearch(text);
                  },

                ),
              ),

              Expanded(child: Container(
                child: Obx((){
                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: controler.list.length,
                      itemBuilder: (context,i){
                      return Container(
                        height: 42,
                        child: Center(
                          child: Text(controler.list[i].name,style: TextStyle(color: Colors.black,fontSize: 15),),
                        ),
                      );
                      }
                  );
                }),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
