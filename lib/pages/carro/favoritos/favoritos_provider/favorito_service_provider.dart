import 'package:flutter/material.dart';
import 'package:list_car/pages/carro/favoritos/favorito_service.dart';

import '../../carro.dart';

class FavoritoServiceModel extends ChangeNotifier {
  List<Carros> car = [];
  Future<List<Carros>> getCarros() async {
    car = await FavoritoService.getCarros();
    notifyListeners();
  }
}
