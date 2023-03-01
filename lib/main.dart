import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegiwell/Pages/Home%20Page/homepage.dart';
import 'package:vegiwell/Pages/getotp.dart';
import 'package:vegiwell/Pages/msgorder.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Utils/style.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vegiwell/controllers/auth_controller.dart';
import 'package:vegiwell/controllers/carousel_controller.dart';
import 'package:vegiwell/controllers/cart_controller.dart';
import 'package:vegiwell/controllers/orders_controller.dart';

// import 'Firebase Refrences/Home page reference/home_ref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.

  final phoneAuthController = Get.put(PhoneAuthController());
  final carouselController = Get.put(CarouselController());
  final cartController = Get.put(CartController());
  final orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vegiwell',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Builder(builder: (BuildContext context) {
        SizeConfig().init(context);
        return const SplashScreen();
      }),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3500), () {
      PhoneAuthController().getUser();
      // HomeRef().rd();
    });
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            "assets/Images/vegiwellname.png",
            width: responsiveHeight(180),
            height: responsiveHeight(180),
          ),
          SizedBox(
            height: responsiveHeight(15),
          ),
          SizedBox(
            width: responsiveWidth(100),
            height: responsiveHeight(100),
            child: Lottie.asset("assets/Images/vegiwellLottie.json"),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(253, 253, 253, 255),
      duration: 3000,
      splashIconSize: responsiveHeight(315),
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.fade,
      nextScreen: FirebaseAuth.instance.currentUser != null
          ? const MainHomePage()
          : GetOtp(),
    );
  }
}
