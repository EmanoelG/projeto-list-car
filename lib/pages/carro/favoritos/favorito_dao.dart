import 'package:list_car/util/sql/base_dao.dart';
import 'package:list_car/pages/carro/favoritos/favorito.dart';

class FavoriotDAO extends BaseDAO<Favorito> {
  @override
  Favorito fromJson(Map<String, dynamic> map) {
    return Favorito.fromMap(map);
  }

  @override
  String get tableName => "favorito";
}
