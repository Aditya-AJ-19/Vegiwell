import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegiwell/Pages/getotp.dart';
import 'package:vegiwell/Pages/help_page.dart';
import 'package:vegiwell/Pages/orders_page.dart';
import 'package:vegiwell/Utils/size_config.dart';
import 'package:vegiwell/controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "My Account",
          style: TextStyle(
            fontSize: responsiveHeight(25),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // body: FutureBuilder<UserInformation?>(
      //   future: PhoneAuthController().getUser(),
      //   builder: ((context, snapshot) {
      //     if (snapshot.hasError) {
      //       return Center(
      //         child: Text(
      //           snapshot.error.toString(),
      //           style: TextStyle(
      //             fontSize: responsiveHeight(15),
      //             color: Colors.red,
      //           ),
      //         ),
      //       );
      //     } else if (snapshot.hasData) {
      //       final userdata = snapshot.data;
      //       if (userdata == null) {
      //         Get.offAll(() => UserInfoPage());
      //         return const Text("");
      //       } else {
      //         return userProfileview(userdata);
      //       }
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   }),
      // ),
      body: userProfileview(PhoneAuthController.useralldata),
    );
  }

  Widget userProfileview(Map<String, dynamic> userdata) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: responsiveHeight(210),
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFFFCB930), Color(0xFFF16E35)]),
          ),
          padding: EdgeInsets.all(responsiveHeight(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: responsiveHeight(140),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: responsiveHeight(50),
                      backgroundColor: Colors.grey.shade300,
                      child: ClipOval(
                        child: Padding(
                          padding: EdgeInsets.only(top: responsiveHeight(7)),
                          child: Image.network(
                            "https://cdn.pixabay.com/photo/2017/01/31/21/23/avatar-2027366_1280.png",
                            fit: BoxFit.contain,
                            height: responsiveHeight(110),
                            width: responsiveHeight(110),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: responsiveWidth(15),
                    ),
                    SizedBox(
                      height: responsiveHeight(115),
                      width: responsiveHeight(223.7),
                      child: Column(
                        children: [
                          Text(
                            "${userdata['username']} ${userdata['userlastname']}",
                            // "${userinfo.name} ${userinfo.userlastname}",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: responsiveHeight(30),
                                fontWeight: FontWeight.w400,
                                height: responsiveHeight(1.5)),
                          ),
                          Text("${userdata['email']}",
                              style: TextStyle(
                                color: const Color(0xff7D6D6D),
                                fontSize: responsiveHeight(14),
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w200,
                                height: responsiveHeight(0.6),
                              ),
                              overflow: TextOverflow.ellipsis),
                          Container(
                            margin: EdgeInsets.only(top: responsiveHeight(15)),
                            height: responsiveHeight(35),
                            width: responsiveHeight(225),
                            decoration: BoxDecoration(
                              color: const Color(0xffEAE7E2),
                              borderRadius:
                                  BorderRadius.circular(responsiveHeight(10)),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: responsiveHeight(27),
                                  color: Colors.orange,
                                ),
                                SizedBox(
                                  width: responsiveWidth(6),
                                ),
                                SizedBox(
                                  width: responsiveHeight(185),
                                  child: Text(
                                    "${userdata['address']}",
                                    style: TextStyle(
                                      fontSize: responsiveHeight(13),
                                      fontFamily: "Inter",
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: responsiveHeight(10),
              ),
              // Container(
              //   height: responsiveHeight(26),
              //   width: responsiveWidth(100),
              //   decoration: BoxDecoration(
              //       color: const Color(0xffEAE7E2),
              //       borderRadius: BorderRadius.circular(responsiveHeight(30))),
              //   child: Center(
              //       child: Text(
              //     "Edit",
              //     style: TextStyle(fontSize: responsiveHeight(15)),
              //   )),
              // ),
            ],
          ),
        ),
        InkWell(
          onTap: () => Get.to(() => const OrdersPage()),
          child: card(
            "My Orders",
            Icons.shopping_bag_outlined,
          ),
        ),
        Divider(
          height: 0,
          color: Colors.black,
          thickness: responsiveHeight(1.5),
        ),
        InkWell(
          onTap: () => Get.to(()=>const HelpPage()),
          child: card(
            "Help",
            Icons.help,
          ),
        ),
        Divider(
          height: 0,
          color: Colors.black,
          thickness: responsiveHeight(1.5),
        ),
        SizedBox(
          height: responsiveHeight(40),
        ),
        InkWell(
          onTap: () {
            Get.defaultDialog(
              barrierDismissible: false,
              backgroundColor: Colors.black,
              title: "Logout",
              titleStyle: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: responsiveHeight(25),
                  color: Colors.white),
              content: Padding(
                padding: EdgeInsets.only(bottom: responsiveHeight(20)),
                child: Text(
                  "Are you sure you want to logout?",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    fontSize: responsiveHeight(15),
                    color: const Color(0Xff706E6E),
                  ),
                ),
              ),
              cancel: Padding(
                padding: EdgeInsets.only(right: responsiveHeight(8), bottom: responsiveHeight(15)),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: responsiveHeight(18),
                      color: const Color(0xFFF16E35),
                    ),
                  ),
                ),
              ),
              confirm: InkWell(
                onTap: () async {
                  await auth.signOut();
                  if (auth.currentUser == null) {
                    Get.offAll(() => GetOtp());
                  }
                },
                child: Material(
                  borderRadius: BorderRadius.circular(responsiveHeight(30)),
                  child: Container(
                    height: responsiveHeight(26),
                    width: responsiveWidth(90),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFFFCB930), Color(0xFFF16E35)]),
                      borderRadius: BorderRadius.circular(responsiveHeight(30)),
                    ),
                    child: Center(
                        child: Text(
                      "LogOut",
                      style: TextStyle(fontSize: responsiveHeight(18)),
                    )),
                  ),
                ),
              ),
            );
            // await auth.signOut();
            // if (auth.currentUser == null) {
            //   Get.offAll(() => GetOtp());
            // }
          },
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(responsiveHeight(30)),
            child: Container(
              height: responsiveHeight(35),
              width: responsiveWidth(120),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFFFCB930), Color(0xFFF16E35)]),
                borderRadius: BorderRadius.circular(responsiveHeight(30)),
              ),
              child: Center(
                  child: Text(
                "LogOut",
                style: TextStyle(fontSize: responsiveHeight(18)),
              )),
            ),
          ),
        ),
      ],
    );
  }

  Widget card(String text, IconData icon) {
    return Container(
      width: double.infinity,
      height: responsiveHeight(90),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: responsiveWidth(35),
          ),
          Icon(
            icon,
            size: responsiveHeight(30),
            color: Colors.black,
          ),
          SizedBox(
            width: responsiveWidth(10),
          ),
          Text(
            text,
            style: TextStyle(
                fontFamily: "Inter",
                fontSize: responsiveHeight(18),
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
