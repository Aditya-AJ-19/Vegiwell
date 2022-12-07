import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegiwell/Models/user.dart';

class PhoneAuthController extends GetxController {
  static String varId = "";
  static int homeindex = 0;
  static String uId = "";
  static String usernumber = "";
  static User? user;
  static Map<String, dynamic> useralldata = {};

  var auth = FirebaseAuth.instance;
  final _instance = FirebaseFirestore.instance;

  verifyPhone(String number) async {
    usernumber = number;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 120),
      verificationCompleted: ((phoneAuthCredential) async {
        // await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
        // uId = phoneAuthCredential.token.toString();
      }),
      verificationFailed: (FirebaseAuthException e) {
        var mess = e.message;
        Get.snackbar("Verification Failed", "$mess");
      },
      codeSent: ((verificationId, forceResendingToken) {
        Get.snackbar("Code Sent", "please fill it properly");
        varId = verificationId;
      }),
      codeAutoRetrievalTimeout: ((verificationId) {}),
    );
  }


  Future<void> verifyOtp(String otpPin, Widget userinfopage) async {
    user = (await FirebaseAuth.instance
            .signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: varId,
        smsCode: otpPin,
      ),
    )
            .whenComplete(() {
      Get.to(() => userinfopage);
    }))
        .user!;
    // var id = user!.uid;
  }

  createUser(UserInformation userdata, Widget home) async {
    final prefs = await SharedPreferences.getInstance();
    var uid = user!.uid;
    await prefs.setString('action', uid);
    final docuser = FirebaseFirestore.instance.collection('users').doc(uid);

    final json = userdata.toJson();
    await docuser.set(json).whenComplete(() async {
      await getUser();
      Get.offAll(home);
    });
  }

  Future<UserInformation?> getUser() async {
    // final prefs = await SharedPreferences.getInstance();
    var docid = auth.currentUser?.uid.toString();
    // var docid = prefs.getString('action');
    final docUser = _instance.collection('users').doc(docid);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      useralldata = snapshot.data()!;
      return UserInformation().fromMap(snapshot.data()!);
    } else {
      return null;
    }
  }

  updateUserData(Map<String, dynamic> data) {
    var docid = auth.currentUser?.uid.toString();
    // logger.i("UPDATED");
    _instance
        .collection('users')
        .doc(docid)
        .update(data);
  }
}
