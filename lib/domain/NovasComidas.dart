class Novascomidas {
  late int id;
  late String titulo;
  late String descricao;
  late String urlImagem;
  late String categoria;

  Novascomidas({
    required this.titulo,
    required this.descricao,
    required this.urlImagem,
    required this.categoria,
  });

  Novascomidas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    urlImagem = json['url_imagem'];
    categoria = json['categoria'];
  }
}