import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movtv/app/data/data_movie_model.dart';
import 'package:movtv/app/data/providers/data_provider.dart';
import 'package:movtv/app/modules/option/views/option_view.dart';

class MovieController extends GetxController {
  var lsDataMovie = List<DataMovie>.empty().obs;
  String pageName = "";
  var isLoading = true.obs;
  TextEditingController searchText = TextEditingController();

  MovieController(this.arguments);

  Map arguments;

  @override
  void onInit() async {
    pageName = arguments["page"];
    lsDataMovie.value = await DataProvider().getDataMovie(topic: pageName);
    isLoading(false);
    super.onInit();
  }

  void openDialog(int index) {
    Get.dialog(OptionView(
      title: lsDataMovie[index].title!,
      id: lsDataMovie[index].id!,
      code: "movie",
    ));
  }

  void filterSearchResult() async {
    isLoading(true);
    if (searchText.text == "") {
      lsDataMovie.value = await DataProvider().getDataMovie(topic: pageName);
    } else {
      lsDataMovie.value = await DataProvider()
          .getDataMovie(topic: "Search", querySearch: searchText.text);
    }
    isLoading(false);
  }
}
