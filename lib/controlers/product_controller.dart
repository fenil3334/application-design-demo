import 'dart:convert';
import 'package:get/get.dart';
import 'package:application_design_demo/datamodel/product.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  List<Product> productData = [];

  List<Product> cartItem = List<Product>.empty().obs;

  addtoCart(Product item) {
    cartItem.add(item);

  }

  double get totalPrice => cartItem.fold(0, (sum, item) => sum + item.price);
  int get count => cartItem.length;




  @override
  void onInit() {
    super.onInit();
    fatchProductData();
  }

  fatchProductData() async {
    var response = await http.get(Uri.parse("https://api.jsonserve.com/w_uxG0"));
    if (response.statusCode == 200) {
      var data = response.body;
      print('-----------$data');

      List<dynamic> body=json.decode(data);
      productData= body.map(
            (dynamic item) => Product.fromJson(item),
      ).toList();

    //  productData= Product.fromJson(json.decode(data)) as List<Product>;

      print('-----------$productData.length');
    } else {
      throw Exception();
    }

    print('ProductData : $productData');
    update();
  }

  adddToFavorites(id){
    var index = productData.indexWhere((element) =>element.id == id);
    productData[index].favorite = productData[index].favorite=="true" ? "false" : "true";
    update();
  }
}
