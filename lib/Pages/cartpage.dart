import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegiwell/Pages/checkout_detail.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Utils/style.dart';
import 'package:vegiwell/controllers/auth_controller.dart';
import 'package:vegiwell/controllers/cart_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    getTotal();

    super.initState();
  }

  num total = 0;

  void getTotal() {
    total = 0;
    for (var i = 0; i < PhoneAuthController.useralldata['cart'].length; i++) {
      total = total +
          (PhoneAuthController.useralldata['cart'][i]['cost'] *
              PhoneAuthController.useralldata['cart'][i]['quantity']);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        backgroundColor: AppTheme.green,
        foregroundColor: AppTheme.darkBlue,
        centerTitle: true,
        title: SizedBox(
          width: responsiveHeight(140),
          height: responsiveHeight(35),
          child: Image.asset(
            'assets/Images/vegiwellname.png',
            filterQuality: FilterQuality.high,
            fit: BoxFit.contain,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: responsiveHeight(10)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: responsiveHeight(15)),
              width: SizeConfig.screenWidth,
              height: responsiveHeight(45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: responsiveHeight(30),
                  ),
                  SizedBox(
                    width: responsiveWidth(20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Shopping Cart",
                        style: TextStyle(
                            height: responsiveHeight(1),
                            fontSize: responsiveHeight(20),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter"),
                      ),
                      Text(
                        "Verify Your Quantity and Click Checkout",
                        style: TextStyle(
                          height: responsiveHeight(1.4),
                          fontSize: responsiveHeight(13),
                          fontWeight: FontWeight.w400,
                          color: Colors.black38,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: PhoneAuthController.useralldata["cart"].length,
                itemBuilder: (context, index) =>
                    cartCard(PhoneAuthController.useralldata["cart"][index]),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: responsiveHeight(10),
                bottom: responsiveHeight(15),
                left: responsiveHeight(20),
                right: responsiveHeight(20),
              ),
              height: responsiveHeight(123),
              width: SizeConfig.screenWidth,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: responsiveHeight(20),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        // "Rs ${CartController().totalCartPrice.value}",
                        "₹ $total",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: responsiveHeight(20),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => CheckOutDetails(
                            cartItem:
                                PhoneAuthController.useralldata["cart"] ?? [],
                            total: total,
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: const StadiumBorder(),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient:  const LinearGradient(
                            colors: [
                              AppTheme.green,
                              AppTheme.lightGreen,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        width: responsiveWidth(320),
                        height: responsiveHeight(50),
                        alignment: Alignment.center,
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cartCard(Map<String, dynamic> cartItem) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: responsiveHeight(5)),
      color: Colors.white,
      padding: EdgeInsets.all(responsiveHeight(10)),
      width: SizeConfig.screenWidth,
      height: responsiveHeight(120),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: responsiveHeight(120),
            width: responsiveWidth(80),
            child: Image.network(
              cartItem['image'].toString(),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: responsiveWidth(5),
          ),
          SizedBox(
            width: responsiveWidth(170),
            height: responsiveHeight(70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem['name'].toString(),
                  style: TextStyle(
                      fontFamily: "Inter", fontSize: responsiveHeight(16)),
                ),
                Text(
                  "Rs ${cartItem['price']}",
                  style: TextStyle(
                    height: responsiveHeight(1.8),
                    fontFamily: "Inter",
                    fontSize: responsiveHeight(16),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: responsiveWidth(5),
          ),
          SizedBox(
            width: responsiveWidth(45),
            height: responsiveHeight(100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    CartController().decreaseQuantity(cartItem);
                    await PhoneAuthController().getUser();
                    getTotal();
                  },
                  child: Icon(
                    Icons.remove_circle_outline_rounded,
                    size: responsiveHeight(30),
                  ),
                ),
                Text(
                  cartItem['quantity'].toString(),
                  style: TextStyle(fontSize: responsiveHeight(24)),
                ),
                InkWell(
                  onTap: () async {
                    CartController().increaseQuantity(cartItem);
                    await PhoneAuthController().getUser();
                    getTotal();
                  },
                  child: Icon(
                    Icons.add_circle_outline_outlined,
                    size: responsiveHeight(30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
