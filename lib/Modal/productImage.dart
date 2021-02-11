class ProductImage {
  final String imgURL;
  final String name;
  final int price;

  ProductImage({this.imgURL, this.name, this.price});

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      imgURL: json["image"],
      name: json["name"],
      price: json["price"],
    );
  }
}
