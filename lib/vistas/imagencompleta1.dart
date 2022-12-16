import 'package:flutter/material.dart';
import 'package:turistbogota/model/imagenescompletas.dart';

import '../model/lugares.dart';

class ImagenCompleta1 extends StatefulWidget {
  final ImagenesCompletas imagenes;
  const ImagenCompleta1(this.imagenes, {Key? key}) : super(key: key);

  @override
  State<ImagenCompleta1> createState() => _ImagenCompleta1State();
}

class _ImagenCompleta1State extends State<ImagenCompleta1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(widget.imagenes.lugar),
          leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: ()=> Navigator.pop(context, false),
          )

        ),
        body: Container(
            child: Image.network(widget.imagenes.imagen2)
            )
          )
      );


  }
}
