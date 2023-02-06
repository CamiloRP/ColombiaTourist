import 'package:cloud_firestore/cloud_firestore.dart';
import'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:turistbogota/vistas/drawablemenu.dart';
import 'package:turistbogota/vistas/vistainicio.dart';

import 'lugaresturisticos.dart';

class Ciudades extends StatefulWidget {
  const Ciudades({Key? key}) : super(key: key);

  @override
  State<Ciudades> createState() => _CiudadesState();
}

class _CiudadesState extends State<Ciudades> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage("images/BanderaColombiaMadera.jpg"),
            fit: BoxFit.cover,
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Ciudades en Colombia"),
            backgroundColor: Color.fromARGB(150, 255, 0, 0),
          ),

            drawer: DrawableMenu(),

            body: Padding(
              padding: EdgeInsets.all(20),
               child: Container(
                 height: MediaQuery.of(context).size.height,
                 width: MediaQuery.of(context).size.width,
                 child: Column(
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
                                       Fluttertoast.showToast(msg: "Ciudades",
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
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Ciudades()));
                                       Fluttertoast.showToast(msg: "Guardados",
                                           toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
                                       print("Guardados");
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>lugaresturisticos()));

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
                               stream: FirebaseFirestore.instance.collection("Ciudades").snapshots(),
                               builder: (context, snapshot){
                                 if (snapshot.hasError){
                                   return Text("Error en la consulta");
                                 }
                                 if (!snapshot.hasData){
                                   return Text("No existen datos");
                                 }
                                 return ListView.builder(
                                     itemCount: snapshot.data?.docs.length,
                                     itemBuilder: (BuildContext context, int index){
                                       QueryDocumentSnapshot CiudadesBD = snapshot.data!
                                           .docs[index];
                                       return Card(
                                           child: Column(

                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               GestureDetector(

                                                   child: Row(
                                                     children: [
                                                       Container(
                                                         margin: EdgeInsets.only(right: 15,left: 10),
                                                         height: 100,
                                                         width: 120,
                                                         child: Image.network(CiudadesBD["ImagenCiudad"]),

                                                         ),

                                                     Text(CiudadesBD["Ciudad"],
                                                       textAlign: TextAlign.center,
                                                       style: TextStyle(
                                                           fontSize: 22
                                                       ),
                                                     )
                                                     ],
                                                   ),
                                                   onTap: (){
                                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>lugaresturisticos()));
                                                   },



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
        )

    )
      );

  }
}
