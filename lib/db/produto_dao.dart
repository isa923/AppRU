// DAO - DATA ACCESS OBJECT

import 'package:untitled/db/db_helper.dart';
import 'package:untitled/domain/produtos.dart';

class ProdutoDao {
  Future<List<Produtos>> listarPacotes() async {
    final db = await DBHelper().initDB();

    final List<Map<String, dynamic>> maps = await db.query('PRODUTO');

    return List.generate(maps.length, (i) {
      print(maps[i]);
      return Produtos.fromJson(maps[i]);
    });

  }


  salvarProduto(Produtos produto) async {
    final db = await DBHelper().initDB();
    await db.insert('PRODUTO', produto.toJson());
  }
}
