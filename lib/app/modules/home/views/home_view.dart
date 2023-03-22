import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movie & TV Show'),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SizedBox(
                    height: Get.height * 0.2,
                    child: Lottie.asset("assets/45732-cinema-animation.json")),
                pageName(context, Icons.star_rate, Colors.yellow,
                    "Top Rated Movie", "Movie"),
                pageName(context, Icons.upcoming, Colors.blue, "Upcoming Movie",
                    "Movie"),
                pageName(context, Icons.movie, Colors.green,
                    "Now Playing Movie", "Movie"),
                pageName(context, Icons.favorite, Colors.red, "Popular Movie",
                    "Movie"),
                pageName(
                    context, Icons.tv, Colors.purple, "Popular TV Show", "TV"),
                pageName(context, Icons.show_chart, Colors.blueGrey,
                    "Top Rated TV Show", "TV"),
                pageName(context, Icons.workspaces, Colors.teal,
                    "On The Air TV Show", "TV"),
                pageName(context, Icons.today, Colors.lime,
                    "Airing Today TV Show", "TV"),
                pageName(context, Icons.person, Colors.orange, "Popular People",
                    "People"),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                pageName(context, Icons.account_tree, Colors.lightGreenAccent,
                    "Rate Movie", "Movie"),
                pageName(context, Icons.list, Colors.brown, "Watchlist Movie",
                    "Movie"),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                pageName(context, Icons.today, Colors.amberAccent,
                    "Rate TV Show", "TV"),
                pageName(context, Icons.today, Colors.deepOrangeAccent,
                    "Watchlist TV Show", "TV"),
              ],
            )));
  }

  Widget pageName(BuildContext context, IconData iconValue, Color colorValue,
      String name, String code) {
    return GestureDetector(
        onTap: () {
          if (code == "Movie") {
            controller.toMovieList(name);
          } else if (code == "TV") {
            controller.toTVList(name);
          } else {
            controller.toPeopleList(name);
          }
        },
        child: Card(
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(iconValue, color: colorValue),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: Theme.of(context)
                        .textTheme
                        .overline!
                        .apply(fontSizeFactor: 1.5),
                  )
                ],
              )),
          elevation: 5,
        ));
  }
}
