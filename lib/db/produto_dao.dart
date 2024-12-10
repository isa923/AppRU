// DAO - DATA ACCESS OBJECT

import 'package:untitled/db/db_helper.dart';
import 'package:untitled/domain/produtos.dart';

class ProdutoDao {
  // Método para listar todos os pacotes
  Future<List<Produtos>> listarPacotes() async {
    final db = await DBHelper().initDB();

    // Consulta todos os pacotes da tabela PACOTE
    final List<Map<String, dynamic>> maps = await db.query('PRODUTO');

    // Converte os resultados em uma lista de objetos Produtos
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
