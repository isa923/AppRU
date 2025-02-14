class OpcoesAlmoco {
  late String urlImagem;
  late String titulo;
  late String localizacao;
  late String descricao;
  late String opcao;
  late String hora;
  late String adc;
  late double valor;

  OpcoesAlmoco({
    required this.urlImagem,
    required this.hora,
    required this.titulo,
    required this.descricao,
    required this.opcao,
    required this.adc,
    required this.valor,
    required this.localizacao
  });

  OpcoesAlmoco.fromJson(Map<String, dynamic> json) {
    urlImagem = json['urlImagem'] ?? '';
    titulo = json['titulo'] ?? '';
    localizacao = json['localizacao'] ?? '';
    descricao = json['Descricao'] ?? '';
    opcao = json['opcao'] ?? '';
    hora = json['hora'] ?? '';
    adc = json['adc'] ?? '';
    valor = json['valor'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['urlImage'] = urlImagem;
    json['titulo'] = titulo;
    json['localizacao'] = localizacao;
    json['Descricao'] = descricao;
    json['opcao'] = opcao;
    json['hora'] = hora;
    json['adc'] = adc;
    json['valor'] = valor;


    return json;
  }
}


