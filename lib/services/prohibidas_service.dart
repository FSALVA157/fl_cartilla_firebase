
import 'package:cloud_firestore/cloud_firestore.dart';

class ProhibidasService{
  late Stream<QuerySnapshot<Map<String, dynamic>>> listado;

  getLista() async{
    this.listado = await FirebaseFirestore.instance.collection('prohibidas').snapshots();
    print(this.listado);
    return listado;
  }

}