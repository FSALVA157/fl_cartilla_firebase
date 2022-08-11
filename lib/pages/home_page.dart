import 'package:cartilla_firebase_fl/providers/dni_provider.dart';
import 'package:cartilla_firebase_fl/services/prohibidas_service.dart';
import 'package:cartilla_firebase_fl/widgets/fondo_bienvenida.dart';
import 'package:cartilla_firebase_fl/widgets/scan_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customProvider = Provider.of<DniProvider>(context);
    String dataDni = customProvider.dniNumero;
    bool bandera = (dataDni == "") ? false : true;
    final servicio = ProhibidasService();
    servicio.getLista();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cartilla Virtual'),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'list');
          }, icon: Icon(Icons.list_alt))
        ],
      ),
      body: bandera ? DataDNI() : FondoBienvenida(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class DataDNI extends StatelessWidget {
  const DataDNI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final miProvider = Provider.of<DniProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.0),
            child: Text(
              'Datos Recuperados desde el Código del DNI',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              maxLines: 2,
            ),
          ),
          MiTexto(texto: 'NUMERO DE DOCUMENTO: ', texto2: miProvider.dniNumero),
          MiTexto(texto: 'APELLIDO: ', texto2: miProvider.dniApellido),
          MiTexto(texto: 'NOMBRE: ', texto2: miProvider.dniNombre),
          MiTexto(texto: 'NUMERO DE TRAMITE: ', texto2: miProvider.dniTramite),
          MiTexto(texto: 'EJEMPLAR DNI: ', texto2: miProvider.dniEjemplar),
          MiTexto(
              texto: 'FECHA DE NACIMIENTO: ', texto2: miProvider.dniNacimiento),
          MiTexto(
              texto: 'FECHA DE EMISION DEL DNI: ',
              texto2: miProvider.dniFechaTramite),
        ],
      ),
    );
  }
}

class MiTexto extends StatelessWidget {
  final String texto;
  final String texto2;

  const MiTexto({Key? key, required this.texto, required this.texto2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                this.texto,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.left,
                overflow: TextOverflow.visible,
                maxLines: 2,
              ),
            ),
            // Expanded(
            //     child: SizedBox(
            //   width: 5,
            // )),
            Expanded(
              flex: 3,
              child: Text(
                this.texto2,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.left,
                overflow: TextOverflow.visible,
                maxLines: 2,
              ),
            ),
          ],
        ));
  }
}
