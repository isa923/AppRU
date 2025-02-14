import 'package:dio/dio.dart';
import 'package:untitled/domain/estado.dart';

class EstadoApi {
  final domain = 'https://brasilapi.com.br/api';
  final dio = Dio();

  Future<Estado> findEstadoByDDD(String ddd) async {
    final response = await dio.get('$domain/ddd/v1/$ddd');
    Estado estado = Estado.fromJson(response.data);

    print(response.data);
    return estado;
  }
}