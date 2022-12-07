import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegiwell/Models/product_model.dart';
import 'package:vegiwell/Pages/product_details.dart';
import 'package:vegiwell/Utils/size_config.dart';

Widget latestProduct(ProductData productDetails) => InkWell(
  onTap: () => Get.to(()=> ProductDetails(pd: productDetails)),
  child:   Container(
        // color: Colors.grey[300],
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(responsiveHeight(25))),
        ),
        width: responsiveHeight(170),
        height: responsiveHeight(220),
        margin: EdgeInsets.only(
          top: responsiveHeight(10),
          // right: responsiveHeight(4),
          left: responsiveHeight(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: responsiveHeight(15), bottom: responsiveHeight(5)),
              child: Text(
                productDetails.name,
                style: TextStyle(
                  height: responsiveHeight(1),
                  fontSize: responsiveHeight(25),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: responsiveHeight(160),
              height: responsiveHeight(140),
              child: Image.network(
                productDetails.img,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "Rs ${productDetails.price}",
              style: TextStyle(
                fontSize: responsiveHeight(20),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
);
