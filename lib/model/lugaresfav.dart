import'package:hive/hive.dart';

part'lugaresfav.g.dart';
@HiveType(typeId: 0)
class LugaresFav extends HiveObject{

    @HiveField(0)
    String? nombre_guia;
    @HiveField(1)
    String? apellido_guia;
    @HiveField(2)
    String? correo;
    @HiveField(3)
    String? celular;
    @HiveField(4)
    String? lugar;
    @HiveField(5)
    String? zona;

}