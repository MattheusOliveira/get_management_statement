import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get_management_statement/controllers/get_x_controller.dart';
import 'package:get_management_statement/data/provider/api.dart';
import 'package:get_management_statement/data/repository/posts_repository.dart';
import 'package:http/http.dart';

class GetXBinding implements Bindings {
  @override 
  void dependencies() {
    Get.lazyPut(() => GetXController(Get.find()));
    Get.lazyPut(() => PostRepository(Get.find()));
    Get.lazyPut(() => MyApiClient(Get.find()));
    Get.lazyPut(() => Client());
  }
}