import 'package:flutter/material.dart';
import 'package:my_app/bd/cartao_dao.dart';
import 'package:my_app/domain/cartoes.dart';
import 'package:my_app/pages/cadastrar_cartao.dart';


class ListarCartoes extends StatefulWidget {
 ListarCartoes({Key? key}) : super(key: key);




 @override
 State<ListarCartoes> createState() => _ListarCartoesState();
}


class _ListarCartoesState extends State<ListarCartoes> {
 List<Cartoes> cartoesList = [];




 @override
 void initState() {


   super.initState();
   loadCartoes();
 }




 Future<void> loadCartoes() async {


   cartoesList = await cartoesDAO().listarCartoes();


   setState(() {});


 }




 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title:  Text('Cartões'),
       backgroundColor: Colors.blue,
     ),
     body: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(16.0),
           child: ElevatedButton(
             onPressed: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => CadastrarCartao(),
                 ),
               ).then((_) => loadCartoes());
             },
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.blue,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10),
               ),
             ),
             child: const Text('+ Adicionar Cartão'),
           ),
         ),
         Expanded(
           child: ListView.builder(
             itemCount: cartoesList.length,
             itemBuilder: (context, index) {
               Cartoes cartao = cartoesList[index];
               return Card(
                 margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: ListTile(
                   title: Text(
                     cartao.nome_titular,
                     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                   ),
                   subtitle: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Número: ${cartao.numero_cartao}'),
                       Text('Validade: ${cartao.validade}'),
                       Text('CPF: ${cartao.cpf}'),
                     ],
                   )
                 ),
               );
             },
           ),
         ),
       ],
     ),
   );
 }
}




