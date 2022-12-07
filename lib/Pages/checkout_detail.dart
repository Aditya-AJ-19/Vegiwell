import 'package:flutter/material.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Utils/style.dart';
import 'package:vegiwell/controllers/auth_controller.dart';

class CheckOutDetails extends StatefulWidget {
  final List? cartItem;
  final num total;
  const CheckOutDetails({
    Key? key,
    required this.cartItem,
    required this.total,
  }) : super(key: key);

  @override
  State<CheckOutDetails> createState() => _CheckOutDetailsState();
}

class _CheckOutDetailsState extends State<CheckOutDetails> {
  Map<String, dynamic> userdata = PhoneAuthController.useralldata;
  String? paymentMethode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout Details",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Inter",
            fontSize: responsiveHeight(19),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppTheme.orange2,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveHeight(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: responsiveHeight(15),
              width: double.infinity,
            ),
            Text(
              "Order List",
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontFamily: "Inter",
                fontSize: responsiveHeight(24),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: responsiveHeight(15),
            ),
            if (widget.cartItem!.isEmpty)
              Center(
                child: Text(
                  "No Cart item",
                  style: TextStyle(
                    color: const Color(0xFF1F1F1F),
                    fontFamily: "Inter",
                    fontSize: responsiveHeight(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            SizedBox(
              width: double.infinity,
              height: responsiveHeight(230),
              child: ListView.builder(
                itemCount: widget.cartItem!.length,
                itemBuilder: (context, index) {
                  return cartCart(
                    name: widget.cartItem![index]["name"],
                    price: widget.cartItem![index]["price"].toString(),
                    quantity: widget.cartItem![index]["quantity"].toString(),
                    img: widget.cartItem![index]["image"].toString(),
                  );
                },
              ),
            ),
            SizedBox(
              height: responsiveHeight(15),
            ),
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
                  "₹ ${widget.total}",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: responsiveHeight(20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: responsiveHeight(8),
            ),
            Text(
              "Deliver To",
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontFamily: "Inter",
                fontSize: responsiveHeight(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: responsiveHeight(5),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveHeight(14),
                vertical: responsiveHeight(8),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(responsiveHeight(20)))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${userdata['username']} ${userdata['userlastname']}",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: responsiveHeight(20),
                      color: const Color(0xff303030),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: responsiveHeight(5),
                  ),
                  Text(
                    "${userdata['address']}",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: responsiveHeight(16),
                      color: const Color(0xff303030).withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: responsiveHeight(15),
            ),
            Text(
              "Delivery Option",
              style: TextStyle(
                color: const Color(0xFF1F1F1F),
                fontFamily: "Inter",
                fontSize: responsiveHeight(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: responsiveHeight(6)),
              height: responsiveHeight(25),
              child: Row(
                children: [
                  Radio(
                    value: "delivery",
                    groupValue: paymentMethode,
                    onChanged: (value) {
                      setState(() {
                        paymentMethode = value.toString();
                      });
                    },
                  ),
                  SizedBox(
                    width: responsiveHeight(10),
                  ),
                  Text(
                    "Pay On Delivery",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: responsiveHeight(15),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: responsiveHeight(6)),
              height: responsiveHeight(25),
              child: Row(
                children: [
                  Radio(
                    value: "online",
                    groupValue: paymentMethode,
                    onChanged: (value) {
                      setState(() {
                        paymentMethode = value.toString();
                      });
                    },
                  ),
                  SizedBox(
                    width: responsiveHeight(10),
                  ),
                  Text(
                    "Online Payment",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: responsiveHeight(15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: responsiveHeight(30),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: const StadiumBorder(),
              ),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFCB930), Color(0xFFF16E35)],
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
            SizedBox(
              height: responsiveHeight(25),
            ),
          ],
        ),
      ),
    );
  }

  Widget cartCart({
    required String name,
    required String price,
    required String quantity,
    required String img,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: responsiveHeight(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              width: responsiveHeight(60),
              height: responsiveHeight(60),
              child: Image.network(
                img,
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: responsiveHeight(140),
            child: Text(
              name,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: responsiveHeight(16),
              ),
            ),
          ),
          SizedBox(
            width: responsiveHeight(10),
          ),
          Text(
            quantity,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: responsiveHeight(16),
            ),
          ),
          SizedBox(
            width: responsiveHeight(10),
          ),
          Text(
            "Rs $price",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: responsiveHeight(16),
            ),
          ),
        ],
      ),
    );
  }
}
