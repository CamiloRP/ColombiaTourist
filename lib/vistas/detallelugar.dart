import"package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:turistbogota/model/geo.dart';
import 'package:turistbogota/model/imagenescompletas.dart';
import 'package:turistbogota/vistas/googlemaps.dart';
import 'package:turistbogota/vistas/lugaresturisticos.dart';

import '../Boxes.dart';
import '../model/lugares.dart';
import '../model/lugaresfav.dart';
import 'imagencompleta1.dart';
import 'imagencompleta2.dart';
import 'listaguias.dart';

class DetalleLugar extends StatefulWidget {
  final Lugares lugares;
  const DetalleLugar(this.lugares, {Key? key}) : super(key: key);

  @override
  State<DetalleLugar> createState() => _DetalleLugarState();
}

class _DetalleLugarState extends State<DetalleLugar> {

  void _favoritos()async{
    var lugfavorito = LugaresFav()
      ..nombre_guia = widget.lugares.nombre_guia
      ..lugar = widget.lugares.lugar
      ..zona = widget.lugares.zona;

    final box = Boxes.getfavoritosbox();
    box.add(lugfavorito);
  }
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title:Text("Lugares Turisticos"),
              leading: IconButton(icon: Icon(Icons.arrow_back),
              onPressed: ()=> Navigator.pop(context, false)
              ),
            ),
             body:Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(0,1),
                  colors:[
                    Colors.yellowAccent,
                    Color.fromARGB(150, 255, 0, 0)
                  ]
                )
              ),
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            child:Text(widget.lugares.lugar,
                              style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30,
                                fontFamily: 'Titulo', color: Colors.red,
                              ),
                            )
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Image.network(
                            widget.lugares.imagen
                        )
                        ),
                        IconButton(
                            icon: Icon(Icons.favorite),
                            color: Colors.white,
                          onPressed: (){

                              Fluttertoast.showToast(msg: "Tu favorito",
                              toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
                              print("favorito");
                              _favoritos;
                          },
                        ),

                        _cartaCandelaria(),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(widget.lugares.descripcion2,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                            textAlign: TextAlign.justify,
                          )

                        ),
                        ListTile(
                          title: Container(
                              alignment: Alignment.center,
                              color: Colors.transparent,
                              width: 150,

                              child: Text(widget.lugares.direccion,
                              style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Colors.yellowAccent
                              ),
                              )
                          ),
                          subtitle: Text("Toque la imagen para ver el mapa:",
                          style: TextStyle(

                          ),
                          textAlign: TextAlign.center,
                          ),
                          onTap: (){
                            DatosGeolocalizacion loc = DatosGeolocalizacion(double.parse(widget.lugares.longitud), double.parse(widget.lugares.latitud), widget.lugares.direccion);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Geolocalization(loc)));
                          },
                        ),
                        Container(
                          width: 350,
                            height: 350,
                            margin: EdgeInsets.only(bottom: 20),

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(160),
                            child:GestureDetector(

                              child: Image.network(widget.lugares.imagen4,
                              fit: BoxFit.cover
                              ),

                              onTap:(){
                                DatosGeolocalizacion loc = DatosGeolocalizacion(double.parse(widget.lugares.longitud), double.parse(widget.lugares.latitud), widget.lugares.direccion);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Geolocalization(loc)));
                          }
                            )
                            )
                        ),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 10
                          ),
                          child: Text("Obtener guia turistico", style:
                          TextStyle(
                            fontSize: 23, fontFamily: "Contenido",
                            color: Colors.red,
                          ),
                        ),
                        onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ListaGuias()));
                        },

                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    )
                )

            )
        )
    );
  }
  Widget _cartaCandelaria(){
    return Card(
      elevation: 0,
      color: Colors.transparent,
        child: Container(

          padding: EdgeInsets.all(8),
          width: 400,
          color: Colors.transparent,
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    width: 160,
                    child: Text('Descripción', style: TextStyle(
                      fontFamily: 'Titulo', fontSize: 22,
                    ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    color: Colors.transparent,
                    width: 150,
                    child: Text(widget.lugares.descripcion1,
                    style: TextStyle(
                    fontSize: 17
                    ),
                      textAlign: TextAlign.justify,
                    )
                    ),

                ],

              ),
              Column(
                children: [
                  GestureDetector(
                   child: Container(

                    color: Colors.transparent,
                    margin: EdgeInsets.only(left: 5),
                    width: 190,
                    height: 180,
                    child: Image.network(widget.lugares.imagen2,

                      ),

                    ),
                    onTap:(){
                    ImagenesCompletas Imag = ImagenesCompletas(widget.lugares.imagen2, widget.lugares.lugar, widget.lugares.imagen3);
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>ImagenCompleta1(Imag)));
    }
                    ),

                  GestureDetector(
                    child: Container(
                        width: 190,
                        height: 150,
                      color: Colors.transparent,
                      child: Image.network(widget.lugares.imagen3)

                    ),
                      onTap:(){
                        ImagenesCompletas Imag = ImagenesCompletas(widget.lugares.imagen2, widget.lugares.lugar, widget.lugares.imagen3);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ImagenCompleta2(Imag)));
                      }
                  )
                ],
              ),
            ],
          ),

        )
    );
  }
}

