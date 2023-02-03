import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegiwell/Pages/Home%20Page/homepage.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Utils/style.dart';
import 'package:vegiwell/controllers/auth_controller.dart';

class OrderSuccessfulScreen extends StatelessWidget {
  const OrderSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          const Text(
            "Thank You,",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: responsiveHeight(20),
          ),
          ElevatedButton(
            onPressed: () {
              PhoneAuthController().getUser();
              Get.offAll(() => const MainHomePage(
                    currIndex: 0,
                  ));
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const StadiumBorder(),
            ),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppTheme.green,
                      AppTheme.lightGreen,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                width: responsiveWidth(320),
                height: responsiveHeight(50),
                alignment: Alignment.center,
                child: const Text(
                  'continue Shopping',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
