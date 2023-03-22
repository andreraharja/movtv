import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movtv/app/modules/tv/views/tv_view_data.dart';
import 'package:movtv/app/modules/tv/views/tv_view_search.dart';
import '../controllers/tv_controller.dart';

class TvView extends GetView<TvController> {
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
              : TVViewSearch(),
          Expanded(
            child: Obx(() => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.lsDataTV.length,
                    itemBuilder: (context, index) {
                      return TVViewData(
                        index: index,
                      );
                    })),
          ),
        ],
      ),
    );
  }
}
