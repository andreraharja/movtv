import 'package:get/get.dart';
import 'package:movtv/app/data/data_person_model.dart';
import 'package:movtv/app/data/providers/data_provider.dart';

class PeopleController extends GetxController {
  var lsDataPerson = List<DataPerson>.empty().obs;
  String pageName = "";
  var isLoading = true.obs;

  PeopleController(this.arguments);

  Map arguments;

  @override
  void onInit() async {
    pageName = arguments["page"];
    lsDataPerson.value = await DataProvider().getDataPerson();
    isLoading(false);
    super.onInit();
  }
}
