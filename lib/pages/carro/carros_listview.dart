import 'package:flutter/material.dart';
import 'package:list_car/pages/carro/carro_page.dart';
import 'package:list_car/util/nav.dart';

import 'carro.dart';
import 'carros_api.dart';

class CarrosListView extends StatelessWidget {
  List<Carros> carros;
  CarrosListView(this.carros);

  @override
  Widget build(BuildContext context) {
    return listView();
  }

  Container listView() {
    return Container(
      child: Padding(
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
                                onPressed: () => _onClickCarro(context, c),
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
      ),
    );
  }

  _onClickCarro(context, Carros c) {
    push(context, CarroPage(c));
  }
}
