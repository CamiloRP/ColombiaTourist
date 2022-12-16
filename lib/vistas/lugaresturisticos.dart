

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:turistbogota/vistas/detallelugar.dart';
import 'package:turistbogota/vistas/drawablemenu.dart';
import 'package:turistbogota/vistas/vistalogin.dart';

import '../model/lugares.dart';

class lugaresturisticos extends StatefulWidget {
  const lugaresturisticos({Key? key}) : super(key: key);

  @override
  State<lugaresturisticos> createState() => _LugaresTuristicosState();
}
    enum Menu{logout}


class _LugaresTuristicosState extends State<lugaresturisticos> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment(0,1),
            colors: [
              Colors.yellowAccent,
              Color.fromARGB(150, 255, 0, 0)
            ]
          ),
        ),

        child: Scaffold(
          appBar: AppBar(

            title: Text("Lugares turisticos Bogota"),
            backgroundColor: Color.fromARGB(150, 255, 0, 0),

            actions: [
              PopupMenuButton(
                onSelected: (Menu item){
                  setState(() {
                    if (item == Menu.logout){
                      FirebaseAuth.instance.signOut();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));

    }
                  });
    },
                itemBuilder: (BuildContext context)=><PopupMenuEntry<Menu>>[
                PopupMenuItem(value: Menu.logout,
                child: Text("Cerrar sesión")
    )
    ] ,
              )
            ],
          ),

          drawer: DrawableMenu(),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<QuerySnapshot>(
               stream:FirebaseFirestore.instance.collection("LugaresTuristicos").snapshots(),
               builder:(context,snapshot) {
                if (snapshot.hasError) {
                  return Text("Error en la consulta");
                }
                if (!snapshot.hasData) {
                  return Text("No existen datos");
                }


                child:
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      QueryDocumentSnapshot LugaresTuristicosBD = snapshot.data!
                          .docs[index];

                      return Card(
                        child: Column(
                          children:[
                            Container(
                              margin: EdgeInsets.only(bottom: 8, top: 8),

                              child: ListTile(

                                title: Text(LugaresTuristicosBD ["lugar"],
                                  style: TextStyle(fontSize: 22),),
                                subtitle: Text("Zona: "+LugaresTuristicosBD["zona"]+"\n"+
                                    "direccion: "+LugaresTuristicosBD['direccion']+"\n"+
                                    ""),
                                leading: Image.network(LugaresTuristicosBD["imagen"]
                                ),
                               onTap: (){
                                  Lugares lugares = Lugares(LugaresTuristicosBD["nombre_guia"],
                                      LugaresTuristicosBD["apellido_guia"],LugaresTuristicosBD["correo"],
                                      LugaresTuristicosBD["celular"], LugaresTuristicosBD["lugar"],
                                      LugaresTuristicosBD["zona"], LugaresTuristicosBD["descripcion1"],
                                      LugaresTuristicosBD["imagen"], LugaresTuristicosBD["imagen2"],
                                      LugaresTuristicosBD["direccion"], LugaresTuristicosBD["latitud"],
                                      LugaresTuristicosBD["longitud"], LugaresTuristicosBD["imagen3"],
                                      LugaresTuristicosBD["imagen4"], LugaresTuristicosBD["descripcion2"]);

                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetalleLugar(lugares)));
                               }
                            ),
                          ),

                        ]
                        ),
                      );
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 5),
                        child: ListTile(
                          title: Text('Monserrate'),
                          subtitle: Text('Contenido'),
                          leading: Icon(
                            Icons.add_location_alt_sharp,
                            color: Colors.green,
                          ),
                        ),
                      );
                    }
                );
              }
          ),
      )
      ),
    ),
    );
  }
}
