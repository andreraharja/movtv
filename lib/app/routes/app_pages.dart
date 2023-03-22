import 'package:get/get.dart';
import 'package:movtv/app/modules/home/bindings/home_binding.dart';
import 'package:movtv/app/modules/home/views/home_view.dart';
import 'package:movtv/app/modules/movie/bindings/movie_binding.dart';
import 'package:movtv/app/modules/movie/views/movie_view.dart';
import 'package:movtv/app/modules/people/bindings/people_binding.dart';
import 'package:movtv/app/modules/people/views/people_view.dart';
import 'package:movtv/app/modules/tv/bindings/tv_binding.dart';
import 'package:movtv/app/modules/tv/views/tv_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE,
      page: () => MovieView(),
      binding: MovieBinding(),
    ),
    GetPage(
      name: _Paths.TV,
      page: () => TvView(),
      binding: TvBinding(),
    ),
    GetPage(
      name: _Paths.PEOPLE,
      page: () => PeopleView(),
      binding: PeopleBinding(),
    ),
  ];
}
