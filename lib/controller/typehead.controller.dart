import 'package:get/get.dart';
import 'package:yazan_app/model/type.head.model.dart';
import 'package:yazan_app/model/type.head.model2.dart';
import 'package:yazan_app/services/app.services.dart';

class TypeHeadController extends GetxController {
  var typeHead = <Data>[].obs;
  var isLoading = false.obs;

  ///// get type head
  // getTypeHead() {
  //   isLoading.value = true;
  //   update();
  //   AppServices.getTypeHead().then((value) {
  //     value!.results.alltype;
  //     typeHead.value = value.results.alltype;
  //     update();
  //     isLoading.value = false;
  //     update();
  //   });
  // }

  getTypeHead2() {
    isLoading.value = true;
    update();
    AppServices.getTypeHead().then((value) {
      print(value!.results!.data.toString());
      typeHead.value = value!.results!.data!;
      update();
      isLoading.value = false;
      update();
    });
  }
}
