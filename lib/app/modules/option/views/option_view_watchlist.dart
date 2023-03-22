import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/option_controller.dart';

class OptionViewWatchlist extends GetView<OptionController> {
  const OptionViewWatchlist({
    Key? key,
    required this.id,
    required this.code,
  }) : super(key: key);

  final int id;
  final String code;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          controller.addToWatchlist(id, code);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            SizedBox(
              width: 10,
            ),
            Text('Add To Watchlist')
          ],
        ));
  }
}
