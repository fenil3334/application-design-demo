import 'package:application_design_demo/controlers/carosual_controler.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarsulaSliderScreen extends StatelessWidget {
  CarsulaSliderScreen({Key? key}) : super(key: key);

  CarsoualControler controller=Get.put(CarsoualControler());

  @override
  Widget build(BuildContext context) {
    return Material(child: SafeArea(
      child: Column(
        children: [
         Obx((){
           return  CarouselSlider.builder(
             itemCount: controller.imagelist.length,
             options: CarouselOptions(
               aspectRatio: 16/9,
               viewportFraction: 0.8,
               height: 220,
               autoPlay: false,
               reverse: false,
               enableInfiniteScroll: false,
             ),
             itemBuilder: (context, i, id) {
               return GestureDetector(
                 child: Image.network(
                   controller.imagelist[i].toString(),
                   fit: BoxFit.cover,
                 ),
                 onTap: () {},
               );
             },
           );
         }),
        ],
      ),
    ));
  }
}
