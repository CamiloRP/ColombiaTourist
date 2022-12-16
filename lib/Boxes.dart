
import 'package:hive/hive.dart';
import 'package:turistbogota/model/lugaresfav.dart';

class Boxes{
    static Box<LugaresFav> getfavoritosbox()=>Hive.box<LugaresFav>('bd');
}