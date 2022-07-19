import 'package:flutter/material.dart';
import 'package:list_car/pages/carro/carro_page.dart';
import 'package:list_car/util/nav.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'carro.dart';
import 'package:share/share.dart';

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
      color: Color.fromARGB(210, 247, 247, 247),
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
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              c.nome,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Detalhes'),
              onTap: () {
                pop(context);
                _onClickCarro(context, c);
              },
              leading: Icon(Icons.directions_car),
            ),
            ListTile(
              title: Text('Share'),
              onTap: () {
                _onClickShare(context, c);
              },
              leading: Icon(Icons.share),
            ),
          ],
        );
      },
    );
  }

  void _onClickShare(BuildContext context, Carros c) {
    Share.share(c.urlFoto);
  }
}
