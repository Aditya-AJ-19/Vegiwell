class CartItemModel {
  String? id;
  String? image;
  String? name;
  int? quantity;
  double? cost;
   String? productId;
   double? price;



  CartItemModel({this.productId, this.id, this.image, this.name, this.quantity, this.cost});

  CartItemModel.fromMap(Map<String, dynamic> data){
    id = data[id];
    image = data[image];
    name = data[name];
    quantity = data[quantity];
    cost = data[cost] ?? 0;
    // cost = double.tryParse(data[cost]) ?? 0;
    productId = data[productId];
    price = data[price] ?? 0;

  }

  Map toJson() => {
    id: id, 
    productId: productId,
    image: image, 
    name: name,
    quantity: quantity,
    cost: price! * quantity!,
    price: price
  };

}