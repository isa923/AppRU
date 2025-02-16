import 'dart:convert';
import 'package:ariely/tranferencia/gerarPix.dart';
import 'package:flutter/material.dart';


class PixScreen extends StatefulWidget {
  @override
  _PixScreenState createState() => _PixScreenState();
}


class _PixScreenState extends State<PixScreen> {
  String? qrCodeBase64;
  bool isLoading = false;
  String id = DateTime.now().millisecondsSinceEpoch.toString();


  void gerarPagamento() async {
    setState(() => isLoading = true);
    String? base64Image = await MercadoPagoService.gerarPix(10.0, id);
    print("-------------------------" + id);
    setState(() {
      qrCodeBase64 = base64Image;
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF5757),
      appBar: AppBar(title: Text("Pague com Pix")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [logicaQr()],
      ),
    );
  }


  Widget logicaQr() {
    return Center(
      child: isLoading
          ? CircularProgressIndicator()
          : qrCodeBase64 == null
              ? ElevatedButton(
                  onPressed: gerarPagamento,
                  child: Text("Gerar QR Code Pix"),
                )
              : Container(
                  height: 550,
                  width: 330,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.pix_sharp,
                        color: Colors.blue.shade800,
                        size: 120,
                      ),
                      Text(
                        "Aponte sua camera para o QrCode para paga-lo.",
                        style: TextStyle(fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.memory(
                          base64Decode(qrCodeBase64!),
                          width: 220,
                          height: 220,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.blue.shade800,
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                        ),
                        child: Text(
                          'Ja Paguei!',
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.white,
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                        ),
                        child: Text(
                          'Cancelar.',
                          style: TextStyle(
                            color: Colors.black, 
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}


