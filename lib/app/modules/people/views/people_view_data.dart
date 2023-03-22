import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movtv/app/modules/people/views/people_view_movie.dart';
import '../controllers/people_controller.dart';

class PeopleViewData extends GetView<PeopleController> {
  const PeopleViewData({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.23,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      controller.lsDataPerson[index].name!,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                controller.lsDataPerson[index].knownFor != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            thickness: 2,
                          ),
                          Text('Known For : '),
                          SizedBox(height: 5),
                          PeopleViewMovie(
                            index: index,
                            constraints: constraints,
                          )
                        ],
                      )
                    : Container()
              ],
            );
          }),
        ),
      ),
    );
  }
}
