import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get_management_statement/controllers/get_builder_controller.dart';

class GetBuilderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetBuilderController());
  }
}