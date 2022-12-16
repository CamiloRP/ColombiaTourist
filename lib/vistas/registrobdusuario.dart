import'package:flutter/material.dart';
import'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:turistbogota/repository/registrousuariofirebase.dart';
import 'package:turistbogota/vistas/tituloprincipal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turistbogota/vistas/vistalogin.dart';

import '../model/usuario.dart';

class RegistroBDUsuario extends StatefulWidget {
  final idusuario;
  const RegistroBDUsuario(this.idusuario,{Key? key}) : super(key: key);

  @override
  State<RegistroBDUsuario> createState() => _RegistroBDUsuarioState();
}

class _RegistroBDUsuarioState extends State<RegistroBDUsuario> {
  RegistroUsuarioFirebase objUsuarioFB = RegistroUsuarioFirebase();
  final _nombre= TextEditingController();
  final _apellido= TextEditingController();
  final _correo= TextEditingController();
  final _celular= TextEditingController();
  void _registrarUsuario(Usuario usuario)async{
    var resultado = await objUsuarioFB.crearUsuario(usuario);
    Fluttertoast.showToast(msg: 'Datos guardados exitosamente',
        toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Guadalupe2.jpg'),
            fit: BoxFit.cover,
          )
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          child: Center(
            child:SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    child: Titulo(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
                    child: Text("Complete su registro",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: "Contenido",
                      fontSize: 28, color: Colors.red
                    ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _nombre,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:'Nombre'
                    )
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _apellido,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                          labelText: 'apellido'
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _correo,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo',

                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _celular,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Celular'
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      textStyle: TextStyle(fontSize: 15),
                    ),
                    onPressed: (){
                    final idusuario = widget.idusuario;
                      var usuario = Usuario(idusuario, _nombre.text, _apellido.text, _correo.text, _celular.text);
                      _registrarUsuario(usuario);
                    },
                    child: Text("Registrate"),
                    ),
                ]
              )
            )
          )
        )
      ),
      )
    );
  }
}
