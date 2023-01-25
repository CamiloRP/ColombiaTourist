import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:turistbogota/vistas/drawablemenu.dart';
import 'package:turistbogota/vistas/vistalogin.dart';

import 'ciudades.dart';


class VistaInicio extends StatefulWidget {
  const VistaInicio({Key? key}) : super(key: key);

  @override
  State<VistaInicio> createState() => _VistaInicioState();
}

enum Menu{logout}

class _VistaInicioState extends State<VistaInicio> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(

        child: Scaffold(

          backgroundColor: Colors.transparent,
          appBar: AppBar(

            title: Text("Categoria"),
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


          body: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Container(

                        margin: EdgeInsets.only(top:5, left: 30, right: 30),
                        color: Colors.white,
                        child:Row(

                          children: [
                            Container(
                              margin:EdgeInsets.only(left: 48),
                              child: Column(
                                children: [
                                  IconButton(

                                    icon: Icon(Icons.account_tree_rounded),
                                    color: Colors.yellow,
                                    iconSize: 45,

                                    onPressed: (){

                                      Fluttertoast.showToast(msg: "Categorias",
                                          toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
                                      print("Categorias");
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VistaInicio()));

                                    },
                                  ),
                                  Text("Categoría", style: TextStyle(
                                      fontSize: 16
                                  ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left:33, right: 33),
                              child: Column(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.home_work),
                                    color: Colors.yellow,
                                    iconSize: 45,
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Ciudades()));
                                      Fluttertoast.showToast(msg: "ciudades",
                                          toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
                                    },
                                  ),
                                  Text("Ciudades", style: TextStyle(
                                      fontSize: 16
                                  ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  IconButton(

                                    icon: Icon(Icons.account_circle),
                                    color: Colors.yellow,
                                    iconSize: 45,

                                    onPressed: (){

                                      Fluttertoast.showToast(msg: "Guardados",
                                          toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
                                      print("Guardados");
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VistaInicio()));

                                    },
                                  ),
                                  Text("Guardados", style: TextStyle(
                                      fontSize: 16
                                  ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(

                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: 600,
                          child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance.collection("Categorias").snapshots(),
                              builder: (context, snapshot){
                                if (snapshot.hasError){
                                  return Text("Error en la consulta");
                                }
                                if (!snapshot.hasData){
                                  return Text("No existen datos");
                                }
                                return GridView.builder(
                                    itemCount: snapshot.data?.docs.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 3.0,
                                      mainAxisSpacing: 3.0
                                    ),
                                    itemBuilder: (BuildContext context, int index){
                                      QueryDocumentSnapshot CategoriasBD = snapshot.data!
                                          .docs[index];
                                    return Card(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(

                                              child: Container(
                                                height: 75,
                                                width: 75,
                                                child: Image.network(CategoriasBD["Imagen"]),

                                              ),
                                            onTap: (){
                                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                                      }
                                            ),

                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(CategoriasBD["Categoria"],
                                          textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16
                                            ),
                                          )
                                        ],
                                      )
                                    );

                                    }
                                );
                              }
                          ),
                        ),
                      ),
                    ),

                  ],

                ),


                ),
            )

    ),
      )

    );



  }
}
