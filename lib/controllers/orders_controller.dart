import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vegiwell/Models/order_model.dart';
// import 'package:vegiwell/Models/product_model.dart';
import 'package:vegiwell/Pages/order_successful.dart';
import 'package:vegiwell/controllers/auth_controller.dart';
import 'package:uuid/uuid.dart';

class OrderController extends GetxController {
  void orderProducts(List cartItem, String totalPrice) async {
    var uuid = const Uuid();
    Map<String, dynamic> userdata = PhoneAuthController.useralldata;
    List<Map<String, dynamic>> productList = [];
    for (var product in cartItem) {
      var pd = {
        'productName': product['name'],
        'quantity': product['quantity'],
        'price': product['price'],
        'image': product['image'],
      };
      productList.add(pd);
    }
    var orderId = uuid.v1();
    OrderModel order = OrderModel(
      id: orderId,
      name: userdata['username'],
      userlastname: userdata['userlastname'],
      number: userdata['number'],
      address: userdata['address'],
      products: productList,
      orderStatus: "Pending",
      totalPrice: totalPrice,
    );
    try {
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(orderId)
          .set(order.toMap());
    } catch (e) {
      return debugPrint(e.toString());
    }
    PhoneAuthController().updateUserData({
      "cart": [],
    });
    Get.to(() => const OrderSuccessfulScreen());
    debugPrint("Function call");
  }

  Stream<List<OrderModel>> getOrderproducts() {
    Map<String, dynamic> userdata = PhoneAuthController.useralldata;
    return FirebaseFirestore.instance
        .collection('orders')
        .where('number', isEqualTo: userdata['number'])
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((e) => OrderModel().fromMap(e.data())).toList());
  }

  //Update order status(Cancel order).

  void cancelOrder(String orderId) {
    FirebaseFirestore.instance
        .collection('orders')
        .doc(orderId)
        .update({'orderStatus': "Order Cancel"});
  }

  // delete order.
  void deleteOrder(String orderId) {
    FirebaseFirestore.instance.collection("orders").doc(orderId).delete();
  }

  
  // Future<OrderModel> getOrderproducts() async {
  //   Map<String, dynamic> userdata = PhoneAuthController.useralldata;
  //   List<Map<String, dynamic>> orderProducts = [];
  //   await FirebaseFirestore.instance
  //       .collection('orders')
  //       .where('number', isEqualTo: userdata['number'])
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     return ;
  //   });

  // }
}
