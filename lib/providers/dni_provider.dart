import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:provider/provider.dart';

class DniProvider extends ChangeNotifier {
  String dniNumero = "";
  String dniTramite = "";
  String dniNacimiento = "";
  String dniFechaTramite = "";
  String dniApellido = "";
  String dniNombre = "";
  String dniSexo = "";
  String dniEjemplar = "";

  getData(List<String> datos) {
    this.dniTramite = datos[0];
    this.dniApellido = datos[1];
    this.dniNombre = datos[2];
    this.dniSexo = datos[3];
    this.dniNumero = datos[4];
    this.dniEjemplar = datos[5];
    this.dniNacimiento = datos[6];
    this.dniFechaTramite = datos[7];

    notifyListeners();
  }
}
