import 'package:flutter/material.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Utils/style.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppTheme.green,
        foregroundColor: Colors.white,
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
      body: const EmptyOrders(),
    );
  }
}

class EmptyOrders extends StatelessWidget {
  const EmptyOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: responsiveHeight(40),
        ),
        Center(
          child: Container(
            height: responsiveHeight(240),
            width: responsiveHeight(240),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(130),
              color: const Color(0xFFD9D9D9),
            ),
            child: Center(
              child: Text(
                "OOPS...",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: responsiveHeight(50),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: responsiveHeight(15),
        ),
        Text(
          "Basket is empty",
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
            fontSize: responsiveHeight(28),
          ),
        ),
        SizedBox(
          height: responsiveHeight(5),
        ),
        Text(
          "Looks like you don't have any\npast orders",
          style: TextStyle(
            fontFamily: "Inter",
            color: const Color(0xFF989898),
            fontWeight: FontWeight.bold,
            fontSize: responsiveHeight(15),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: responsiveHeight(55),
        ),
        InkWell(
          onTap: () async {
            // await auth.signOut();
            // if (auth.currentUser == null) {
            //   Get.offAll(() => GetOtp());
            // }
          },
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(responsiveHeight(30)),
            child: Container(
              height: responsiveHeight(60),
              width: responsiveWidth(200),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  AppTheme.green,
                  AppTheme.lightGreen,
                ]),
                borderRadius: BorderRadius.circular(responsiveHeight(15)),
              ),
              child: Center(
                  child: Text(
                "Shop Now!",
                style: TextStyle(fontSize: responsiveHeight(18)),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
