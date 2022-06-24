// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:async';

import 'package:list_car/pages/carro/carro.dart';
import 'package:list_car/pages/carro/carros_api.dart';
import 'package:list_car/pages/carro/favoritos/carro_dao.dart';
import 'package:list_car/pages/carro/favoritos/favorito_service.dart';

import '../../../util/network_verific.dart';

//IMPLEMENTA CARRO BLOC
class FavoritosBloc {
  final _streamController = StreamController<List<Carros>>();
  Stream<List<Carros>> get Strea => _streamController.stream;

  Future<List<Carros>> fetch() async {
    try {
      List<Carros> carros = await FavoritoService.getCarros();

      _streamController.add(carros);
      return carros;
    } catch (e) {
      _streamController.addError(e);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
