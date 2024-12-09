import 'package:untitled/db/db_helper.dart';
import 'package:untitled/domain/NovasComidas.dart';
import 'package:sqflite/sqflite.dart';


class ComidasDao {
  Future<List<Novascomidas>> listarComidas() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM COMIDAS;';

    var result = await db.rawQuery(sql);
    // [
    // { 'id' : 1, 'titulo': 'a' },
    // { 'id' : 2, 'titulo': 'a' },
    // { 'id' : 3, 'titulo': 'a' }
    // ]
    List<Novascomidas> lista = [];
    for (var json in result) {
      Novascomidas comid = Novascomidas.fromJson(json);
      lista.add(comid);
    }

    return lista;
  }
}