
import 'package:cartilla_firebase_fl/providers/data_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaSearchDelegate extends SearchDelegate{


  @override
  List<Widget>? buildActions(BuildContext context) {
      return [
          IconButton(
            onPressed: () => query = "",
            icon: const Icon(Icons.close))
      ];
    
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.arrow_back_outlined));

  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Build Results");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
        print('LA QUERY ES: ${query}');
        final dataProvider = Provider.of<DataProvider>(context);
        if(query.isEmpty){
          return emptyContainer();
        }else{
          Stream<QuerySnapshot<Map<String, dynamic>>> resultado = dataProvider.filtrarLista(query);
          return fullContainer(resultado);
        }

  }

  Widget  emptyContainer(){
      return  Container(
      child:  const  Center(
      child:  Icon(Icons.movie_rounded, color:  Colors.yellowAccent,size:  100),
      ),);
    }


    Widget fullContainer(Stream<QuerySnapshot<Map<String, dynamic>>> resultado){
      
      return StreamBuilder (
            stream: resultado,
            builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
              if (!snapshot.hasData){
                return const Center(
                  child:  CircularProgressIndicator(),
                );
              }
              
              List<DocumentSnapshot> docs = snapshot.data!.docs;
              return ListView.separated(
                padding: EdgeInsets.all(20),
                itemBuilder: (_, int index){
                  String nombre = "${docs.elementAt(index).get('apellido')} ${docs.elementAt(index).get('nombre')}";
                  String motivo = "${docs.elementAt(index).get('motivo')}";
                  //String dni = "${docs.elementAt(index).id}";
                  String dni = "${docs.elementAt(index).get('dni')}";
                  String categoria = "${docs.elementAt(index).get('categoria')}";
                  //otra manera de obtener el documento
                  //Map<String, dynamic>? docData = snapshot.data!.docs[index].data();

                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    title: Text(nombre, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold )),
                    subtitle: Text(dni, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context){
                            return AlertDialog(
                              shape:  RoundedRectangleBorder(borderRadius:  BorderRadiusDirectional.circular(15)),
                              title:  const Text('ACCESO PROHIBIDO'),
                              content:  Column(
                              mainAxisSize:  MainAxisSize.min,
                              children:   [
                              Text(motivo),
                              SizedBox(),
                              Image.asset('assets/stop.jpg', height: 50,)
                              //FlutterLogo(size:  50,)
                              ],

                            ));
                        }
                        );
                    },
                  );
                },
                 separatorBuilder: (_, __){
                  return const Divider(color: Colors.white,);
                 },
                 itemCount: docs.length
                 );
            }
            );        
    }

}