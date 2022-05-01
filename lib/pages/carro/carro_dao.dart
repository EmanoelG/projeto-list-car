import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'carro.dart';
import 'db_helper.dart';

// Data Access Object
class CarroDAO {
  Future<Database> get db => DatabaseHelper.getInstance().db;

  Future<int> save(Carros carro) async {
    var dbClient = await db;
    var id = await dbClient.insert("carro", carro.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('id: $id');
    return id;
  }

  Future<List<Carros>> findAll() async {
    final dbClient = await db;

    final list = await dbClient.rawQuery('select * from carro');

    final carros = list.map<Carros>((json) => Carros.fromJson(json)).toList();

    return carros;
  }

  Future<List<Carros>> findAllByTipo(String tipo) async {
    final dbClient = await db;

    final list =
        await dbClient.rawQuery('select * from carro where tipo =? ', [tipo]);

    final carros = list.map<Carros>((json) => Carros.fromJson(json)).toList();

    return carros;
  }

  Future<Carros> findById(int id) async {
    var dbClient = await db;
    final list =
        await dbClient.rawQuery('select * from carro where id = ?', [id]);

    if (list.length > 0) {
      return new Carros.fromJson(list.first);
    }

    return null;
  }

  Future<bool> exists(Carros carro) async {
    Carros c = await findById(carro.id);
    var exists = c != null;
    return exists;
  }

  Future<int> count() async {
    final dbClient = await db;
    final list = await dbClient.rawQuery('select count(*) from carro');
    return Sqflite.firstIntValue(list);
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from carro where id = ?', [id]);
  }

  Future<int> deleteAll() async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from carro');
  }
}
