import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vegiwell/Models/carousel_model.dart';

class CarouselController extends GetxController {
  static CarouselController instance = Get.find();
  RxList<CarouselModel> carouselItemList =
      List<CarouselModel>.empty(growable: true).obs;
  RxBool isLoading = false.obs;
  final bannerRef = FirebaseFirestore.instance
      .collection('slider')
      .withConverter<CarouselModel>(
        fromFirestore: ((snapshot, _) {
          return CarouselModel.fromJson(snapshot.data()!);
        }),
        toFirestore: ((value, _) => value.toJson()),
      );

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<List<CarouselModel>> getBanner() async {
    var querySnapshot = await bannerRef.get();
    var carouselItemlist2 =
        querySnapshot.docs.map((doc) => doc.data()).toList();
    return carouselItemlist2;
  }

  void getData() async {
    try {
      var result = await getBanner();
      carouselItemList.assignAll(result);
      isLoading(true);
    } catch (e) {
      Get.snackbar("Error", "$e");
    } finally {
      isLoading(false);
    }
  }
}
