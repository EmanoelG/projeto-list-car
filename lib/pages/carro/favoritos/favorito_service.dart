import 'package:flutter/cupertino.dart';
import 'package:list_car/pages/carro/favoritos/carro_dao.dart';
import 'package:list_car/pages/carro/favoritos/favorito.dart';
import 'package:list_car/pages/carro/favoritos/favorito_dao.dart';

import '../carro.dart';
import 'favorito.dart';
import 'favorito.dart';

class FavoritoService {
  static Future<bool> Favoritar(Carros c) async {
    Favorito f = Favorito.fromCarro(c);
    final dao = FavoriotDAO();
    final exists = await dao.exists(c.id);
    if (exists) {
      dao.delete(c.id);
      print('Existe');
      return false;
    } else {
      dao.save(f);
      print('Save');
      return true;
    }
  }

  static Future<List<Carros>> getCarros() async {
    // SELECT * from carro c, favorito f where c.id = f.id;
    List<Carros> carr = await CarroDAO()
        .query("SELECT * from carro c, favorito f where c.id = f.id;");
    print('return carros $carr');
    return carr;
  }

  static Future<bool> isFavorito(Carros c) async {
    final carr = await CarroDAO();
    final exists = await carr.exists(c.id);
    return exists;
  }
}
