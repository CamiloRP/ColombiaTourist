import 'package:flutter/material.dart';

import '../model/guias.dart';
import 'calendario.dart';

class DetalleGuia extends StatefulWidget {
  final Guias guias;
  const DetalleGuia(this.guias, {Key? key}) : super(key: key);

  @override
  State<DetalleGuia> createState() => _DetalleGuiaState();
}

class _DetalleGuiaState extends State<DetalleGuia> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(

        appBar: AppBar(
          title: Text("Detalles del Guia"),
          automaticallyImplyLeading: true,
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: ()=> Navigator.pop(context, false),
      ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Container(

            child: Column(
              children: [
                Container(
                  child: Image.network(widget.guias.foto),

            ),
                Container(
                 child: Text(widget.guias.nombre_guia,
                   style:
                   TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                   ),
                 ),
                ),
                Container(
                  child: Text(widget.guias.idiomas+"\n"+
                              widget.guias.celular+"\n"+
                              widget.guias.correo,
                  style: TextStyle(
                  fontSize: 24
                  ),
                    textAlign: TextAlign.center,
                  )
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text("Ver agenda",
                  style: TextStyle(
                  fontSize: 28, fontFamily: "Contenido"
                  ),
                  ),
                    onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Calendario()));
    }
                )


              ],
            ),
          ),
        )
      )
    );
  }
}
