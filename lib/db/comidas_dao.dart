import 'package:untitled/db/db_helper.dart';
import 'package:untitled/domain/NovasComidas.dart';
import 'package:sqflite/sqflite.dart';


class ComidasDao {
  Future<List<Novascomidas>> listarComidas() async {
    final db = await DBHelper().initDB();
    String sql = 'SELECT * FROM COMIDAS;';

    var result = await db.rawQuery(sql);

    List<Novascomidas> lista = [];
    for (var json in result) {
      Novascomidas comid = Novascomidas.fromJson(json);
      lista.add(comid);
    }

    return lista;
  }


}