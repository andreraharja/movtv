import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movtv/app/modules/people/views/people_view_data.dart';
import '../controllers/people_controller.dart';

class PeopleView extends GetView<PeopleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.pageName),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.lsDataPerson.length,
              itemBuilder: (context, index) {
                return PeopleViewData(index: index,);
              })),
    );
  }
}
