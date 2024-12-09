import 'package:untitled/domain/pratos_almoco.dart';

class Database {
  static List<OpcoesAlmoco> Pratos = [
    OpcoesAlmoco(
      urlImagem:
      'https://4.bp.blogspot.com/-X6QtAszOA6g/W8PuxmtYfNI/AAAAAAAAgDc/PqJzyNpt9EUbo55Nh7uCXWptQne5W-dcQCLcBGAs/s1600/prato-de-comida.jpg',
      titulo: 'TRADICIONAL',
      Descricao: 'SERVE 2 PESSOAS',
      opcao: 'COMPRAR',
      adc: 'COMPLEMENTOS',
      valor: 2.99,
      hora: 'DAS 08 - 22H',
      localizacao: 'ARAPIRACA',
      complementos: ['FAROFA', 'LEGUMES COZIDOS', 'PURÊ DE BATATA', 'SALPICÃO'],
    ),
    OpcoesAlmoco(
      urlImagem:
      'https://4.bp.blogspot.com/-9gFQoJ4IlAE/WyLSu9fqNhI/AAAAAAAAND0/3Ab_DDh-CO0e7D3VWiND0MrkFLGt5nT-ACLcBGAs/s1600/strogonoff-de-frango.jpg',
      titulo: 'ESTROGONOFF',
      Descricao: 'SERVE 2 PESSOAS',
      opcao: 'COMPRAR',
      adc: 'COMPLEMENTOS',
      valor: 1.99,
      hora: 'DAS 08 - 22H',
      localizacao: 'ARAPIRACA',
      complementos: ['MACARRÃO', 'PURÊ DE BATATA', 'FRANGO', 'CARNE'],
    ),
    OpcoesAlmoco(
      urlImagem:
      'https://img.freepik.com/photos-gratuite/plat-typique-bresilien-appele-feijoada-fait-haricots-noirs-du-porc-saucisses-vue-dessus_261158-1563.jpg?size=626&ext=jpg',
      titulo: 'FEIJOADA',
      Descricao: 'SERVE 3 PESSOAS',
      opcao: 'COMPRAR',
      adc: 'COMPLEMENTOS',
      valor: 2.99,
      hora: 'DAS 08 - 22H',
      localizacao: 'ARAPIRACA',
      complementos: ['PURÊ','MACARRÃO','BATATA FRITA', 'OVO DE CODORNA'],
    ),
    OpcoesAlmoco(
      urlImagem:
      'https://www.stayathomemum.com.au/wp-content/uploads/2019/08/bigstock-Shepherd-s-pie-59840420.jpg',
      titulo: 'ESCONDIDIHO',
      Descricao: 'SERVE 1 PESSOA',
      opcao: 'COMPRAR',
      adc: 'COMPLEMENTOS',
      valor: 1.99,
      hora: 'DAS 08 - 22H',
      localizacao: 'ARAPIRACA',
      complementos: ['ARROZ', 'FEIJÃO TROPEIRO', 'MACARRÃO', 'SALADA'],
    ),
    OpcoesAlmoco(
      urlImagem:
      'https://www.comidaereceitas.com.br/wp-content/uploads/2017/09/feijoada3-780x439.jpg',
      titulo: 'LASANHA',
      Descricao: 'SERVE 1 PESSOA',
      opcao: 'COMPRAR',
      adc: 'COMPLEMENTOS',
      valor: 1.99,
      hora: 'DAS 08 - 22H',
      localizacao: 'ARAPIRACA',
      complementos:  ['FRANGO', 'PRESUNTO E QUEIJO', 'CARNE MOÍDA', 'ARROZ E BATATA FRITA'],
    ),
  ];
}