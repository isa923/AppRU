class Cartoes {
  late String nome_titular;
  late String numero_cartao;
  late String validade;
  late String cvv;
  late String cpf;


  void apresentar() {
    String mascararNumeroCartao(String numero) {
      if (numero.length < 4) {
        return 'Número inválido';
      }
      return '${numero.substring(0, 4)} **** **** ${numero.substring(12)}';
    }


    print('=== Detalhes do Cartão ===');
    print('Titular: $nome_titular');
    print('Número do Cartão: ${mascararNumeroCartao(numero_cartao)}');
    print('Validade: $validade');
    print('CPF: ${cpf.length == 11 ? '${cpf.substring(0, 3)}.***.***-${cpf.substring(9)}' : 'CPF inválido'}');
  }




  Cartoes({
    required this.nome_titular,
    required this.numero_cartao,
    required this.validade,
    required this.cvv,
    required this.cpf,
  });


  Cartoes.fromJson(Map<String, dynamic> json) {
    nome_titular = json['nome_titular'];
    numero_cartao = json['numero_cartao'];
    validade = json['validade'];
    cvv = json['cvv'];
    cpf = json['cpf'];
  }


  Map<String, dynamic> toJson() {
    return {
      'nome_titular': nome_titular,
      'numero_cartao': numero_cartao,
      'validade': validade,
      'cvv': cvv,
      'cpf': cpf,
    };
  }
}
