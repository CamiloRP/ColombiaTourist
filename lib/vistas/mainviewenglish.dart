import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:turistbogota/vistas/drawablemenu.dart';
import 'package:turistbogota/vistas/somos.dart';
import 'package:turistbogota/vistas/tituloprincipal.dart';
import 'package:turistbogota/vistas/vistainicio.dart';
import 'package:turistbogota/vistas/vistalogin.dart';
import 'package:turistbogota/vistas/registro.dart';
import 'package:turistbogota/vistas/vistaprincipal.dart';

import 'ciudades.dart';
import 'drawablemenuingles.dart';

class MainViewEnglish extends StatefulWidget {
  const MainViewEnglish({Key? key}) : super(key: key);

  @override
  State<MainViewEnglish> createState() => _MainViewEnglishState();
}

enum Menu{logout}

class _MainViewEnglishState extends State<MainViewEnglish> {
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
             title: Text("Category"),
             backgroundColor: Color.fromARGB(150, 255, 0, 0),

             actions: [
               if (FirebaseAuth.instance.signInWithEmailAndPassword(email: "usu", password: "cla")==true)
               PopupMenuButton(
                 onSelected: (Menu item){
                   setState(() {
                     if (item == Menu.logout){
                       FirebaseAuth.instance.signOut();
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                     }
                   });
                 },
                 itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<Menu>>[
                  PopupMenuItem(value: Menu.logout,
                  child: Text("Cerrar sesión")
        )
                  ]
                   )
        ]
               ),
              drawer: DrawableMenuIngles(),
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
                  child:Column(

                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: FadeInImage(placeholder: AssetImage("images/Bandera.png"), image: AssetImage("images/Bandera.png"))
                      ),
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: Text("Cambiar a Español",
                          textAlign: TextAlign.center, style: TextStyle(
                              fontSize: 17
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>VistaInicio()));
                        },
                      ),
                      Container(
                          margin: EdgeInsets.only(top:5, left: 30, right: 30),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(

                              child:Column(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.account_tree_rounded),
                                    color: Colors.yellow,
                                    iconSize: 45,
                                    onPressed: (){
                                      Fluttertoast.showToast(msg: "Category",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER);
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=>VistaInicio()));
                                    },
                              ),
                                Text("Category",
                                style: TextStyle(
                                    fontSize: 16
                                ),
                                )
                                ],
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 33, right: 33),
                              child: Column(
                                children: [
                                  IconButton(
                                      onPressed: (){
                                        Fluttertoast.showToast(msg: "Cities",
                                        toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER
                                        );
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Ciudades()));

                                  },
                                      icon: Icon(Icons.home_work),
                                      color: Colors.yellow,
                                      iconSize: 45,
                                  ),
                                  Text("Cities",
                                  style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                            Container(

                              child: Column(
                                children: [
                                  IconButton(
                                    onPressed: (){
                                      Fluttertoast.showToast(msg: "Saved",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER
                                      );
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VistaInicio()));

                                    },
                                    icon: Icon(Icons.home_work),
                                    color: Colors.yellow,
                                    iconSize: 45,
                                  ),
                                  Text("Saved",
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            )
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
                                stream: FirebaseFirestore.instance.collection("Category").snapshots(),
                                builder: (context, snapShot) {
                                  if (snapShot.hasError) {
                                    return Text("Console Error");
                                  }
                                  if (!snapShot.hasData) {
                                    return Text("No Data");
                                  }
                                  return GridView.builder(
                                      itemCount: snapShot.data?.docs.length,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 3,
                                        mainAxisSpacing: 0,
                                      ),

                                      itemBuilder: (context, index) {
                                        QueryDocumentSnapshot CategoryDB =
                                        snapShot.data!.docs[index];

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
                                                          CategoryDB["Imagen"]),

                                                    ),
                                                    onTap: () {
                                                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                                                    }
                                                ),

                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(CategoryDB["Categoria"],
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
                      )
                      )
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
      child: Text("About us",
        style: TextStyle(
            fontFamily: "contenido", fontSize: 24, color: Colors.white),
      ),
      onPressed: () {
        print('About us');
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
      child: Text("Log in",
        style: TextStyle(
            fontFamily: "contenido", fontSize: 24, color: Colors.white),
      ),
      onPressed: () {
        print('Log in');
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
      child: Text("Register",
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
