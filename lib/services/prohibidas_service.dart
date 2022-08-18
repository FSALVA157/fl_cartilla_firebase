import 'package:cloud_firestore/cloud_firestore.dart';

class ProhibidasService{
  late Stream<QuerySnapshot<Map<String, dynamic>>> listado;
  final listaRef = FirebaseFirestore.instance.collection('prohibidas');
  late List<QueryDocumentSnapshot<Map<String, dynamic>>> lista_filtrada=[];

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getLista() async{
    this.listado = await listaRef.orderBy('apellido').snapshots();
    
    return this.listado;
  }

   Future<String> verificar(String dni)async{       
    final res = listaRef.where('dni', isEqualTo: dni);    
    
    QuerySnapshot<Map<String, dynamic>>? data = await res.get().then((value) {
      final tamanio = value.docs.length;
    
      if(tamanio != 0){        
          //print('EL ARRAY TIENE $tamanio');
          return value;        
       }else{
          return null;
       }
    });
    if(data != null){
        return data.docs[0].get('motivo');
    }else {
      return "";
    }
    
    
  }

  
   buscarPorDNI(String dni){
      this.listaRef.where('dni', isEqualTo: dni).get().then(
      (value){
        print('la respuesta tiene: ${value.size}');
        this.lista_filtrada =  value.docs;
      },        
        onError: (e)=>print("se ha producido en error en la consulta $e"),
      );       
      return this.lista_filtrada;
  }
  


}