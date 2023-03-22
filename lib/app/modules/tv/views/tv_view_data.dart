import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/tv_controller.dart';

class TVViewData extends GetView<TvController> {
  const TVViewData({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.openDialog(index);
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.live_tv,
                    color: Colors.teal,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.65,
                        child: Text(
                          controller.lsDataTV[index].name!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      controller.lsDataTV[index].firstAirDate != ""
                          ? Text(
                        DateFormat("dd MMMM yyyy").format(DateTime.parse(
                            controller.lsDataTV[index].firstAirDate!)),
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                          : Container()
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_rate,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(controller.lsDataTV[index].voteAverage!
                      .toStringAsFixed(1))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
