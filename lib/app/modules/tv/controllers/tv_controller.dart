import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movtv/app/data/data_tv_model.dart';
import 'package:movtv/app/data/providers/data_provider.dart';
import 'package:movtv/app/modules/option/views/option_view.dart';

class TvController extends GetxController {
  var lsDataTV = List<DataTV>.empty().obs;
  String pageName = "";
  var isLoading = true.obs;
  TextEditingController searchText = TextEditingController();

  TvController(this.arguments);

  Map arguments;

  @override
  void onInit() async {
    pageName = arguments["page"];
    lsDataTV.value = await DataProvider().getDataTV(topic: pageName);
    isLoading(false);
    super.onInit();
  }

  void openDialog(int index) {
    Get.dialog(OptionView(
      title: lsDataTV[index].name!,
      id: lsDataTV[index].id!,
      code: "tv",
    ));
  }

  void filterSearchResult() async {
    isLoading(true);
    if (searchText.text == "") {
      lsDataTV.value = await DataProvider().getDataTV(topic: pageName);
    } else {
      lsDataTV.value = await DataProvider()
          .getDataTV(topic: "Search", querySearch: searchText.text);
    }
    isLoading(false);
  }
}
