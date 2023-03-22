import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/people_controller.dart';

class PeopleViewMovie extends GetView<PeopleController> {
  const PeopleViewMovie(
      {Key? key, required this.index, required this.constraints})
      : super(key: key);

  final int index;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constraints.maxHeight * 0.5,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.lsDataPerson[index].knownFor!.length,
          itemBuilder: (context, indexKnown) {
            if (controller
                .lsDataPerson[index].knownFor![indexKnown].originalTitle !=
                null) {
              return Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(right: 10, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 1), //(x,y)
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    knownMovie(
                        index,
                        indexKnown,
                        Icons.movie,
                        Colors.teal,
                        controller
                            .lsDataPerson[
                        index]
                            .knownFor![
                        indexKnown]
                            .originalTitle!),
                    SizedBox(
                      height: 5,
                    ),
                    knownMovie(
                        index,
                        indexKnown,
                        Icons.star_rate,
                        Colors.yellow,
                        controller
                            .lsDataPerson[
                        index]
                            .knownFor![
                        indexKnown]
                            .voteAverage
                            .toString()),
                  ],
                ),
              );
            } else {
              return Container();
            }
          }),
    );
  }

  Widget knownMovie(int index, int indexKnown, IconData iconValue,
      Color colorValue, String txtValue) {
    return Row(
      children: [
        Icon(
          iconValue,
          color: colorValue,
        ),
        SizedBox(
          width: 5,
        ),
        Text(txtValue),
      ],
    );
  }
}