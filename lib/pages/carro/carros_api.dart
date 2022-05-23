import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:list_car/pages/carro/carro.dart';

import '../login/usuario.dart';
import 'favoritos/carro_dao.dart';

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carros>> getCarros(String tipoCarro) async {
    // String s = tipoCarro.toString().replaceAll('TipoCarro.', "");
    try {
      var url =
          'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipoCarro';
      print(url);
      Usuario user = await Usuario.get();
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${user.token}",
      };
      var response = await http.get(Uri.parse(url), headers: headers);
      print('status > ${response.statusCode}');
      String json = response.body;
      print('json > $json');
      List list = convert.json.decode(json);
      List<Carros> carros =
          list.map<Carros>((e) => Carros.fromJson(e)).toList();
      final dao = CarroDAO();
      carros.forEach(
        (c) {
          dao.save(c);
        },
      );

      return list.map<Carros>((e) => Carros.fromJson(e)).toList();
    } on Exception catch (e) {
      print('e>> $e');
    }
  }
}
