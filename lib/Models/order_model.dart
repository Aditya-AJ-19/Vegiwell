class OrderModel {
  String? id;
  String? name;
  String? userlastname;
  String? address;
  String? number;
  String? totalPrice;
  List<Map<String, dynamic>>? products= <Map<String, dynamic>>[];
  String? orderStatus;
  
  OrderModel({
    this.id,
    this.name,
    this.userlastname,
    this.address,
    this.number,
    this.totalPrice,
    this.products,
    this.orderStatus,
  });
  
  

  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userlastname': userlastname,
      'address': address,
      'number': number,
      'totalPrice': totalPrice,
      'products': products!.map((item) => item).toList(),
      'orderStatus': orderStatus,
    };
  }

  OrderModel fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      name: map['name'],
      userlastname: map['userlastname'],
      address: map['address'],
      number: map['number'],
      totalPrice: map['totalPrice'],
      products: _convertCartItems(map['products'] ?? []),
      orderStatus: map['orderStatus'],
    );
  }

  List<Map<String, dynamic>> _convertCartItems(List cartFomDb){
    List<Map<String, dynamic>> _result = [];
    if(cartFomDb.isNotEmpty){
      for (var element in cartFomDb) {
      _result.add(element);
    }
    }
    return _result;
  }

  
}
