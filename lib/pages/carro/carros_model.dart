import 'dart:async';

import 'package:mobx/mobx.dart';

import 'carro.dart';
import 'carros_api.dart';

part 'carros_model.g.dart';

class ModelCar = CarrosModel with _$ModelCar;

abstract class CarrosModel with Store {
  @observable
  List<Carros> carros;

  @observable
  Exception error;

  @action
  fetch(String tipoCarro) async {
    try {
      this.carros = await CarrosApi.getCarros(tipoCarro);
    } catch (e) {
      error = e;
    }
  }
}
