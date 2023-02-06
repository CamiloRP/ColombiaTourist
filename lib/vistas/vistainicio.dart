
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:turistbogota/vistas/drawablemenu.dart';
import 'package:turistbogota/vistas/registro.dart';
import 'package:turistbogota/vistas/somos.dart';
import 'package:turistbogota/vistas/vistalogin.dart';

import 'ciudades.dart';
import 'mainviewenglish.dart';


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
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/BanderaColombiaMadera.jpg'),
                  fit: BoxFit.cover
              )
          ),

          child: Scaffold(

              backgroundColor: Colors.transparent,
              appBar: AppBar(

                title: Text("Categoria"),
                backgroundColor: Color.fromARGB(150, 255, 0, 0),


                    actions: [
                      if (FirebaseAuth.instance.signInWithEmailAndPassword(email: "usu", password: "cla")==true)
                        PopupMenuButton(

                          onSelected: (Menu item) {
                            setState(() {
                              if (item == Menu.logout) {
                                FirebaseAuth.instance.signOut();
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Login()));
                              }
                            });
                          },
                          itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<Menu>>[
                            PopupMenuItem(value: Menu.logout,
                                child: Text("Cerrar sesión")
                            )
                          ],
                        )

                    ],

              ),
              drawer: DrawableMenu(),


              body: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                          margin: EdgeInsets.only(bottom: 0),
                          width: 50,
                          height: 50,
                          child: FadeInImage(placeholder: AssetImage("images/Bandera.png"), image: AssetImage("images/Bandera.png"))
                      ),
                      ElevatedButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.red
                          ),
                          child: Text("Switch to English",
                            textAlign: TextAlign.center, style: TextStyle(
                                fontSize: 17
                            ),
                          ),

                          onPressed  : (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MainViewEnglish()));
                          }

                      ),

                      Container(

                          margin: EdgeInsets.only(top:5, left: 30, right: 30),
                          color: Colors.white,
                          child: Row(

                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 48),
                                child: Column(
                                  children: [
                                    IconButton(

                                      icon: Icon(Icons.account_tree_rounded),
                                      color: Colors.yellow,
                                      iconSize: 45,

                                      onPressed: () {
                                        Fluttertoast.showToast(
                                            msg: "Categorias",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER);
                                        print("Categorias");
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VistaInicio()));
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
                                margin: EdgeInsets.only(left: 33, right: 33),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.home_work),
                                      color: Colors.yellow,
                                      iconSize: 45,
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Ciudades()));
                                        Fluttertoast.showToast(msg: "ciudades",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER);
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

                                      onPressed: () {
                                        Fluttertoast.showToast(msg: "Guardados",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER);
                                        print("Guardados");
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VistaInicio()));
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
                        height: 10,
                      ),
                      Expanded(

                        child: SingleChildScrollView(
                          child: SizedBox(
                            height: 550,
                            child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance.collection(
                                    "Categorias").snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Text("Error en la consulta");
                                  }
                                  if (!snapshot.hasData) {
                                    return Text("No existen datos");
                                  }
                                  return GridView.builder(
                                      itemCount: snapshot.data?.docs.length,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 3.0,
                                          mainAxisSpacing: 3.0
                                      ),
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        QueryDocumentSnapshot CategoriasBD = snapshot
                                            .data!
                                            .docs[index];
                                        return Card(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                GestureDetector(

                                                    child: Container(
                                                      height: 75,
                                                      width: 75,
                                                      child: Image.network(
                                                          CategoriasBD["Imagen"]),

                                                    ),
                                                    onTap: () {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 120,
                            margin: EdgeInsets.only( bottom: 20),
                            child: BotonUno(),
                          ),
                          Container(
                            height: 50,
                            width: 120,
                            margin: EdgeInsets.only( bottom: 20, left: 4, right: 4),
                            child: BotonDos(),
                          ),
                          Container(
                            height: 50,
                            width: 120,
                            margin: EdgeInsets.only( bottom: 20),
                            child: BotonTres(),
                          )
                        ],
                      )
                    ],

                  ),


                ),
              )

          ),
        )

    );
  }


  Widget BotonUno() {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
      ),
      child: Text("Somos",
        style: TextStyle(
            fontFamily: "contenido", fontSize: 24, color: Colors.white),
      ),
      onPressed: () {
        print('Boton somos');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Somos()));
      },
    );
  }

  Widget BotonDos() {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
      ),
      child: Text("Ingresa",
        style: TextStyle(
            fontFamily: "contenido", fontSize: 24, color: Colors.white),
      ),
      onPressed: () {
        print('Boton ingresa');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      },
    );
  }

  Widget BotonTres() {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
      ),
      child: Text("Registro",
        style: TextStyle(
            fontFamily: "contenido", fontSize: 24, color: Colors.white),
      ),
      onPressed: () {
        print('Boton registro');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Registro()));
      },
    );
  }
}