// ignore: file_names
import 'package:flutter/material.dart';
import 'package:vegiwell/Utils/size_config.dart';

Widget buildCard() => Container(
      height: responsiveHeight(160),
      width: responsiveHeight(160),
      margin: EdgeInsets.only(
        top: responsiveHeight(10),
        right: responsiveHeight(4),
        left: responsiveHeight(16),
      ),
      child: Expanded(
          child: AspectRatio(
        aspectRatio: 4 / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(responsiveHeight(20)),
          child: Image.asset(
            "assets/Images/orderboy.png",
            fit: BoxFit.cover,
          ),
        ),
      )),
    );
