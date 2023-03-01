import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegiwell/Pages/enterotp.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Utils/style.dart';
import 'package:vegiwell/controllers/auth_controller.dart';
import '../Utils/coustum_clip.dart';

class GetOtp extends StatelessWidget {
  GetOtp({Key? key}) : super(key: key);

  final TextEditingController numberController = TextEditingController();
  final PhoneAuthController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    final numberField = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.number,
      controller: numberController,
      // validator: (){},
      onSaved: (value) {
        numberController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          fillColor: AppTheme.numberfield,
          // fillColor: Colors.grey[200],
          filled: true,
          prefixIcon: const Icon(
            Icons.phone,
            color: AppTheme.lighttext,
          ),
          contentPadding: EdgeInsets.fromLTRB(responsiveWidth(20),
              responsiveHeight(15), responsiveWidth(20), responsiveHeight(15)),
          hintText: "Your phone number",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(responsiveWidth(30)))),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: AppTheme.clip1,
                    border: Border.all(
                      width: 0,
                      color: AppTheme.clip1,
                    )),
                width: SizeConfig.screenWidth,
                height: responsiveHeight(160),
                padding: EdgeInsets.only(
                    left: responsiveWidth(25), top: responsiveHeight(55)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "45",
                          style: TextStyle(
                            height: 1,
                            fontSize: responsiveWidth(70),
                            // fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "MINUTES",
                          style: TextStyle(
                            fontSize: responsiveWidth(30),
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "EXPRESS DELIVERY",
                      style: TextStyle(
                        height: 0.5,
                        fontSize: responsiveHeight(26),
                        // fontWeight: FontWeight.bold,
                        color: AppTheme.graytext,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth,
                height: responsiveHeight(490),
                child: Stack(
                  children: <Widget>[
                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        color: AppTheme.clip1,
                        height: responsiveHeight(480),
                        width: SizeConfig.screenWidth,
                        padding: EdgeInsets.only(bottom: responsiveHeight(150)),
                        child: SizedBox(
                          height: responsiveHeight(270),
                          width: responsiveWidth(300),
                          child: Image.asset("assets/Images/orderboy.png"),
                        ),
                      ),
                    ),
                    Positioned(
                      top: responsiveHeight(380),
                      child: Container(
                        margin: EdgeInsets.only(left: responsiveWidth(25)),
                        width: SizeConfig.screenWidth,
                        height: responsiveHeight(30),
                        child: Text(
                          "Let's get you started",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            wordSpacing: responsiveWidth(3),
                            fontSize: responsiveHeight(20),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: responsiveHeight(420),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(25)),
                        width: SizeConfig.screenWidth,
                        height: 50,
                        child: numberField,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // color: Colors.red,
                padding: EdgeInsets.only(left: responsiveWidth(35)),
                height: responsiveHeight(30),
                width: SizeConfig.screenWidth,
                child: Text(
                  "We will send you otp on this number",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: responsiveWidth(12),
                      color: const Color(0xff797777)),
                ),
              ),
              Container(
                // padding: EdgeInsets.only(top: responsiveHeight(10)),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(responsiveHeight(30))),
                child: ElevatedButton(
                  onPressed: () {
                    loginController.verifyPhone("+91${numberController.text.trim()}");
                    Get.to(()=> const EnterOtp());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: const StadiumBorder(),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [AppTheme.green,
                    AppTheme.lightGreen,]),
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      width: responsiveWidth(320),
                      height: responsiveHeight(50),
                      alignment: Alignment.center,
                      child: const Text(
                        'GET OTP',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
