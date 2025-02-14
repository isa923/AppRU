import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "comidas3.db");
    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    print(dbPath);
    return database;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE FOOD (id INTEGER PRIMARY KEY AUTOINCREMENT, url_imagem varchar(100), titulo varchar(100), descricao varchar(100), valorAntigo double, valorAtual double, cidade varchar(100), avaliacao varchar(100), detalhes varchar(100));';
    await db.execute(sql);

    sql =
    "INSERT INTO FOOD (url_imagem, titulo, descricao, valorAntigo, valorAtual, cidade, avaliacao, detalhes) VALUES ('https://static.itdg.com.br/images/360-240/d44a957b687ea4a22c86f66857da183f/sopa-de-legumes.jpg', 'SOPA FIT','Sopa fitness de legumes para o jantar', 4.99, 1.99, 'Maceió', '4.8 (281)', 'Sopa composta por batatinha, cenoura, carne de gado, coentro' );";
    await db.execute(sql);

    sql =
    "INSERT INTO FOOD (url_imagem, titulo, descricao, valorAntigo, valorAtual, cidade, avaliacao, detalhes) VALUES ('https://www.melhorpanela.com/wp-content/uploads/2024/03/cuscuz-recheado.jpg', 'CUSCUZ','Melhor cuscuz recheado da região', 3.99, 1.99, 'Craíbas', '4.9 (1231)', 'Cuscuz composto por queijo, carne...' );";
    await db.execute(sql);

    sql =
    "INSERT INTO FOOD (url_imagem, titulo, descricao, valorAntigo, valorAtual, cidade, avaliacao, detalhes) VALUES ('https://www.agrimidia.com.br/wp-content/uploads/2024/03/1759609683-lasanha-de-frango-rose-768x512-1.jpg', 'LASANHA', 'Conheça a lasanha mais saborosa de todas', 4.99, 3.99, 'Arapiraca', '4.8 (341)', 'Lasanha composta por macarrao, queijo, presunto, carne..');";
    await db.execute(sql);

    sql =
    "INSERT INTO FOOD ( url_imagem, titulo, descricao, valorAntigo, valorAtual, cidade, avaliacao, detalhes) VALUES ('https://www.comidaereceitas.com.br/wp-content/uploads/2021/11/panqueca_frangoi-780x479.jpg', 'PANQUECA', 'Conheça a melhor massa de panqueca caseira', 4.99, 1.99, 'Anadia', '4.7 (1067)', 'Panqueca composta por massa, queijo e frango');";
    await db.execute(sql);

    sql =
    "INSERT INTO FOOD ( url_imagem, titulo, descricao, valorAntigo, valorAtual, cidade, avaliacao, detalhes) VALUES ('https://www.comidaereceitas.com.br/wp-content/uploads/2021/09/arroz_mix-780x444.jpg', 'ARROZ DE FORNO', 'Prove o melhor arroz de forno da região', 4.99, 2.99, 'Feira Grande',  '4.8 (677)', 'Arroz de forno composto por arroz, queijo, presunto, frango, milho verde e orégano');";
    await db.execute(sql);


  }
}