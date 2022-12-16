import'package:flutter/material.dart';

class Somos extends StatefulWidget {
  const Somos({Key? key}) : super(key: key);

  @override
  State<Somos> createState() => _SomosState();
}

class _SomosState extends State<Somos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Somos'),
          backgroundColor: Colors.lightBlueAccent,
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: ()=> Navigator.pop(context, false),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child:Center(
            child: Column(
              children: [
                _cardOne(),
                _cardTwo(),
                _cardThree(),
              ],
            ),
          ),
        ),
      ),
    );

  }
  Widget _cardOne() {
    return Card(
      elevation: 10,
      child: Container(
          color: Colors.yellowAccent,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text('BogotaTuris',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Contenido',
                  color: Colors.red,

                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  'Somos una aplicación que busca apoyar a los turistas de Colombia '
                      'para encontrar sitios de mucho interes en Bogota. En nuestra aplicaión'
                      ' describimos para ti el lugar, '
                      'te damos ubicación y te brindamos la dirección.'+"\n"+
                      'Ademas, ofrecemos servicio de guia turistico el cual resulta '
                      'muy util  en las ciudades más grandes por motivos de '
                      'aprovechamiento positivo del tiempo y seguridad en tu recorrido.'+"\n"+
                      'Finalmente, nos interesa que tu experiencía sea agradable por tanto te '
                      'damos la posibilidad de conectarte con más turistas interesados en '
                      'tu mismo plan el mismo día. Animate a tener un plan turistico bien acompañado!',
              style: TextStyle(fontSize: 18), textAlign: TextAlign.justify,
              )
            ],
          )

      ),
    );
  }
  Widget _cardTwo(){
    return Card(
      elevation: 10,
      child: Container(

        child: Column(
          children: [
            FadeInImage(placeholder: AssetImage('images/Somos5.png'),
                image: AssetImage('images/Somos5.png')
            )
          ],
        )
      ),
    );
  }
  Widget _cardThree(){
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.red,
        child: Column(
          children: [
            Text('Como funciona?',
            style: TextStyle(
              fontFamily: "Titulo",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Primero registrate. No tardas ni un minuto :). Despues, podras ingresar "
                "a tu cuenta con tu correo y contraseña, allí podras seleccionar el lugar "
                "que más te llame la atención y conocer detalles. Los servicios de Google Maps "
                "te ayudaran a guiarte y al final encontraras la opcion para ir a buscar tu "
                "guia turistico para esta aventura."+"\n"+
              "Para conectarte con otros turistas podras seleccionar la opción de chat grupal"
                  "el cual encontraras en el lugar de tu interes.", style:
              TextStyle(fontSize: 18), textAlign: TextAlign.justify
              ,)
          ],
        )
      )
    );
  }
}

