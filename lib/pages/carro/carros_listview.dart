import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:list_car/pages/carro/carro_page.dart';
import 'package:list_car/pages/carro/carros_model.dart';
import 'package:list_car/util/nav.dart';
import 'package:list_car/util/text_error.dart';
import 'carro.dart';

class CarrosListView extends StatefulWidget {
  String tipo;

  CarrosListView({this.tipo});

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
    with AutomaticKeepAliveClientMixin<CarrosListView> {
  List<Carros> carros;
  var _modelCarro = ModelCar();
  String get tipo => widget.tipo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _modelCarro.fetch(tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (_) {
        List<Carros> carros = _modelCarro.carros;
        if (_modelCarro.error != null) {
          print('ERROR >>> ' + _modelCarro.error.toString());
          return TextError('Não foi possível buscar a lista de carros !');
        }

        if (_modelCarro == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return _listView(carros);
      },
    );
  }

  Padding _listView(List<Carros> carros) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        child: ListView.builder(
            itemCount: carros != null ? carros.length : 0,
            itemBuilder: (context, index) {
              Carros c = carros[index];
              return Card(
                color: Color(0x000000009),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                          child: Image.network(
                        c.urlFoto ??
                            "https://th.bing.com/th/id/OIP.Ruy9jl-Xtz-04gKaU5F84QHaE9?pid=ImgDet&rs=1",
                        width: 350,
                      )),
                      Text(
                        c.nome,
                        maxLines: 1,
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        'Descrição ',
                        maxLines: 1,
                        style: TextStyle(fontSize: 16),
                      ),
                      ButtonBarTheme(
                        data: ButtonBarTheme.of(context),
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              onPressed: () => _onClickCarro(c),
                              child: const Text(
                                'Detalhes ',
                                style: TextStyle(
                                    color: Color(0xFF0505059),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: const Text(
                                'Compartilhar ',
                                style: TextStyle(
                                    color: Color(0xFFFF00009),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  _onClickCarro(Carros c) {
    push(context, CarroPage(c));
  }
}
