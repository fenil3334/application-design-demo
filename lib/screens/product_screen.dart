import 'package:application_design_demo/controlers/product_controller.dart';
import 'package:application_design_demo/res/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  final productController = Get.put(ProductController());

   ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.bgColor,
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: AppColor.white,
          centerTitle: true,
          title: const Text(
            "All Product List",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  const Icon(Icons.shopping_cart, color: Colors.blue, size: 17,),
                  const SizedBox(
                    width: 6,
                  ),
                  GetX<ProductController>(
                    builder: (controller) =>
                        Text(
                          productController.count.toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.blue
                          ),
                        ),
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<ProductController>(
                builder: (controller) {
                  if (productController.productData.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      padding: const EdgeInsets.only(
                          bottom: 12, left: 20, right: 20),
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.only(top: 14, bottom: 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 4,
                          child: SizedBox(
                            height: 160,
                            child: Row(
                              children: [
                              SizedBox(
                              width: 116,
                              height: double.infinity,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                child: Image.network(
                                  productController
                                      .productData[index].productImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Column(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(top:16,left: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          productController
                                              .productData[index]
                                              .productName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),

                                        const SizedBox(height: 5,),
                                        Text(
                                          productController
                                              .productData[index]
                                              .productDescription,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Price : ${productController
                                              .productData[index].price
                                              .toString()} ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),

                                      ],
                                    ),
                                  ),

                                  const Spacer(),


                                  Row(
                                      children: [
                                        const SizedBox(width: 10,),

                                        Expanded(
                                          child: MaterialButton(
                                            textColor: Colors.white,
                                            color: Colors.red,
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            elevation: 0,
                                            hoverElevation: 0,
                                            focusElevation: 0,
                                            highlightElevation: 0,
                                            child: const Text(
                                              "Add to Cart", style: TextStyle(
                                                fontSize: 13
                                            ),),
                                            onPressed: () {
                                              productController.addtoCart(
                                                  productController
                                                      .productData[index]);
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(50.0),
                                            ),
                                          ),
                                        ),



                                        IconButton(
                                          onPressed: () {
                                            productController
                                                .adddToFavorites(
                                                productController
                                                    .productData[index]
                                                    .id);
                                          },
                                          icon: Icon(
                                            productController
                                                .productData[index]
                                                .favorite ==
                                                "true"
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ]
                                  ),

                                  const SizedBox(height: 4,),

                                ],
                              ),


                            ),
                            ]
                            ),
                          ),

                        );
                      },
                      itemCount: productController.productData.length,
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GetX<ProductController>(
              builder: (controller) =>
                  Text(
                    "Total Amount : ${productController.totalPrice}",
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
