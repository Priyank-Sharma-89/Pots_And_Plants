class CarouselImage {
  final String imgURL;

  CarouselImage({this.imgURL});

  factory CarouselImage.fromJson(Map<String, dynamic> json) {
    return CarouselImage(
      imgURL: json["imgurl"],
    );
  }
}
