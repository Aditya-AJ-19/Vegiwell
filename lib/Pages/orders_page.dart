import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vegiwell/Models/order_model.dart';
import 'package:vegiwell/Pages/Home%20Page/homepage.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Utils/style.dart';
import 'package:vegiwell/controllers/auth_controller.dart';
import 'package:vegiwell/controllers/orders_controller.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final OrderController orderController = Get.find();

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
            if (snapshot.data!.isNotEmpty) {
              final pd = snapshot.data!;

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
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.to(() => OrderProductList(
                                  order: pd[index],
                                ));
                          },
                          child: order(pd[index], orderController),
                        ),
                        itemCount: pd.length,
                      ),
                    )
                  ],
                ),
              );
            }
            return const EmptyOrders();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Widget order(OrderModel order, OrderController orderController) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: responsiveHeight(10),
    ),
    child: Container(
      // color: Colors.red,
      child: Row(
        children: [
          SizedBox(
            height: responsiveHeight(105),
            width: responsiveHeight(105),
            child: Image.network(
              order.products![0]['image'],
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: responsiveWidth(20),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ID: ${order.id!}",
                  style: TextStyle(
                    fontSize: responsiveHeight(9),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(10),
                ),
                Text(
                  "Total Price: Rs ${order.totalPrice}",
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(5),
                ),
                Text(
                  "Status: ${order.orderStatus}",
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(10),
                ),
                InkWell(
                  onTap: () {
                    if (order.orderStatus == "Order Cancel") {
                      showDialog(
                        context: Get.overlayContext!,
                        builder: (context) {
                          return Container(
                            child: AlertDialog(
                              title: Text(
                                "Are you sure ?",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: responsiveHeight(20),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: Text(
                                "you really want to delete order?",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: responsiveHeight(15),
                                ),
                              ),
                              actions: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [
                                        AppTheme.green,
                                        AppTheme.lightGreen,
                                      ]),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      width: responsiveWidth(60),
                                      height: responsiveHeight(30),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                          fontSize: responsiveHeight(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    orderController.deleteOrder(order.id!);
                                    Get.back();
                                  },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [
                                        AppTheme.green,
                                        AppTheme.lightGreen,
                                      ]),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      width: responsiveWidth(60),
                                      height: responsiveHeight(30),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                          fontSize: responsiveHeight(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: Get.overlayContext!,
                        builder: (context) {
                          return Container(
                            child: AlertDialog(
                              title: Text(
                                "Are you sure ?",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: responsiveHeight(20),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: Text(
                                "you really want to cancel order?",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: responsiveHeight(15),
                                ),
                              ),
                              actions: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [
                                        AppTheme.green,
                                        AppTheme.lightGreen,
                                      ]),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      width: responsiveWidth(60),
                                      height: responsiveHeight(30),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                          fontSize: responsiveHeight(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    orderController.cancelOrder(order.id!);
                                    Get.back();
                                  },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [
                                        AppTheme.green,
                                        AppTheme.lightGreen,
                                      ]),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      width: responsiveWidth(60),
                                      height: responsiveHeight(30),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                          fontSize: responsiveHeight(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        AppTheme.green,
                        AppTheme.lightGreen,
                      ]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: responsiveWidth(100),
                      height: responsiveHeight(20),
                      alignment: Alignment.center,
                      child: Text(
                        order.orderStatus == "Order Cancel"
                            ? "Delete Order"
                            : 'cancel Order',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

class OrderProductList extends StatelessWidget {
  final OrderModel order;
  const OrderProductList({
    Key? key,
    required this.order,
  }) : super(key: key);

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
      body: Padding(
        padding: EdgeInsets.only(
            left: responsiveHeight(10), right: responsiveHeight(10)),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return orderProduct(order.products![index]);
          },
          itemCount: order.products!.length,
        ),
      ),
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
            PhoneAuthController().getUser();
            Get.offAll(() => const MainHomePage(
                  currIndex: 0,
                ));
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
