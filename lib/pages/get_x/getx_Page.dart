import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_management_statement/controllers/get_x_controller.dart';

class GetXPage extends GetView<GetXController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Getx management page'),
        leading: BackButton(
          onPressed: () => Get.offNamed('/')
        ),
      ),
      body: Container(
          child: GetX<GetXController>(
        builder: (_) => _.postList.length != null && _.postList.length < 1
            ? Center(child: TextButton(
                    child: Text('Buscar lista'),
                    onPressed: () {
                      controller.getAll();
                    },
                  ),)
            : Column(
                children: [
                
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_.postList[index].title),
                          subtitle: Text(_.postList[index].body),
                        );
                      },
                      itemCount: _.postList.length,
                    ),
                  )
                ],
              ),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next_rounded),
        onPressed: () {
          Get.offNamed('/get-builder-page');
        },
      ),
    );
  }
}
