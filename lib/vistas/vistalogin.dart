import 'package:turistbogota/vistas/lugaresturisticos.dart';
import 'package:turistbogota/vistas/perfilusuario.dart';
import 'package:turistbogota/vistas/tituloprincipal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  final usuario = TextEditingController();
  final clave = TextEditingController();
  bool passenable = true;
  String usu= "";
  String cla= "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage('images/transmilenioCentro.jpg'),
           fit: BoxFit.cover,

         ),
       ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text('Login'),
            backgroundColor: Colors.lightBlueAccent,
            leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: ()=> Navigator.pop(context, false),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
                Container(
                  child: Titulo(),
                  margin: EdgeInsets.only(bottom: 38),
                ),
                Container(
                  child:Text('Login', style: TextStyle(
                    fontSize: 26, fontFamily: 'contenido',
                    color: Colors.white,
                  ),

            ),
             margin: EdgeInsets.only(bottom: 20),

             ),
              txtusuario(),
              txtclave(),
              btnlogin(),
          ],
      ),
      ),
      ),
      ),
    );
  }
  Container txtusuario(){
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration:BoxDecoration(
        border: Border.all(color:Colors.yellowAccent, width: 2),
        borderRadius: BorderRadius.circular(2), color: Colors.white
      ),
      child: TextFormField(
        style:(TextStyle(fontSize: 20)
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Usuario',

        ),
        controller: usuario,
      )
    );
  }
  Container txtclave() {
    return Container(
      height: 56,
      margin: EdgeInsets.only(bottom: 28),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellowAccent, width: 2),
          borderRadius: BorderRadius.circular(2),
          color: Colors.white,
        ),
        child: TextFormField(
          style: (TextStyle(fontSize: 20)
          ),
          obscureText: passenable,

          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Clave',
            suffix: IconButton(onPressed: (){
              setState(() {
                if(passenable){
                  passenable = false;
                }else{
                  passenable = true;
                }
              });
             }, icon: Icon(passenable == true?Icons.remove_red_eye: Icons.password)
            )

          ),
          controller: clave,
        ),
    );
  }
  ElevatedButton btnlogin(){
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.red,
      ),
      child: Text('Ingresar',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,

      ),
      ),
      onPressed: ()async{
        usu=usuario.text;
        cla=clave.text;
        try {
          final datos = await firebaseAuth.signInWithEmailAndPassword(
              email: usu, password: cla);
          if (datos != null) {
            var key = (FirebaseAuth.instance.currentUser?.uid);
            print(usu);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PerfilUsuario(key))
            );
          }
        }catch(e){
        Fluttertoast.showToast(msg: "Datos no se encontraron, revise si el usuario o contraseña son correctos",
            toastLength: Toast.LENGTH_LONG, gravity:ToastGravity.CENTER);
        }
      },
    );
  }
}
