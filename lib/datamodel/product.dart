class Product {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final int price;
  String favorite;

  Product({
      required this.id,
      required this.price,
      required this.productDescription,
      required this.productImage,
      required this.productName,
      required this.favorite,
});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: json['price'],
      productDescription: json['productDescription'],
      productImage: json['productImage'],
      productName: json['productName'],
      favorite: json['favorite'],
    );
  }

/* factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    price: json["price"],
    productDescription: json["productDescription"],
    productImage: json["productImage"],
    productName: json["productName"],
    favorite: json["favorite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "productDescription": productDescription,
    "productImage": productImage,
    "productName": productName,
    "favorite": favorite,
  };*/
}
