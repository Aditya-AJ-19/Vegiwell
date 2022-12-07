class CarouselModel {
  final String id;
  final String image;

  CarouselModel({required this.id, required this.image});

  // CarouselModel.fromJson(Map<String, Object?> json)
  //     : this(id: json['title']! as String, image: json['image']! as String);

  factory CarouselModel.fromJson(Map<String, dynamic> json) {
    return CarouselModel(
      id: json['title'],
      image: json['image'],
    );
  }

  Map<String, Object?> toJson() {
    return {
      'title': id,
      'image': image,
    };
  }
}
