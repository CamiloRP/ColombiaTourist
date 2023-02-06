import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:turistbogota/vistas/drawablemenu.dart';
import 'package:turistbogota/vistas/vistainicio.dart';
import 'package:turistbogota/vistas/vistalogin.dart';
import 'package:turistbogota/vistas/vistaprincipal.dart';

import 'lugaresturisticos.dart';

class PerfilUsuario extends StatefulWidget {
  final dk;
  const PerfilUsuario(this.dk, {Key? key}) : super(key: key);

  @override
  State<PerfilUsuario> createState() => _PerfilUsuarioState();
}
enum Menu{logout}
class _PerfilUsuarioState extends State<PerfilUsuario> {

  @override
  Widget build(BuildContext context) {
    var key = widget.dk;
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
            title: Text("BogotaTurist"),
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
        body:Padding(
          padding: EdgeInsets.all(8),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("usuario").where('id',isEqualTo: key).snapshots(),
            builder:(context,snapshot){
              print('kkkkk ${key}');
              if (snapshot.hasError){
                return Text("Error en la consulta");
        }
              if (!snapshot.hasData){
                return Text('No existen datos');
        }
              else{

                return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index){
                  QueryDocumentSnapshot usuarioFB = snapshot.data!.docs[index];
                  return Column(
                    children: [
                      Card(
                        margin: EdgeInsets.only(top:30),
                        elevation: 2,
                        color: Colors.green,
                        child: ListTile(

                          title: Text("Bienevnido "+ usuarioFB['nombre']+" "+ usuarioFB ['apellido'],
                          style: const TextStyle(
                            fontFamily: "Titulo",
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                          subtitle: Text(usuarioFB['correo']+ "\n"+ usuarioFB["celular"]),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>VistaInicio()));
                          },
                        )
                      ),
                    ],
                  );
        }
        );
        }
        }
          )
        )
      )
    );
  }
}
