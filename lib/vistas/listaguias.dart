

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:turistbogota/vistas/detallelugar.dart';
import 'package:turistbogota/vistas/drawablemenu.dart';
import 'package:turistbogota/vistas/vistalogin.dart';

import '../model/guias.dart';
import '../model/lugares.dart';
import 'detalleguia.dart';
import 'lugaresturisticos.dart';

class ListaGuias extends StatefulWidget {
  const ListaGuias({Key? key}) : super(key: key);

  @override
  State<ListaGuias> createState() => _ListaGuiasState();
}

class _ListaGuiasState extends State<ListaGuias> {
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
              automaticallyImplyLeading: false,
              title: Text("Guias turisticos Bogota"),
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
              leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed: ()=> Navigator.pop(context, true),
              ),
            ),


            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<QuerySnapshot>(
                  stream:FirebaseFirestore.instance.collection("GuiasTuristicos").snapshots(),
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
                          QueryDocumentSnapshot GuiasTuristicosBD = snapshot.data!
                              .docs[index];

                          return Card(
                            child: Column(
                                children:[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8, top: 8),

                                    child: ListTile(

                                        title: Text(GuiasTuristicosBD ["nombre_guia"],
                                          style: TextStyle(fontSize: 22),),
                                        subtitle: Text("celular: "+GuiasTuristicosBD["celular"]+"\n"+
                                            "correo: "+GuiasTuristicosBD['correo']+"\n"+
                                            "edad: "+GuiasTuristicosBD['edad']),
                                        leading: Image.network(GuiasTuristicosBD["foto"]
                                        ),
                                        onTap: (){
                                          Guias guias = Guias(GuiasTuristicosBD["celular"],
                                              GuiasTuristicosBD["correo"],GuiasTuristicosBD["edad"],
                                              GuiasTuristicosBD["idiomas"], GuiasTuristicosBD["nombre_guia"],
                                              GuiasTuristicosBD["foto"]
                                             );

                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetalleGuia(guias)));
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
