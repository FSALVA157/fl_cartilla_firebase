import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
   
  const ListScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: StreamBuilder (
            stream:  FirebaseFirestore.instance.collection('prohibidas').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
              if (!snapshot.hasData){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<DocumentSnapshot> docs = snapshot.data!.docs;
              return ListView.separated(
                itemBuilder: (_, int index){
                  String nombre = "${docs.elementAt(index).get('apellido')} ${docs.elementAt(index).get('nombre')}";
                  String motivo = "${docs.elementAt(index).get('motivo')}";
                  //String dni = "${docs.elementAt(index).get('id')}";
                  String categoria = "${docs.elementAt(index).get('categoria')}";
                  //otra manera de obtener el documento
                  //Map<String, dynamic>? docData = snapshot.data!.docs[index].data();

                  return ListTile(
                    title: Text(nombre, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    subtitle: Text('39012541'),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context){
                            return AlertDialog(
                              shape:  RoundedRectangleBorder(borderRadius:  BorderRadiusDirectional.circular(15)),
                              title:  const  Text('ACCESO PROHIBIDO'),
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
            ),        
    );
  }
}