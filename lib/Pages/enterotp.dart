import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:notesapp/Utils/custom_icons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:vegiwell/Pages/homepage.dart';
import 'package:vegiwell/Pages/userinfo.dart';
import 'package:vegiwell/Utils/coustum_clip.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Utils/style.dart';
import 'package:vegiwell/controllers/auth_controller.dart';

class EnterOtp extends StatefulWidget {
  const EnterOtp({Key? key}) : super(key: key);

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  String otpPin = '';
  final PhoneAuthController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: AppTheme.clip2,
                    border: Border.all(
                      width: 0,
                      color: AppTheme.clip2,
                    )),
                width: SizeConfig.screenWidth,
                height: responsiveHeight(200),
                padding: EdgeInsets.only(left: responsiveWidth(25)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "FRESH",
                      style: TextStyle(
                        height: 0.25,
                        fontSize: responsiveWidth(77),
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "AND ORGANIC",
                      style: TextStyle(
                        height: 1,
                        fontSize: responsiveHeight(35),
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth,
                height: responsiveHeight(450),
                // height: responsiveHeight(525),
                child: Stack(
                  children: <Widget>[
                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        padding: EdgeInsets.only(bottom: responsiveHeight(230)),
                        color: AppTheme.clip2,
                        height: responsiveHeight(440),
                        width: SizeConfig.screenWidth,
                        child: SizedBox(
                          height: responsiveHeight(200),
                          width: responsiveWidth(336),
                          child: Image.asset("assets/Images/vegitable.png"),
                        ),
                      ),
                    ),
                    Positioned(
                      top: responsiveHeight(355),
                      child: Container(
                        margin: EdgeInsets.only(left: responsiveWidth(25)),
                        width: SizeConfig.screenWidth,
                        height: responsiveHeight(38),
                        child: Text(
                          "<  Enter 6 digit OTP",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            wordSpacing: responsiveWidth(3),
                            fontSize: responsiveWidth(20),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: responsiveHeight(390),
                      child: SizedBox(
                        // color: Colors.pinkAccent,
                        // padding: EdgeInsets.symmetric(
                        //     horizontal: responsiveWidth(25)),
                        width: SizeConfig.screenWidth,
                        height: 50,
                        // child: numberField,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(25),
                          ),
                          padding: EdgeInsets.only(
                            left: responsiveWidth(25),
                            right: responsiveWidth(25),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(
                                Radius.circular(responsiveHeight(50))),
                          ),
                          child: Center(
                            child: PinCodeTextField(
                              keyboardType: TextInputType.number,
                              length: 6,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.underline,
                                fieldHeight: 40,
                                fieldWidth: 40,
                                activeFillColor: Colors.grey[300],
                                selectedColor: Colors.grey[300],
                                inactiveFillColor: Colors.grey[300],
                                inactiveColor: Colors.black,
                              ),
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              backgroundColor: Colors.grey[300],
                              onChanged: (value) {
                                setState(() {
                                  otpPin = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                return true;
                              },
                              appContext: context,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: responsiveWidth(36)),
                height: responsiveHeight(30),
                width: SizeConfig.screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "OTP has been sent to 9*******89\nHaven't received your OTP yet?",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: responsiveWidth(12),
                          color: Colors.grey[600]),
                    ),
                    Text(
                      "RESEND >",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.orange,
                        fontSize: responsiveHeight(12),
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: responsiveHeight(14)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(responsiveHeight(30))),
                child: ElevatedButton(
                  onPressed: () {
                    if (otpPin.isNotEmpty && otpPin.length == 6) {
                      loginController.verifyOtp(otpPin, UserInfoPage());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: const StadiumBorder(),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppTheme.green,
                    AppTheme.lightGreen,],
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      width: responsiveWidth(320),
                      height: responsiveHeight(50),
                      alignment: Alignment.center,
                      child: const Text(
                        'CONTINUE',
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
