import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_management_statement/controllers/get_obx_controller.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';


class GetObxPage extends GetView<GetObxController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
        appBar: AppBar(
          title: Text('Obx management page'),
          centerTitle: true,
        ),
        body: _body(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next_rounded),
          onPressed: () {
            Get.offNamed('/getx-page');
          },
        ),
      ), onWillPop: () async{
        Get.offNamed('/');
        return false;
      });
  }

  Widget _body() { 
    return Obx(
      () => 
      controller.users.length < 1 
      ?
      Container(   
            child: Center(
              child: CircularProgressIndicator(),
            ),
      )
      :
      
      LazyLoadScrollView(
        isLoading: controller.lastPage,
        onEndOfPage: () =>controller.nextPage(),
        child: ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) {

            final user = controller.users[index];
            return ListTile(
              leading: Text(user.id),
              title: Text(user.name),
            );
          },
        ),

      ),
    );
  }

}