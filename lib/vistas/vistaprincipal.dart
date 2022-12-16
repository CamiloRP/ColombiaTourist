import 'package:turistbogota/vistas/registrobdusuario.dart';
import 'package:turistbogota/vistas/somos.dart';
import 'package:turistbogota/vistas/tituloprincipal.dart';
import 'package:turistbogota/vistas/vistalogin.dart';
import 'package:turistbogota/vistas/registro.dart';
import 'package:flutter/material.dart';

import 'mainviewenglish.dart';

class VistaPrincipal extends StatefulWidget {
  const VistaPrincipal({Key? key}) : super(key: key);

  @override
  State<VistaPrincipal> createState() => _VistaPrincipalState();
}

class _VistaPrincipalState extends State<VistaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child:Scaffold(
          backgroundColor: Colors.transparent,
          body:SingleChildScrollView(
            child: Container(

              height: 940,
              decoration: BoxDecoration(
              image: DecorationImage(
              image:AssetImage('images/bogota1.jpg'),
                fit: BoxFit.cover
              )
              ),
              child: Column(
              children: [
                  Container(
                    child: Titulo(),
                  ),

                Container(
                  //color: Colors.red,
                  height: 100,
                  width: 160,
                  margin: EdgeInsets.only(top: 50, bottom: 10),
                  child: BotonUno(),

            ),
                Container(
                  //color: Colors.blue,
                  height: 100,
                  width: 160,
                  margin: EdgeInsets.only(bottom: 10),
                  child: BotonDos(),
                ),
                Container(
                  //color: Colors.yellow,
                  height: 100,
                  width: 160,
                  margin: EdgeInsets.only(bottom: 10),
                  child: BotonTres(),
                ),
                SizedBox(height: 70,),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue
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
                  width: 50,
                  height: 50,
                  child: FadeInImage(placeholder: AssetImage("images/Bandera.png"), image: AssetImage("images/Bandera.png"))
                )
                ]
        ),
        )
      ),
      )
      )
    );
  }

  ElevatedButton BotonUno() {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,

      ),
      child: Text('Somos',
        style: TextStyle(
          fontFamily: 'contenido',
          fontSize: 28,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        print('Boton somos');
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Somos()));
      },
    );
  }

  ElevatedButton BotonDos(){
    return ElevatedButton(
      style: TextButton.styleFrom(
       backgroundColor: Colors.transparent,
      ),
      child: Text('Ingresa',
      style: TextStyle(
        fontFamily: 'contenido',
        fontSize: 28,
        color: Colors.white,
      ),
      ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
        print('Ingreso');
      },
    );
    }

  ElevatedButton BotonTres (){
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
      ),
      child: Text('Registrate',
      style: TextStyle(
        fontFamily: 'contenido',
        fontSize: 28,
        color: Colors.white,
      ),
      ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Registro()));
        print('Registro');
      },
    );

  }
}
