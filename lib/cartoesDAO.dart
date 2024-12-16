

import 'package:my_app/bd/db_helper.dart';
import 'package:my_app/domain/cartoes.dart';
import 'package:sqflite/sqflite.dart';


class cartoesDAO {
  Future<void> salvarCartao(Cartoes cartao) async {
    try {
      Database database = await DBHelper().initDB();
      database.insert('CARTOES', cartao.toJson());
    } catch (erro) {
      print(erro);
    }
  }


  Future<List<Cartoes>> listarCartoes() async {
    Database db = await DBHelper().initDB();


    String sql = 'SELECT * FROM CARTOES;';
    print('${sql}');
    var result = await db.rawQuery(sql);
    print('${result}');


    List<Cartoes> lista = [];


    for (var json in result) {
      Cartoes cartao = Cartoes.fromJson(json);
      lista.add(cartao);
    }


    return lista;
  }
}




