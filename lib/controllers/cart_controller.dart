import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:vegiwell/Models/product_model.dart';
import 'package:vegiwell/Models/user.dart';
import 'package:vegiwell/controllers/auth_controller.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxDouble totalCartPrice = 0.0.obs;
  Rx<UserInformation> userModel = UserInformation().obs;

  // @override
  // void onReady() {
  //   super.onReady();
  //   ever(userModel, changeCartTotalPrice);
  // }

  void addProductToCart(ProductData product) {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar("Check your cart", "${product.name} is already added");
      } else {
        String itemId = const Uuid().v4().toString();
        PhoneAuthController().updateUserData({
          "cart": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": product.id,
              "name": product.name,
              "quantity": 1,
              "price": double.tryParse(product.price),
              "image": product.img,
              "cost": double.tryParse(product.price),
            }
          ])
        });
        Get.snackbar("Item added", "${product.name} was added to your cart");
        changeCartTotalPrice();
      }
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item");
    }
  }

  void removeCartItem(Map<String, dynamic> cartItem) {
    try {
      PhoneAuthController().updateUserData({
        "cart": FieldValue.arrayRemove([cartItem])
      });
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
    }
  }

  changeCartTotalPrice() {
    for (var e in PhoneAuthController.useralldata['cart']) {
      totalCartPrice.value += e['cost'] ?? 0;
    }
  }

  bool _isItemAlreadyAdded(ProductData product) {
    if (userModel.value.cart == null) {
      return false;
    } else {
      return userModel.value.cart!
          .where((item) => item.productId == product.id)
          .isNotEmpty;
    }
  }

  void decreaseQuantity(Map<String, dynamic> item) {
    if (item['quantity'] != 0) {
      if (item['quantity'] == 1) {
        removeCartItem(item);
      } else {
        removeCartItem(item);
        item['quantity'] = item['quantity'] - 1;
        PhoneAuthController().updateUserData({
          "cart": FieldValue.arrayUnion([item])
        });
      }
    } else{
      Get.snackbar("Error", "item count is zero");
    }
  }

  void increaseQuantity(Map<String, dynamic> item) {
    removeCartItem(item);
    item['quantity'] = item['quantity'] + 1;
    PhoneAuthController().updateUserData({
      "cart": FieldValue.arrayUnion([item])
    });
  }
}
