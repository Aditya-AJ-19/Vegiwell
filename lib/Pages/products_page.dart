import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegiwell/Models/product_model.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Pages/product_details.dart';

class ProductPage extends StatefulWidget {
  String cate;
  ProductPage({Key? key, required this.cate}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    var c = widget.cate;
    DatabaseReference refe =
        FirebaseDatabase.instance.ref('TopCategories/$c/foods/');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: responsiveHeight(10),
          left: responsiveHeight(10),
          right: responsiveHeight(10),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: responsiveHeight(15)),
              child: Text(
                widget.cate,
                style: TextStyle(
                  letterSpacing: 3,
                  fontSize: responsiveHeight(30),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: FirebaseAnimatedList(
                query: refe,
                itemBuilder: (context, snapshot, animation, index) {
                  if (index < 15) {
                    ProductData pd = ProductData(
                      id: snapshot.child("id").value.toString(),
                      name: snapshot.child("name").value.toString(),
                      img: snapshot.child("image").value.toString(),
                      price: snapshot.child("price").value.toString(),
                      description:
                          snapshot.child("description").value.toString(),
                    );
                    return card(pd);
                  } else {
                    return const SizedBox();
                  }
                },
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(
                    bottom: responsiveHeight(10), top: responsiveHeight(5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget card(ProductData pd) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () => Get.to(() => ProductDetails(pd: pd)),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.all(Radius.circular(responsiveHeight(20))),
        child: Container(
          height: responsiveHeight(135),
          width: (SizeConfig.screenWidth / 2) - 80,
          padding: EdgeInsets.symmetric(vertical: responsiveHeight(15)),
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 14, 156, 35),
                width: responsiveHeight(1.42)),
            borderRadius: BorderRadius.circular(responsiveHeight(20)),
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: responsiveHeight(8)),
                width: responsiveHeight(120),
                height: responsiveHeight(120),
                child: Image.network(
                  pd.img,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: responsiveWidth(155),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: responsiveHeight(8),
                          bottom: responsiveHeight(2)),
                      height: responsiveHeight(60),
                      child: Center(
                        child: Text(
                          pd.name,
                          style: TextStyle(
                              fontSize: responsiveHeight(16),
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: responsiveHeight(5)),
                      height: responsiveHeight(20),
                      child: Text(
                        "Rs  ${pd.price}",
                        style: TextStyle(
                          fontSize: responsiveHeight(17),
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: responsiveWidth(8),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
