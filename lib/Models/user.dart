import 'package:vegiwell/Models/cart_model.dart';

class UserInformation {
  String? name;
  String? userlastname;
  String? email;
  String? address;
  String? number;
  List<CartItemModel>? cart;

  UserInformation({
    this.name,
    this.userlastname,
    this.email,
    this.address,
    this.number,
    this.cart 
  });

  UserInformation fromMap(Map<String, dynamic> map) {
    return UserInformation(
      name: map['username'],
      userlastname: map['userlastname'],
      email: map['email'],
      address: map['address'],
      number: map['number'],
      cart: _convertCartItems(map['cart'] ?? []),
    );
  }

  List<CartItemModel> _convertCartItems(List cartFomDb){
    List<CartItemModel> _result = [];
    if(cartFomDb.isNotEmpty){
      for (var element in cartFomDb) {
      _result.add(CartItemModel.fromMap(element));
    }
    }
    return _result;
  }

  Map<String, dynamic> toJson() {
    return {
      "username": name,
      "userlastname": userlastname,
      "email": email,
      "address": address,
      "number": number,
    };
  }

  List cartItemsToJson() => cart!.map((item) => item.toJson()).toList();
}