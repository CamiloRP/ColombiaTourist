// @dart=2.12
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:turistbogota/vistas/candelaria.dart';
import 'package:turistbogota/vistas/vistaprincipal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'model/lugaresfav.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:DefaultFirebaseOptions.currentPlatform);
        await Hive.initFlutter();
        Hive.registerAdapter(LugaresFavAdapter());
        await Hive.openBox<LugaresFav>('bd');

  runApp(const Inicio());
}

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:  Container(

          decoration: BoxDecoration(
            image: DecorationImage(
                image:AssetImage('images/bogota1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          //body: ListaMascotas(),
            //body: Candelaria()
            body:VistaPrincipal()
          //body: Login(),
        ),
        ),
      );

  }
}
