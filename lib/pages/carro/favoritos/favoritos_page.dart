import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:list_car/pages/carro/carro_page.dart';
import 'package:list_car/pages/carro/carros_bloc.dart';
import 'package:list_car/pages/carro/carros_listview.dart';
import 'package:list_car/pages/carro/carros_model.dart';
import 'package:list_car/util/nav.dart';
import 'package:list_car/util/text_error.dart';
import '../carro.dart';
import 'favoritos_bloc.dart';

class FavoritosPage extends StatefulWidget {
  @override
  _FavoritosPageState createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage>
    with AutomaticKeepAliveClientMixin<FavoritosPage> {
  List<Carros> carros;
  var _favoritosBloc = FavoritosBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _favoritosBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder(
      stream: _favoritosBloc.Strea,
      builder: (context, snapshot) {
        if (snapshot.error != null) {
          print('ERROR >>> ' + snapshot.toString());
          return TextError('Não foi possível buscar a lista de carros !');
        }
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        List<Carros> carros = snapshot.data;
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CarrosListView(carros),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _favoritosBloc.fetch();
  }

  @override
  bool get wantKeepAlive => true;
}
