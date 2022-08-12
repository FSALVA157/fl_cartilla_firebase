
import 'package:cloud_firestore/cloud_firestore.dart';

class ProhibidasService{
  late Stream<QuerySnapshot<Map<String, dynamic>>> listado;
  final listaRef = FirebaseFirestore.instance.collection('prohibidas');

  getLista() async{
    this.listado = await listaRef.orderBy('apellido').snapshots();
    
    return this.listado;
  }

  Future<bool> verificar(String dni)async{    
    
    
    final res = listaRef.where('dni', isEqualTo: dni);    
    
    bool bandera = await res.get().then((value) {
      final tamanio = value.docs.length;
      if(tamanio != 0){        
        print('EL ARRAY TIENE $tamanio');
      //datos =  value.docs[0].data();
      return true;      
       }else{
        return false;
       }
    });

    return bandera;
    
  }

  

}