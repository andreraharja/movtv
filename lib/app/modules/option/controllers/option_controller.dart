import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movtv/app/data/providers/data_provider.dart';
import 'package:movtv/app/data/result_model.dart';

class OptionController extends GetxController {
  TextEditingController rateController = TextEditingController();

  void submitRate(int id, String code) async {
    Get.dialog(
        Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false);
    Result result = await DataProvider().submitRateValue(
        id.toString(), code, double.parse(rateController.text));
    rateController.clear();
    Get.back();
    Get.back();
    Get.snackbar("Message", result.statusMessage!,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 0,
        backgroundColor: Colors.greenAccent,
        colorText: Colors.black);
  }

  void addToWatchlist(int id, String code) async {
    Get.dialog(
        Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false);
    Result result = await DataProvider().addWatchlist(id.toString(), code);
    Get.back();
    Get.back();
    Get.snackbar("Message", result.statusMessage!,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 0,
        backgroundColor: Colors.greenAccent,
        colorText: Colors.black);
  }
}
