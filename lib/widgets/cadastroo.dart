class Cadastroo {
  late String nome;
  late String numeroCartao;
  late String validade;
  late String cvv;
  late String cpf;


  Cadastroo({
    required this.nome,
    required this.numeroCartao,
    required this.validade,
    required this.cvv,
    required this.cpf,

  });

  Cadastroo.fromJson(Map<String, dynamic> json) {
    nome = json['Nome do Titular'];
    numeroCartao = json['Número do Cartão'];
    validade = json['Data de Validade'];
    cvv = json['CVV'];
    cpf = json['CPF'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Nome do Titular': nome,
      'Número do Cartão': numeroCartao,
      'Data de Validade': validade,
      'CVV': cvv,
      'CPF': cpf,

    };
  }
}