import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cartilla_firebase_fl/models/personal_response.dart';

class VisitaService {
  String _baseURL = 'servidorcuerpospps.herokuapp.com';

  //var url = Uri.https(_baseURL, );
  getByDni(String numero) async {
    //String dni_aux = numero.toString();
    var url = Uri.https(this._baseURL, '/personal/dni', {'dni': numero});
    final respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      var obj = json.decode(respuesta.body);
      PersonalElement visita = PersonalElement.fromMap(obj['data']);

      return visita;
    }

    return {'message': "Persona no empadronada en el Sistema de Visitas"};
  }
}
