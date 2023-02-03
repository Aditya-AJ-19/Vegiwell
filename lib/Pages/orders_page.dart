import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Utils/style.dart';
import 'package:vegiwell/controllers/orders_controller.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final OrderController orderController = Get.find();

  // getProduct(List<OrderModel> pd) {
  //   for (var e in pd) {
  //     orderProducts.addAll(e.products!);
  //   }
  // }

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
      body: StreamBuilder(
        stream: orderController.getOrderproducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if(snapshot.data!.isNotEmpty){
              final pd = snapshot.data!;
            print(pd[0].orderStatus);
            List<Map<String, dynamic>> orderProducts = [];
            for (var e in pd) {
              orderProducts.addAll(e.products!);
              // print(e.products!);
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: responsiveHeight(20))
                  .copyWith(top: responsiveHeight(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Orders",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: responsiveHeight(25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: responsiveHeight(15),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: orderProducts.length,
                      itemBuilder: (context, index) =>
                          orderProduct(orderProducts[index]),
                    ),
                  ),
                ],
              ),
            );
            }
            return const EmptyOrders();
          } else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

// class OrderProducts extends StatelessWidget {
//   const OrderProducts({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final OrderController orderController = Get.find();
//     return SafeArea(
//         child: Padding(
//       padding: EdgeInsets.symmetric(horizontal: responsiveHeight(20))
//           .copyWith(top: 20),
//       child:
//     ));
//   }
// }

Widget orderProduct(Map<String, dynamic> product) {
  debugPrint(product['image'].toString());
  return Padding(
    padding: EdgeInsets.only(bottom: responsiveHeight(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: responsiveHeight(110),
          width: responsiveHeight(110),
          child: Image.network(
            product['image'],
            fit: BoxFit.contain,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                product['productName'],
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: responsiveHeight(18),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              "Rs ${product['price']}",
              style: const TextStyle(
                fontFamily: 'Inter',
                color: Colors.black45,
              ),
            ),
            Text(
              "Quantity: ${product['quantity']}",
              style: const TextStyle(
                fontFamily: 'Inter',
                color: Colors.black45,
              ),
            ),
            // Text(
            //   "Order Status: $orderStatus",
            //   style: const TextStyle(
            //     fontFamily: 'Inter',
            //     color: Colors.black45,
            //   ),
            // ),
          ],
        ),
      ],
    ),
  );
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
