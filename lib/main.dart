import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_management_statement/bindings/get_builder_binding.dart';
import 'package:get_management_statement/bindings/get_obx_binding.dart';
import 'package:get_management_statement/bindings/get_x_binding.dart';
import 'package:get_management_statement/pages/get_obx/get_obx_page.dart';
import 'package:get_management_statement/pages/get_x/getx_Page.dart';
import 'package:get_management_statement/pages/get_builder/get_builder_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', binding: GetObxBinding(), page: () => GetObxPage()),
        GetPage(
            name: '/getx-page', binding: GetXBinding(), page: () => GetXPage()),
        GetPage(
            name: '/get-builder-page',
            binding: GetBuilderBinding(),
            page: () => GetBuilderPage())
      ],
    );
  }
}
