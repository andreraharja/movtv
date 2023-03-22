import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/movie_controller.dart';
import 'movie_view_data.dart';
import 'movie_view_search.dart';

class MovieView extends GetView<MovieController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.pageName),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          controller.pageName.contains("Rate") ||
                  controller.pageName.contains("Watchlist")
              ? Container()
              : MovieViewSearch(),
          Expanded(
            child: Obx(() => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.lsDataMovie.length,
                    itemBuilder: (context, index) {
                      return MoviewViewData(index: index);
                    })),
          )
        ],
      ),
    );
  }
}
