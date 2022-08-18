
import 'package:cartilla_firebase_fl/services/prohibidas_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class DataProvider extends ChangeNotifier{

  late Stream<QuerySnapshot<Map<String, dynamic>>> listStream;
  late QueryDocumentSnapshot<Map<String, dynamic>> selectedPerson;
  late String data;
  final service = ProhibidasService();
  late List<QueryDocumentSnapshot<Map<String, dynamic>>> listaXdni;

  DataProvider(){
    this.cargarLista();
  }

  cargarLista() async{
    this.listStream = await service.getLista();    
  }

  Future<bool> verificarProhibida(String dni) async{
     var info = await this.service.verificar(dni).then((value) {
         return value;
     });
     
     if(info != ""){
        this.data = info;
        return true;
     }else{
      return false;
     }
  }

   filtrarLista(String dni) {
      this.listaXdni = this.service.buscarPorDNI(dni);
      return this.listaXdni;
      //notifyListeners();
  }



}