import 'package:flutter/material.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Utils/style.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        backgroundColor: AppTheme.green,
        foregroundColor: AppTheme.darkBlue,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   width: SizeConfig.screenWidth,
              //   height: responsiveHeight(118),
              //   color: const Color.fromARGB(255, 232, 128, 64),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       CircleAvatar(
              //         radius: responsiveHeight(50),
              //         backgroundColor: Colors.grey.shade300,
              //         child: ClipOval(
              //           child: Padding(
              //             padding: EdgeInsets.only(top: responsiveHeight(7)),
              //             child: Image.network(
              //               "https://cdn.pixabay.com/photo/2017/01/31/21/23/avatar-2027366_1280.png",
              //               fit: BoxFit.contain,
              //               height: responsiveHeight(110),
              //               width: responsiveHeight(110),
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: responsiveHeight(35),
              //       ),
              //       Text(
              //         "My Offer",
              //         style: TextStyle(
              //           fontSize: responsiveHeight(40),
              //           fontWeight: FontWeight.bold,
              //           fontFamily: "Inter",
              //           color: Colors.white,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                  top: responsiveHeight(15),
                  left: responsiveHeight(20),
                  bottom: responsiveHeight(20),
                ),
                child: Text(
                  "LIMITED TIME OFFERS",
                  style: TextStyle(
                    fontSize: responsiveHeight(20),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: responsiveHeight(10)),
                child: SizedBox(
                  width: SizeConfig.screenWidth,
                  height: responsiveHeight(200),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) => Container(
                      height: responsiveHeight(195),
                      width: responsiveHeight(195),
                      margin: EdgeInsets.only(left: responsiveHeight(20)),
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius:
                            BorderRadius.circular(responsiveHeight(20)),
                      ),
                      child: Image.asset(
                        "assets/Images/Offer1.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: responsiveHeight(15),
                  left: responsiveHeight(20),
                  bottom: responsiveHeight(20),
                ),
                child: Text(
                  "OTHER OFFERS",
                  style: TextStyle(
                    fontSize: responsiveHeight(20),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: responsiveHeight(20),
                  left: responsiveHeight(20),
                ),
                child: SizedBox(
                  width: SizeConfig.screenWidth,
                  height: responsiveHeight(650),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 6,
                      itemBuilder: (context, index) => otherOffer(
                            "",
                            "",
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget otherOffer(String image, String text) {
  return Container(
    margin: EdgeInsets.only(bottom: responsiveHeight(15)),
    width: responsiveHeight(321),
    height: responsiveHeight(92),
    decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(responsiveHeight(20))),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: responsiveHeight(15)),
          height: responsiveHeight(60),
          width: responsiveHeight(60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(responsiveHeight(20))),
          child: Image.asset(
            "assets/Images/Offer1.png",
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          width: responsiveWidth(20),
        ),
        SizedBox(
          width: responsiveHeight(210),
          height: responsiveHeight(70),
          child: Center(
              child: Text(
            "UPTO 10 % CASHBACK ON PAYING WITH ANY UPI TRANSACTIONS ",
            style: TextStyle(
              fontSize: responsiveHeight(16),
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          )),
        ),
      ],
    ),
  );
}
