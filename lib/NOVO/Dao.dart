import 'package:untitled/NOVO/DB_helper.dart';
import 'package:untitled/domain/comidas.dart';
import 'package:sqflite/sqflite.dart';

class Dao {

  salvarFood(Comidas food) async {
    Database database = await DBHelper().initDB();
    database.insert('FOOD', food.toJson());
  }

  Future<List<Comidas>> listarComidas() async {
    final db = await DBHelper().initDB();
    String sql = 'SELECT * FROM FOOD;';

    var result = await db.rawQuery(sql);

    List<Comidas> lista = [];
    for (var json in result){
      Comidas food = Comidas.fromJson(json);
      lista.add(food);
    }

    await Future.delayed(const Duration(seconds: 4));
    return lista;
  }

}