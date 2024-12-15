import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "comidas.db");
    Database  database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    print(dbPath);
    return database;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE COMIDAS (id INTEGER PRIMARY KEY, titulo varchar(100), descricao varchar(100), url_imagem varchar(100), categoria varchar(100));';
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (1, 'TAPIOCA', 'Prove da melhor tapioca da região','https://www.receiteria.com.br/wp-content/uploads/como-fazer-tapioca-00-1.jpg','Café da manhã');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (2, 'PÃO DE QUEIJO', 'Prove do melhor pão de queijo da região','https://i1.wp.com/ncultura.pt/wp-content/uploads/2017/11/shutterstock-579999919-e1510831911710.jpg?fit=2000%2C1335&ssl=1','Café da manhã');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (3, 'CUSCUZ RECHEADO', 'Prove do melhor cuscuz recheado da região','https://www.deline.com.br/assets/images/recipes/cuscuz-recheado-de-frango/mobile/thumb-video.jpg','Café da manhã');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (4, 'BOLO COMUM', 'Prove do melhor bolo da região','https://img.cybercook.com.br/receitas/940/bolo-do-coco-low-carb.jpeg','Café da manhã');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (5, 'FRUTAS', 'Prove das frutas mais fresquinhas da região','https://www.somosmamas.com.ar/wp-content/uploads/2020/03/que-son-las-frutas-1-scaled.jpg','Café da manhã');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (6, 'ALMOÇO TRADICIONAL','Serve 2 pessoas','https://4.bp.blogspot.com/-X6QtAszOA6g/W8PuxmtYfNI/AAAAAAAAgDc/PqJzyNpt9EUbo55Nh7uCXWptQne5W-dcQCLcBGAs/s1600/prato-de-comida.jpg','Almoço');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (7, 'ESTROGONOFF','Serve 2 pessoas','https://4.bp.blogspot.com/-9gFQoJ4IlAE/WyLSu9fqNhI/AAAAAAAAND0/3Ab_DDh-CO0e7D3VWiND0MrkFLGt5nT-ACLcBGAs/s1600/strogonoff-de-frango.jpg','Almoço');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (8, 'FEIJOADA','Serve 3 pessoas','https://img.freepik.com/photos-gratuite/plat-typique-bresilien-appele-feijoada-fait-haricots-noirs-du-porc-saucisses-vue-dessus_261158-1563.jpg?size=626&ext=jpg','Almoço');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (9, 'ESCONDIDIHO','Serve 1 pessoa','https://www.stayathomemum.com.au/wp-content/uploads/2019/08/bigstock-Shepherd-s-pie-59840420.jpg','Almoço');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (10, 'LASANHA','Serve 1 pessoa','https://www.comidaereceitas.com.br/wp-content/uploads/2017/09/feijoada3-780x439.jpg','Almoço');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (11, 'SOPA FIT','Sopa fitness de legumes para o jantar','https://guiadacozinha.com.br/wp-content/uploads/2019/10/sopa-cremosa-legumes-2-768x619.jpg','Jantar');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (12, 'CUSCUZ','Melhor cuscuz recheado da região','https://instadelivery-public.nyc3.cdn.digitaloceanspaces.com/groups/1716491712664f95c0de90e.jpeg','Jantar');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (13, 'LASANHA','Conheça a lasanha mais saborosa de todas','https://renata.com.br/images/receitas/141/renata-imagem-receitas-lasanha-a-bolonhesa-share.jpg','Jantar');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (14, 'PANQUECA','Conheça a melhor massa de panqueca caseira','https://static.itdg.com.br/images/1200-630/97ca4129309c3f4b269068bf079c18b5/massa-de-panqueca-de-dois-ingredientes.jpeg','Jantar');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (15, 'ARROZ DE FORNO','Prove o melhor arroz de forno da região','https://www.receiteria.com.br/wp-content/uploads/arroz-de-forno-com-frango-facil.jpg','Jantar');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (16, 'COXINHA','Apenas de frango.','https://tse3.mm.bing.net/th?id=OIP.a8hZhpGJrC30yUGsPH6SkQHaFN&pid=Api&P=0&h=180','Salgados');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (17, 'PASTEL','Queijo, carne e camarão.','https://tse2.mm.bing.net/th?id=OIP.EYfHLoiZdlJRmslHl0wqzAHaER&pid=Api&P=0&h=180','Salgados');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (18, 'TORTA','Frango, sardinha e camarão.','https://tse1.mm.bing.net/th?id=OIP.OrkAgJES5KUBB0SmNZGLqgHaEL&pid=Api&P=0&h=180','Salgados');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (19, 'FATIA DE PIZZA','Frango, calabresa e mista.','https://www.finedininglovers.com/sites/g/files/xknfdk626/files/2020-12/pepperoni_pizza%C2%A9iStock.jpg','Salgados');";
    await db.execute(sql);

    sql =
    "INSERT INTO COMIDAS (id, titulo, descricao, url_imagem, categoria) VALUES (20, 'CACHORRO QUENTE','Salsicha e carne moída.','https://tse4.mm.bing.net/th?id=OIP.MdPXHO78FlbUqc-fcwLm-gHaFj&pid=Api&P=0&h=180','Salgados');";
    await db.execute(sql);
  

    sql =
        'CREATE TABLE CARTOES ( id INTEGER PRIMARY KEY AUTOINCREMENT, nome_titular TEXT, numero_cartao TEXT, validade TEXT, cvv TEXT, cpf TEXT );';
    await db.execute(sql);


    sql =
        "INSERT INTO CARTOES (nome_titular, numero_cartao, validade, cvv, cpf) VALUES ('João José Santos', '123456', '20/2025', '123', '23654412345');";
    await db.execute(sql);


    sql =
        "INSERT INTO CARTOES (nome_titular, numero_cartao, validade, cvv, cpf) VALUES ('Marcos Felipe', '112233', '10/2034', '321', '23654422222');";
    await db.execute(sql);
  }
}


