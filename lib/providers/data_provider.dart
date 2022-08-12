
import 'package:cartilla_firebase_fl/services/prohibidas_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class DataProvider extends ChangeNotifier{

  late Stream<QuerySnapshot<Map<String, dynamic>>> listStream;
  late Query<Map<String, dynamic>> selectedPerson;
  final service = ProhibidasService();

  DataProvider(){
    this.cargarLista();
  }

  cargarLista() async{
    this.listStream = await service.getLista();    
  }

  Future<bool> verificarProhibida(String dni)async {
    return await this.service.verificar(dni);
  }



}