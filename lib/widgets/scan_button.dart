import 'package:cartilla_flutter/models/personal_response.dart';
import 'package:cartilla_flutter/services/visita_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String barcodeScanRes;
        // Platform messages may fail, so we use a try/catch PlatformException.
        try {
          barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
          print(barcodeScanRes);

          dynamic array = barcodeScanRes.split('@');
          print(array);
          String dato_dni = array[4].toString();
          var servicio = VisitaService();
          PersonalElement visita = await servicio.getByDni(dato_dni);
          Navigator.pushNamed(context, 'details', arguments: visita);
        } catch (e) {
          barcodeScanRes = 'Failed to get platform version.';
        }
      },
      child: Icon(Icons.center_focus_strong),
    );
  }
}
