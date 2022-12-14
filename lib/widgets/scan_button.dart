import 'package:cartilla_firebase_fl/models/personal_response.dart';
import 'package:cartilla_firebase_fl/providers/data_provider.dart';
import 'package:cartilla_firebase_fl/providers/dni_provider.dart';
import 'package:cartilla_firebase_fl/services/visita_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerDni = Provider.of<DniProvider>(context);
    final dataProvider = Provider.of<DataProvider>(context);

    return FloatingActionButton(
      onPressed: () async {
        

        String barcodeScanRes;
        // Platform messages may fail, so we use a try/catch PlatformException.
        try {
          barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#ff6666', 'Cancel', true, ScanMode.DEFAULT
              );
          if (barcodeScanRes == '-1') {
            return StylishDialog(
              context: context,
              alertType: StylishDialogType.ERROR,
              titleText: 'Escaneo Cancelado!',
            ).show();
          }

          List<String> array = barcodeScanRes.split('@');
          if (array.length != 9) {
            return StylishDialog(
              context: context,
              alertType: StylishDialogType.ERROR,
              titleText: 'Código No Váido!',
            ).show();
          }



          StylishDialog errorDialog = StylishDialog(
              context: context,
              alertType: StylishDialogType.ERROR,
              titleText: 'NO PUEDE INGRESAR!',              
              //contentText: dataProvider.data.toString(),
              dismissOnTouchOutside: true,
              );

          StylishDialog dialog = StylishDialog(
            context: context,
            alertType: StylishDialogType.PROGRESS,
            animationLoop: false,
            titleText: 'Procesando...',
            dismissOnTouchOutside: false,
          );

          StylishDialog dialogAutorizado = StylishDialog(
            context: context,
            alertType: StylishDialogType.SUCCESS,
            animationLoop: false,
            titleText: 'Persona Autorizada!!',
            dismissOnTouchOutside: true,
          );

          dialog.show();
          providerDni.getData(array);
          String dato_dni = array[4].toString();
          var servicio = VisitaService();

          try {
            //PersonalElement visita = await servicio.getByDni(dato_dni);
            var bandera = await dataProvider.verificarProhibida(dato_dni);            
            if(bandera){
              print('LA BANDERA ES TRUE');
              print(dataProvider.data);
              dialog.dismiss();
              errorDialog.show();  
              showDialog(
                context: context, 
                builder: (context){
                    return AlertDialog(
                         title: Text('Motivo de la Prohibicion'),
                         content: Text(dataProvider.data),
                       );
                }
                );
              
            }else{
            
              dialog.dismiss();
              dialogAutorizado.show();
            }
            //Navigator.pushNamed(context, 'details', arguments: visita);
          } catch (e) {
            dialog.dismiss();
            errorDialog.show();
          }
        } catch (e) {
          barcodeScanRes = 'Failed to get platform version.';
        }
      },
      child: Icon(Icons.center_focus_strong),
    );
  }
}
