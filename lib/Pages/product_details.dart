import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegiwell/Models/product_model.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/controllers/auth_controller.dart';
import 'package:vegiwell/controllers/cart_controller.dart';

class ProductDetails extends StatelessWidget {
  ProductData pd;
  ProductDetails({Key? key, required this.pd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartcontroller = Get.find();
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: responsiveHeight(20)),
              child: InkWell(
                  onTap: () async{
                    cartcontroller.addProductToCart(pd);
                    await PhoneAuthController().getUser();
                  },
                  child: const Icon(CupertinoIcons.cart_badge_plus)))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              width: SizeConfig.screenWidth,
              height: responsiveHeight(360),
              child: Image.network(
                pd.img,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: responsiveHeight(15),
            ),
            Padding(
              padding: EdgeInsets.only(left: responsiveHeight(20)),
              child: Text(
                pd.name,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: responsiveHeight(30),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: responsiveHeight(15),
            ),
            Padding(
              padding: EdgeInsets.only(left: responsiveHeight(20)),
              child: Text(
                "12 pieces",
                style: TextStyle(
                  color: const Color(0xFF8F8787),
                  fontFamily: "Inter",
                  fontSize: responsiveHeight(22),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(
              height: responsiveHeight(10),
            ),
            Padding(
              padding: EdgeInsets.only(left: responsiveHeight(20)),
              child: Text(
                "Rs ${pd.price}",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: responsiveHeight(25),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: responsiveHeight(15),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: responsiveHeight(20)),
              child: const Divider(
                thickness: 1.5,
                color: Colors.black26,
              ),
            ),
            SizedBox(
              height: responsiveHeight(20),
            ),
            Padding(
              padding: EdgeInsets.only(left: responsiveHeight(20)),
              child: Text(
                "About Product",
                style: TextStyle(
                  fontFamily: "Inter",
                  color: const Color(0xFF6A6A6A),
                  fontSize: responsiveHeight(24),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: responsiveHeight(20),
            ),
            Padding(
              padding: EdgeInsets.only(left: responsiveHeight(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "#",
                    style: TextStyle(
                      height: 1,
                      fontSize: responsiveHeight(30),
                      color: const Color(0xFF5A5A5A),
                    ),
                  ),
                  SizedBox(
                    width: responsiveHeight(15),
                  ),
                  Text(
                    "Country Of Origin: India",
                    style: TextStyle(
                      height: 1,
                      fontFamily: "Inter",
                      fontSize: responsiveHeight(20),
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF888888),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: responsiveHeight(10),
            ),
            Padding(
              padding: EdgeInsets.only(left: responsiveHeight(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "#",
                    style: TextStyle(
                      height: 1,
                      fontSize: responsiveHeight(30),
                      color: const Color(0xFF5A5A5A),
                    ),
                  ),
                  SizedBox(
                    width: responsiveHeight(15),
                  ),
                  Text(
                    "Shell Life: 6 Days",
                    style: TextStyle(
                      height: 1,
                      fontFamily: "Inter",
                      fontSize: responsiveHeight(20),
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF888888),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: responsiveHeight(10),
            ),
            Padding(
              padding: EdgeInsets.only(left: responsiveHeight(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#",
                    style: TextStyle(
                      height: 1,
                      fontSize: responsiveHeight(30),
                      color: const Color(0xFF5A5A5A),
                    ),
                  ),
                  SizedBox(
                    width: responsiveHeight(15),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth - 65,
                    child: Text(
                      pd.description,
                      style: TextStyle(
                        height: 1.4,
                        fontFamily: "Inter",
                        fontSize: responsiveHeight(18),
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF888888),
                      ),
                      softWrap: true,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: responsiveHeight(70),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFFF16E35),
        onPressed: () {},
        icon: const Icon(CupertinoIcons.cart),
        label: Text(
          "        Buy Now              ",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: responsiveHeight(20),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
