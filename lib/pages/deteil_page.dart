import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/pages/estrutura_produtos.dart';
import 'package:untitled/pages/map_pageYas.dart';
import 'package:untitled/pages/produtospage.dart';

class DateilPage extends StatefulWidget {
  const DateilPage({super.key});

  @override
  State createState() => _DetailPageState();
}

class _DetailPageState extends State {
  TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EXPLORE',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                hintText: 'Digite a cidade ou país',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.location_on,
                  size: 30,
                ),
                fillColor: Colors.grey[400],
                filled: true,
                contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () async {
                String locationQuery = _locationController.text;
                if (locationQuery.isNotEmpty) {
                  try {
                    List locations = await locationFromAddress(locationQuery);
                    print(locations);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MapPageYas(location: locations[0]);
                        },
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Localização não encontrada. Tente novamente.')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Digite uma cidade ou país antes de pesquisar.')),
                  );
                }
              },
              child: Text(
                'Ver no mapa',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 60),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "CATEGORIAS",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EstruturaProdutos(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      'https://diaonline.ig.com.br/wp-content/uploads/2019/06/caf-da-manh-em-Braslia_capa-e1560882564741.jpg',
                                      height: 85,
                                    ),
                                  ),
                                  Text(
                                    'CAFÉ DA MANHÃ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 32),
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      'https://images2.nogueirense.com.br/wp-content/uploads/2022/10/design-sem-nome-3-1666189173.png',
                                      height: 85,
                                    ),
                                  ),
                                  Text(
                                    'ALMOÇO',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt3dn8sVNpjaFCmEzy9Ll86zoD7qNY0BXaVQ&s',
                                      height: 85,
                                    ),
                                  ),
                                  Text(
                                    'JANTAR',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 32),
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      'https://lh5.googleusercontent.com/proxy/VdQ4IkrQBR3x-DzKUrB_FzpxHjDWpKjdBNASHPPUtLlwHFs3NYR6Lfgg0y9xRIWzF40g9yalJ_6cYS392lV1S6-9xqigyn-yKZ0RZ--FStk',
                                      height: 85,
                                    ),
                                  ),
                                  Text(
                                    'SALGADOS',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      'https://tse3.mm.bing.net/th?id=OIP.sNKm9z-fJirUj9SOG3I0kwHaE9&pid=Api&P=0&h=180',
                                      height: 85,
                                    ),
                                  ),
                                  Text(
                                    'DOCES',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 32),
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      'https://sbce.med.br/wp-content/uploads/2023/08/Captura-de-tela-2023-08-25-134110.png',
                                      height: 85,
                                    ),
                                  ),
                                  Text(
                                    'BEBIDAS',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Container(
          height: 60.0,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 40,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 40,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  size: 40,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

