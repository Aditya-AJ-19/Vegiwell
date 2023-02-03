import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'package:vegiwell/Firebase%20Refrences/Home%20page%20reference/home_ref.dart';
import 'package:vegiwell/Models/product_model.dart';
import 'package:vegiwell/Pages/cartpage.dart';
import 'package:vegiwell/Pages/offer_page.dart';
import 'package:vegiwell/Pages/product_details.dart';
import 'package:vegiwell/Pages/profile_page.dart';
import 'package:vegiwell/Utils/custom_icons_icons.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/Utils/style.dart';
import 'package:vegiwell/controllers/auth_controller.dart';

import '../../controllers/carousel_controller.dart';
import 'Components/Offers Slidder/carousel_loading.dart';
import 'Components/Offers Slidder/carousel_with_indicator.dart';
import 'Components/category_slider.dart';
// import 'Components/first_slider.dart';
import 'Components/latest_product.dart';
// import 'Loading Shimmer/category_shimmer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Map<String, dynamic> userd = PhoneAuthController.useralldata;

  @override
  Widget build(BuildContext context) {
    final CarouselController cc = Get.find();
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.green,
        leading: Icon(
          Icons.location_on,
          size: responsiveHeight(40),
          color: AppTheme.darkBlue,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Home",
              style: TextStyle(
                color: AppTheme.darkBlue,
                fontSize: responsiveHeight(20),
                fontFamily: 'Inter',
                height: 1,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "${userd['address']}",
              style: TextStyle(
                color: AppTheme.darkBlue,
                height: 1.25,
                fontSize: responsiveHeight(14),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: responsiveWidth(10)),
            child: Icon(
              CustomIcons.bell,
              color: AppTheme.darkBlue,
              size: responsiveHeight(30),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: responsiveHeight(8),
            ),
            Obx(
              () {
                if (cc.isLoading.value) {
                  return const Center(
                    child: CarouselLoading(),
                  );
                } else {
                  if (cc.carouselItemList.isNotEmpty) {
                    return CarouselWithIndicator(data: cc.carouselItemList);
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.hourglass_empty),
                          Text("Data not found!")
                        ],
                      ),
                    );
                  }
                }
              },
            ),
            SizedBox(
              height: responsiveHeight(10),
            ),
            Padding(
              padding: EdgeInsets.only(left: responsiveHeight(25)),
              child: SizedBox(
                height: responsiveHeight(32),
                child: Text(
                  "CATEGORIES",
                  style: TextStyle(
                    fontSize: responsiveHeight(25),
                    color: AppTheme.darkBlue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(responsiveHeight(2)),
              height: responsiveHeight(120),
              // child: ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   itemCount: 6,
              //   itemBuilder: (context, index) => buildCardCategory(),
              // ),
              child: FirebaseAnimatedList(
                query: HomeRef().ref,
                defaultChild: SizedBox(
                  width: SizeConfig.screenWidth,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: ((context, index) => Container(
                          margin: EdgeInsets.only(
                              top: responsiveHeight(10),
                              left: responsiveHeight(10)),
                          child: Shimmer.fromColors(
                            highlightColor: Colors.white.withOpacity(0.6),
                            baseColor: Colors.grey.shade300,
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(
                                          responsiveHeight(20))),
                                ),
                                SizedBox(
                                  height: responsiveHeight(10),
                                ),
                                Container(
                                  color: Colors.grey.shade300,
                                  width: responsiveHeight(50),
                                  height: responsiveHeight(10),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
                itemBuilder: (context, snapshot, animation, index) {
                  var t = "";
                  var url = "";
                  t = snapshot.child("name").value.toString();
                  url = snapshot.child("image").value.toString();
                  var c = snapshot.child("cate").value.toString();
                  return buildCardCategory(t, url, c);
                },
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(right: responsiveHeight(10)),
              ),
            ),
            SizedBox(
              height: responsiveHeight(10),
            ),
            Padding(
              padding: EdgeInsets.only(left: responsiveHeight(25)),
              child: SizedBox(
                height: responsiveHeight(32),
                child: Text(
                  "Latest Product",
                  style: TextStyle(
                    fontSize: responsiveHeight(25),
                    color: AppTheme.darkBlue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(responsiveHeight(5)),
              height: responsiveHeight(230),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(responsiveHeight(20))),
              ),
              child: FirebaseAnimatedList(
                query: HomeRef().latestproductRef,
                defaultChild: SizedBox(
                  width: SizeConfig.screenWidth,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: ((context, index) => Container(
                          margin: EdgeInsets.only(
                              top: responsiveHeight(10),
                              left: responsiveHeight(10)),
                          child: Shimmer.fromColors(
                            highlightColor: Colors.white.withOpacity(0.6),
                            baseColor: Colors.grey.shade300,
                            child: Column(
                              children: [
                                Container(
                                  width: responsiveHeight(170),
                                  height: responsiveHeight(220),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(
                                          responsiveHeight(20))),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
                itemBuilder: (context, snapshot, animation, index) {
                  ProductData productDetails = ProductData(
                    id: snapshot.child('menu_id').value.toString(),
                    name: snapshot.child('name').value.toString(),
                    img: snapshot.child('image').value.toString(),
                    price: snapshot.child('price').value.toString(),
                    description: snapshot.child('description').value.toString(),
                  );
                  return latestProduct(productDetails);
                },
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(right: responsiveHeight(10)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: responsiveHeight(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(responsiveHeight(45)),
                  topRight: Radius.circular(responsiveHeight(45)),
                ),
                color: Colors.amber.shade100,
              ),
              height: responsiveHeight(70),
              width: SizeConfig.screenWidth,
              child: Center(
                  child: Text(
                "Deals of the Day",
                style: TextStyle(
                  fontSize: responsiveHeight(30),
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            Container(
              color: Colors.amber.shade100,
              width: SizeConfig.screenWidth,
              height: responsiveHeight(400),
              child: FirebaseAnimatedList(
                query: HomeRef().dealsofthedayRef,
                itemBuilder: (context, snapshot, animation, index) {
                  ProductData pd = ProductData(
                    id: snapshot.child('id').value.toString(),
                    name: snapshot.child('name').value.toString(),
                    img: snapshot.child('image').value.toString(),
                    price: snapshot.child('price').value.toString(),
                    description: snapshot.child('description').value.toString(),
                  );
                  return listCart(pd);
                },
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget listCart(ProductData pd) {
  return InkWell(
    onTap: () {
      Get.to(() => ProductDetails(pd: pd));
    },
    child: Container(
      height: responsiveHeight(130),
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.only(
        right: responsiveHeight(10),
        top: responsiveHeight(5),
        bottom: responsiveHeight(5),
      ),
      margin: EdgeInsets.only(
        left: responsiveHeight(15),
        right: responsiveHeight(15),
        top: responsiveHeight(15),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(responsiveHeight(20)),
        color: Colors.amber.shade200,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(responsiveHeight(10))),
            margin: EdgeInsets.symmetric(horizontal: responsiveHeight(12)),
            height: responsiveHeight(110),
            width: responsiveHeight(100),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(responsiveHeight(18)),
              child: Image.network(
                pd.img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // SizedBox(
          //   width: responsiveWidth(5),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pd.name,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: responsiveHeight(20),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "200 gm",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: responsiveHeight(17),
                    fontWeight: FontWeight.w600,
                    color: Colors.black38),
              ),
              Text(
                pd.price,
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: responsiveHeight(15),
                    fontWeight: FontWeight.w700,
                    color: Colors.black26),
              ),
            ],
          ),

          Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(responsiveHeight(30)),
            child: Container(
              height: responsiveHeight(30),
              width: responsiveWidth(80),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFFFCB930), Color(0xFFF16E35)]),
                borderRadius: BorderRadius.circular(responsiveHeight(30)),
              ),
              child: Center(
                  child: Text(
                "Add",
                style: TextStyle(fontSize: responsiveHeight(18)),
              )),
            ),
          ),
          // SizedBox(
          //   width: responsiveWidth(10),
          // ),
        ],
      ),
    ),
  );
}

class MainHomePage extends StatefulWidget {
  final int? currIndex;
  const MainHomePage({
    Key? key,
    this.currIndex,
  }) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  static int _currentIndex = 0;
  // final PhoneAuthController loginController = Get.find();
  @override
  void initState() {
    super.initState();
    setIndex();
  }

  void setIndex(){
    if (widget.currIndex != null) {
      setState(() {
        _currentIndex = widget.currIndex!;
      });
    }
  }
  final screens = [
    HomePage(),
    const CartPage(),
    const OfferPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      // body: const HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.green,
        unselectedItemColor: Colors.grey.shade300,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: "Offers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            PhoneAuthController.homeindex = value;
          });
        },
      ),
    );
  }
}
