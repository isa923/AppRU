import 'package:untitled/db/db_helper.dart';
import 'package:untitled/domain/pratos_almoco.dart';
import 'package:sqflite/sqflite.dart';

class AlmocoDao {

  Future<void> salvarAlmoco(OpcoesAlmoco Almoco) async {
    Database database = await DBHelper().initDB();
    database.insert('Prato', Almoco.toJson());
  }

  Future<List<OpcoesAlmoco>> listarAlmoco() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM ALMOCO;';

    var result = await db.rawQuery(sql);
    // [
    // { 'id' : 1, 'titulo': 'a' },
    // { 'id' : 2, 'titulo': 'a' },
    // { 'id' : 3, 'titulo': 'a' }
    // ]
    List<OpcoesAlmoco> lista = [];
    for (var json in result) {
      OpcoesAlmoco almoco = OpcoesAlmoco.fromJson(json);
      lista.add(almoco);
    }

    await Future.delayed(const Duration(seconds: 4));
    return lista;
  }
}