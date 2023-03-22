import 'package:get/get.dart';
import 'package:movtv/app/routes/app_pages.dart';

class HomeController extends GetxController {
  void toMovieList(String pageName) {
    Get.toNamed(Routes.MOVIE, arguments: {"page": pageName});
  }

  void toTVList(String pageName) {
    Get.toNamed(Routes.TV, arguments: {"page": pageName});
  }

  void toPeopleList(String pageName) {
    Get.toNamed(Routes.PEOPLE, arguments: {"page": pageName});
  }
}
