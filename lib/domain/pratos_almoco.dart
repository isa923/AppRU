class OpcoesAlmoco {
  String urlImagem;
  String titulo;
  String localizacao;
  String Descricao;
  String opcao;
  String hora;
  String adc;
  double valor;
  List<String> complementos;

  OpcoesAlmoco({
    required this.urlImagem,
    required this.hora,
    required this.titulo,
    required this.Descricao,
    required this.opcao,
    required this.adc,
    required this.valor,
    required this.localizacao,
    required this.complementos,
  });
}