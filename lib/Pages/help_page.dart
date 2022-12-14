import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Utils/style.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Column(
        children: [
          SizedBox(
            height: responsiveHeight(260),
            width: SizeConfig.screenWidth,
            child: Image.asset(
              "assets/Images/about_image.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: responsiveHeight(25),
          ),
          Padding(
            padding: EdgeInsets.only(left: responsiveWidth(30)),
            child: SizedBox(
              width: SizeConfig.screenWidth,
              child: Text(
                "Vegiwell",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: responsiveHeight(28),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          SizedBox(
            height: responsiveHeight(10),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: responsiveWidth(40),
              right: responsiveWidth(20),
            ),
            child: SizedBox(
              width: SizeConfig.screenWidth,
              child: Text(
                "Vegiwell We delever vegitable, cakes and many more.",
                style: TextStyle(
                  fontFamily: "Inter",
                  color: Colors.grey[600],
                  fontSize: responsiveHeight(15),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          SizedBox(
            height: responsiveHeight(25),
          ),
          Padding(
            padding: EdgeInsets.only(left: responsiveHeight(40)),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.mail_solid,
                  size: responsiveHeight(35),
                ),
                SizedBox(
                  width: responsiveWidth(15),
                ),
                Icon(
                  Icons.facebook_sharp,
                  size: responsiveHeight(36),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: responsiveWidth(20),
              right: responsiveWidth(20),
            ),
            child: Divider(
              thickness: responsiveHeight(2),
              color: Colors.grey.shade400,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: responsiveHeight(40), top: responsiveHeight(16)),
            child: Row(
              children: [
                SizedBox(
                  height: responsiveHeight(120),
                  width: responsiveWidth(140),
                  child: Image.asset(
                    "assets/Images/vegiwelllogo.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: responsiveWidth(15),
                ),
                Column(
                  children: [
                    // Text(
                    //   "Vegiwell",
                    //   style: TextStyle(
                    //     fontFamily: "Inter",
                    //     fontSize: responsiveHeight(28),
                    //     fontWeight: FontWeight.w800,
                    //   ),
                    // ),
                    SizedBox(
                      width: responsiveHeight(170),
                      height: responsiveHeight(45),
                      child: Image.asset(
                        'assets/Images/vegiwellname.png',
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.contain,
                        // color: Color.fromARGB(255, 20, 102, 23),
                        // color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: responsiveHeight(5),
                    ),
                    Text(
                      "version 1.0.0",
                      style: TextStyle(
                        fontFamily: "Inter",
                        color: Colors.grey[600],
                        fontSize: responsiveHeight(15),
                        fontWeight: FontWeight.w800,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
