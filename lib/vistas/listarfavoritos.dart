import'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:turistbogota/model/lugaresfav.dart';

import '../Boxes.dart';

class ListaFavoritos extends StatefulWidget {
  const ListaFavoritos({Key? key}) : super(key: key);

  @override
  State<ListaFavoritos> createState() => _ListaFavoritosState();
}

class _ListaFavoritosState extends State<ListaFavoritos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),

            child: Center(
              child: _builistview(),
            )
        )
    );
  }

  Widget _builistview() {
    return ValueListenableBuilder<Box<LugaresFav>>(
        valueListenable: Boxes.getfavoritosbox().listenable(),
        builder: (context, box, _) {
          final lugarBox = box.values.toList().cast<LugaresFav>();
          return ListView.builder(
              itemCount: lugarBox.length,
              itemBuilder: (BuildContext context, iterador) {
                final lug = lugarBox[iterador];

                return Card(
                    child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8, top: 8),

                            child: ListTile(

                              title: Text(lug.lugar ?? "",
                                style: TextStyle(fontSize: 22),),
                              subtitle: Text(lug.zona ?? ""),

                            ),

                          )

                        ]
                    )
                );
              }

          );
        }
    );
  }
}
