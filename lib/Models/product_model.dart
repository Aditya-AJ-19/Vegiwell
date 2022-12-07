class ProductData {
  final String id;
  final String name;
  final String img;
  final String price;
  final String description;

  ProductData(
      {required this.id,
      required this.name,
      required this.img,
      required this.price,
      required this.description});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'],
      name: json['name'],
      img: json['image'],
      price: json["price"],
      description: json['description'],
    );
  }
}
