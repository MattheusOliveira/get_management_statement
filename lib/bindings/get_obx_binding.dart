import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get_management_statement/controllers/get_obx_controller.dart';
import 'package:get_management_statement/data/provider/api.dart';
import 'package:get_management_statement/data/repository/user_repository.dart';
import 'package:http/http.dart';

class GetObxBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetObxController(Get.find()));
    Get.lazyPut(() => UserRepository(Get.find()));
    Get.lazyPut(() => MyApiClient(Get.find()));
    Get.lazyPut(() => Client());

    //ou 

    /* Get.lazyPut(() {
      final httpClient = Client();
      final myApiClient = MyApiClient(httpClient);
      final userRepository = UserRepository(myApiClient);
      return GetObxController(userRepository);
    }); */
  }
}