import 'package:flutter/material.dart';
import 'package:turistbogota/model/imagenescompletas.dart';

import '../model/lugares.dart';

class ImagenCompleta2 extends StatefulWidget {
  final ImagenesCompletas imagenes;
  const ImagenCompleta2(this.imagenes, {Key? key}) : super(key: key);

  @override
  State<ImagenCompleta2> createState() => _ImagenCompleta2State();
}

class _ImagenCompleta2State extends State<ImagenCompleta2> {
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
                child: Image.network(widget.imagenes.imagen3)
            )
        )
    );


  }
}