import 'package:flutter/material.dart';
import 'package:list_car/pages/carro/carro_page.dart';
import 'package:list_car/util/nav.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'carro.dart';

class CarrosListView extends StatelessWidget {
  List<Carros> carr;
  CarrosListView(this.carr);

  @override
  Widget build(BuildContext context) {
    return listView(context, carr);
  }

  listView(context, List<Carros> carr) {
    return ListView.builder(
      itemCount: carr.length,
      itemBuilder: (ctx, idx) {
        final c = carr[idx];
        return Container(
          // height: 280,
          child: InkWell(
            onTap: () {
              _onClickCarro(context, c);
            },
            onLongPress: () {
              _onLongClickCarro(context, c);
            },
            child: cardListView(c, context),
          ),
        );
      },
    );
  }

  Card cardListView(Carros c, BuildContext context) {
    return Card(
      color: Color(0x000000009),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: CachedNetworkImage(
              imageUrl: c.urlFoto ??
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
  }

  _onClickCarro(context, Carros c) {
    push(context, CarroPage(c));
  }

  _onLongClickCarro(BuildContext context, Carros c) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(c.nome),
          children: [
            ListTile(
              title: Text('Detalhes'),
            ),
            ListTile(
              title: Text('Share'),
            ),
          ],
        );
      },
    );
  }
}
