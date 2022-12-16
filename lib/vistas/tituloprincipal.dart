import 'package:flutter/material.dart';

class Titulo extends StatefulWidget {
  const Titulo({Key? key}) : super(key: key);

  @override
  State<Titulo> createState() => _TituloState();
}

class _TituloState extends State<Titulo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          height: 100,

          margin: EdgeInsets.only(top: 150),
          child: Text('Bogota Tourist',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              fontFamily: 'titulo',
              color: Colors.red,

            ),
            textAlign: TextAlign.end,
          ),


        ),
        Container(
          width: 130,
          height: 100,
          margin: EdgeInsets.only(top:150, left:15),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/LogoBogotaTourist.jpg'),



              )
          ),
        )
      ],
    );
  }
}
