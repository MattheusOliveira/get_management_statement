import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';


class GetBuilderController extends GetxController {
  var valorCodigoBarras = '';

  Future<void> escanearCodigoBarras() async {
    try {
      String barcodeScanRes = await  FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.BARCODE,);

      if(barcodeScanRes == '-1') {
        Get.snackbar('Cancelado', 'Não foi possível efetuar a leitura');
      } else {
        valorCodigoBarras = barcodeScanRes;
        update();
      }
    } on PlatformException{
      valorCodigoBarras = 'Falha na leitura do código de barras';
    } 
 
  }
}