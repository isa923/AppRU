import 'package:untitled/domain/comidas.dart';

class Database {
  static List pacotes = [
    Comidas(
        urlImagem:
        'https://guiadacozinha.com.br/wp-content/uploads/2019/10/sopa-cremosa-legumes-2-768x619.jpg',
        titulo: 'SOPA FIT',
        descricao: 'Sopa fitness de legumes para o jantar',
        valorAntigo: 4.99,
        valorAtual: 1.99,
        estabelecimento: 'Panificadora Rio Branco',
        avaliacao: '4.8 (281)',
        detalhes:
        'Sopa composta por batatinha, cenoura, carne de gado, coentro'),
    Comidas(
        urlImagem:
        'https://instadelivery-public.nyc3.cdn.digitaloceanspaces.com/groups/1716491712664f95c0de90e.jpeg',
        descricao: 'Melhor cuscuz recheado da região',
        titulo: 'CUSCUZ',
        valorAntigo: 3.99,
        valorAtual: 1.99,
        estabelecimento: 'Restaurante do Dudu',
        avaliacao: '4.9 (1231)',
        detalhes: 'Cuscuz composto por queijo, carne...'),
    Comidas(
        urlImagem:
        'https://renata.com.br/images/receitas/141/renata-imagem-receitas-lasanha-a-bolonhesa-share.jpg',
        titulo: 'LASANHA',
        descricao: 'Conheça a lasanha mais saborosa de todas',
        valorAntigo: 4.99,
        valorAtual: 3.99,
        estabelecimento: 'Panificadora da Ritinha',
        avaliacao: '4.8 (341)',
        detalhes: 'Lasanha composta por macarrao, queijo, presunto, carne..'),
    Comidas(
        urlImagem:
        'https://static.itdg.com.br/images/1200-630/97ca4129309c3f4b269068bf079c18b5/massa-de-panqueca-de-dois-ingredientes.jpeg',
        titulo: 'PANQUECA',
        descricao: 'Conheça a melhor massa de panqueca caseira',
        valorAntigo: 4.99,
        valorAtual: 1.99,
        estabelecimento: 'Restaurante João de Barro',
        avaliacao: '4.7 (1067)',
        detalhes: 'Panqueca composta por massa, queijo e frango'),
    Comidas(
        urlImagem:
        'https://www.receiteria.com.br/wp-content/uploads/arroz-de-forno-com-frango-facil.jpg',
        titulo: 'ARROZ DE FORNO',
        descricao: 'Prove o melhor arroz de forno da região',
        valorAntigo: 4.99,
        valorAtual: 2.99,
        estabelecimento: 'Pratos da Ana',
        avaliacao: '4.8 (677)',
        detalhes:
        'Arroz de forno composto por arroz, queijo, presunto, frango, milho verde e orégano')
  ];
}