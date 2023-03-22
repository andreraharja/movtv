import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tv_controller.dart';

class TVViewSearch extends GetView<TvController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: TextField(
          onChanged: (value) {
            controller.filterSearchResult();
          },
          controller: controller.searchText,
          decoration: InputDecoration(
              labelText: "Search",
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))))),
    );
  }
}