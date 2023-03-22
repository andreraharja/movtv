import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/option_controller.dart';
import 'option_view_rate.dart';
import 'option_view_watchlist.dart';

class OptionView extends StatelessWidget {
  OptionView({required this.id, required this.title, required this.code});
  final int id;
  final String title;
  final String code;

  final OptionController controller = Get.put(OptionController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        height: Get.height * 0.22,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              OptionViewRate(formKey: _formKey, id: id, code: code),
              SizedBox(
                height: 20,
              ),
              OptionViewWatchlist(id: id, code: code)
            ],
          ),
        ),
      ),
    );
  }
}
