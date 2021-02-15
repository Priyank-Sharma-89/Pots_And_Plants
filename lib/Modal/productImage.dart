class ProductImage {
  final String imgURL;
  final String name;
  final int price;
  bool isFavourite;

  ProductImage({this.imgURL, this.name, this.price, this.isFavourite});

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      imgURL: json["image"],
      name: json["name"],
      price: json["price"],
      isFavourite: json["isFavourite"],
    );
  }
}
