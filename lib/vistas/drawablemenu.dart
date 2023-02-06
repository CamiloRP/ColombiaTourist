import'package:flutter/material.dart';
import 'package:turistbogota/vistas/listarfavoritos.dart';
import 'package:turistbogota/vistas/somos.dart';
import 'package:turistbogota/vistas/vistainicio.dart';
import 'package:turistbogota/vistas/vistaprincipal.dart';

class DrawableMenu extends StatefulWidget {
  const DrawableMenu({Key? key}) : super(key: key);

  @override
  State<DrawableMenu> createState() => _DrawableMenuState();
}

class _DrawableMenuState extends State<DrawableMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfff32e20), Color(0xffffe714)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          )
        ),
            child: Column(
            children: [
              Container(
              width: 180,
              height: 180,
              margin: EdgeInsets.only(top: 30, bottom: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: FadeInImage(
                placeholder: AssetImage('images/LogoColombiaTourist.png'),
                image: AssetImage('images/LogoColombiaTourist.png')
              )
            )
            ),
             Text('Navegador', style: TextStyle(
               shadows: [
                 Shadow(
                   offset: Offset(0,3),
                       blurRadius: 11,
                   color: Colors.red
                 )
               ],
               fontSize: 26,
             )
             ),
             GestureDetector(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 5, top: 10),
                padding: EdgeInsets.all(10),
                color: Color.fromARGB(250, 250, 250, 250),
                child: Text("Inicio", style: TextStyle(
                fontSize: 24, fontFamily: "Contenido"
                ),
                ),
              ),
                  onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>VistaInicio()));
                  }
            ),
              GestureDetector(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 5, top: 10),
                    padding: EdgeInsets.all(10),
                    color: Color.fromARGB(250, 250, 250, 250),
                    child: Text("Somos", style: TextStyle(
                        fontSize: 24, fontFamily: "Contenido"
                    ),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Somos()));
                  }
            ),
             GestureDetector(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 5, top: 10),
                  padding: EdgeInsets.all(10),
                  color: Color.fromARGB(250, 250, 250, 250),
                  child: Text("Mis lugares Favoritos", style: TextStyle(
                      fontSize: 24, fontFamily: "Contenido"
                  ),
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ListaFavoritos()));
                }
            ),
          ],
      )
      ),
    );
  }
}
