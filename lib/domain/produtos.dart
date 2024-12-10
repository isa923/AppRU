class Produtos {
  late int id;
  late String urlImagem;
  late String titulo;
  late double valor;
  late int quantidade;

  Produtos({
    required this.urlImagem,
    required this.titulo,
    required this.valor,
    required this.quantidade,
  });

  Produtos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    urlImagem = json['url_image'];
    valor = json['valor'];
    quantidade = json['quantidade'];
  }

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'url_image': urlImagem,
      'valor': valor,
      'quantidade': quantidade,
    };
  }
}