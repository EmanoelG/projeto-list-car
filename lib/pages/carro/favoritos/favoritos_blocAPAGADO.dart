import 'dart:async';

import 'package:list_car/pages/carro/carro.dart';
import 'package:list_car/pages/carro/carros_api.dart';
import 'package:list_car/pages/carro/favoritos/carro_dao.dart';
import 'package:list_car/pages/carro/favoritos/favorito_service.dart';

import '../../../util/network_verific.dart';

class FavoritosBloc {
  final streamController = StreamController<List<Carros>>();
  Stream<List<Carros>> get Strea => streamController.stream;

  Future<void> fetch() async {
    try {
      List<Carros> carros = await FavoritoService.getCarros();
      streamController.add(carros);
      return carros;
    } catch (e) {
      streamController.addError(e);
    }
  }

  void dispose() {
    streamController.close();
  }
}
