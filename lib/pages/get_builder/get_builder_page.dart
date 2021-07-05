import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_management_statement/controllers/get_builder_controller.dart';

class GetBuilderPage extends GetView {
  // stateless ou statefull

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Buider management page'),
        centerTitle: true,
        leading: BackButton(
          onPressed: () => Get.offNamed('/getx-page'),
        ),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Valor do código de barras',
              style: Get.theme.textTheme.headline6!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            GetBuilder<GetBuilderController>(
              builder: (controller) {
                return Text(controller.valorCodigoBarras,
                    style: Get.theme.textTheme.headline5);
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextButton.icon(
              onPressed: () =>
                  Get.find<GetBuilderController>().escanearCodigoBarras(),
              icon: Container(
                width: 50,
                child: Icon(
                  Icons.flip_to_back_rounded,
                ),
              ),
              label: Text(
                'Ler Código de Barras',
                style: Get.theme.textTheme.headline6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
