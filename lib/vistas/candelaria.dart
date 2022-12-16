import'package:flutter/material.dart';

class Candelaria extends StatefulWidget {
  const Candelaria({Key? key}) : super(key: key);

  @override
  State<Candelaria> createState() => _CandelariaState();
}

class _CandelariaState extends State<Candelaria> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
        body:Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child:Text('Candelaria',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30,
                      fontFamily: 'Titulo', color: Colors.yellowAccent,
                    ),
                  )
                ),
                SizedBox(
                  height: 20,
                ),
                FadeInImage(placeholder: AssetImage('images/bienvenidaBogota.jpg'),
                    image: AssetImage('images/bienvenidaBogota.jpg')
                ),
              _cartaCandelaria()


              ],
            )
          )

        )
      )
    );
  }
  Widget _cartaCandelaria(){
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        width: 400,
        color: Colors.white,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  width: 160,
                  child: Text('Descripción', style: TextStyle(
                fontFamily: 'Titulo', fontSize: 22,
                ),
                ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 160,
                  child: Text('Informacion del lugar Reloaded 0 libraries in 485ms '
                    '(compile: 30 ms, reload: 0 ms, reassemble: 277 ms).'
                ),
                )
              ],
             ),
            Container(
              margin: EdgeInsets.only(left: 30),
              width: 170,
             height: 150,
             child: FadeInImage(placeholder: AssetImage('images/puenteGuaduaOscura.jpg'),
                image: AssetImage('images/puenteGuaduaOscura.jpg')
             ),
            )
          ],
        ),
      )
    );
  }
}
