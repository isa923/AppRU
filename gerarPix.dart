import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart'; 


class MercadoPagoService {
  static const String accessToken =
      "TEST-6739713351578608-021122-50a7ab3c158d4a50b0314be7d859bc88-676008273";


  static Future<String?> gerarPix(double valor, String id) async {
    final url = Uri.parse("https://api.mercadopago.com/v1/payments");


    exibi() {
      print("Cabeçalhos enviados: ${jsonEncode({
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
            "X-Idempotency-Key": id,
          })}");
    }


    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken",
        "X-Idempotency-Key": id,
      },
      body: jsonEncode({
        "transaction_amount": valor,
        "payment_method_id": "pix",
        "payer": {"email": "t.bss9165@gmail.com"}
       
      }),
    );


    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data["point_of_interaction"]["transaction_data"]["qr_code_base64"];
    } else {
      print("Erro ao gerar Pix: ${response.body}");
      exibi();
      return null;
    }
  }
}


