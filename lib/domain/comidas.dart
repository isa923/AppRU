class Comidas {
  late int id;
  late String urlImagem;
  late String titulo;
  late String descricao;
  late double valorAntigo;
  late double valorAtual;
  late String cidade;
  late String avaliacao;
  late String detalhes;

  Comidas({
    required this.urlImagem,
    required this.titulo,
    required this.descricao,
    required this.valorAntigo,
    required this.valorAtual,
    required this.cidade,
    required this.avaliacao,
    required this.detalhes,
  });

  Comidas.fromJson(Map<String, dynamic> json) {
    id = 0;
    urlImagem = json['url_imagem'] ?? '';
    titulo = json['titulo'] ?? '';
    descricao = json['descricao'] ?? '';
    valorAntigo = json['valorAntigo'] ?? 0;
    valorAtual = json['valorAtual '] ?? 0;
    cidade = json['cidade'] ?? '';
    avaliacao = json['avaliacao'] ?? '';
    detalhes = json['detalhes'] ?? '';

  }

  Map<String, dynamic> toJson() {
    return {
      'urlImagem': urlImagem,
      'titulo': titulo,
      'descricao': descricao,
      'valorAntigo': valorAntigo,
      'valorAtual': valorAtual,
      'cidade': cidade,
      'avaliacao': avaliacao,
      'detalhes': detalhes,
    };
  }

  @override
  String toString() {
    return 'Comidas{id: $id, urlImagem: $urlImagem, titulo: $titulo, descricao: $descricao, valorAntigo: $valorAntigo, valorAtual: $valorAtual, cidade: $cidade, avaliacao: $avaliacao, detalhes: $detalhes}';
  }
}

