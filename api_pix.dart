import 'dart:convert';
import 'package:http/http.dart' as http;


class PixAPI {
  final String clientId = "SEU_CLIENT_ID";
  final String clientSecret = "SEU_CLIENT_SECRET";
  final String baseUrl = "https://api.gerencianet.com.br/v1";




  Future<String> gerarQRCode(double valor) async {
    var response =  http.post(
      Uri.parse('$baseUrl/pix/qrcode'),
      headers: {
        'Authorization': 'Bearer SEU_ACCESS_TOKEN',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "valor": valor,
      }),
    );


    if (response.statusCode == 200) {
      return jsonDecode(response.body)['qrcode'];
    } else {
      throw Exception('Erro ao gerar QR Code');
    }
}
}
