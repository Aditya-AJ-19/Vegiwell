import 'package:flutter/material.dart';
import 'package:vegiwell/Pages/products_page.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:get/get.dart';

Widget buildCardCategory(String title, String imgurl, String cate) => InkWell(
      onTap: () {
        Get.to(ProductPage(cate: cate,));
      },
      child: Container(
        height: responsiveHeight(120),
        width: responsiveHeight(80),
        margin: EdgeInsets.only(
          top: responsiveHeight(10),

          // right: responsiveHeight(10),

          left: responsiveHeight(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(responsiveHeight(20)),
                  child: Image.network(
                    imgurl,
                    fit: BoxFit.cover,
                  ),
                  // child: Image.asset(
                  //   "assets/Images/cake.png",
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: responsiveHeight(10),
            ),
            SizedBox(
              height: responsiveHeight(20),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: responsiveWidth(10), fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
