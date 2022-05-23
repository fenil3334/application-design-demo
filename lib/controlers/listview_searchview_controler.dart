import 'package:application_design_demo/datamodel/list_model.dart';
import 'package:get/get.dart';

class ListviewSearchviewControler extends GetxController{
  RxList<ListModel> listTemp=RxList<ListModel>([]);
  RxList<ListModel> list=RxList<ListModel>([]);


  @override
  void onInit() {
    super.onInit();

    getData();
  }


  getData(){
    listTemp.add(ListModel('Jay', false));
    listTemp.add(ListModel('Ajay', false));
    listTemp.add(ListModel('Monik', false));
    listTemp.add(ListModel('Anand', false));
    listTemp.add(ListModel('Yagnik', false));
    listTemp.add(ListModel('Roy', false));
    listTemp.add(ListModel('Fenil', false));
    listTemp.add(ListModel('Harsh', false));

    list.value = listTemp;
  }


  productNameSearch(String name) {
    if (name.isEmpty) {
      list.value = listTemp;
    } else {
//Search must be tempList using
      list.value = listTemp
          .where((element) =>
          element.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
    }
  }
}