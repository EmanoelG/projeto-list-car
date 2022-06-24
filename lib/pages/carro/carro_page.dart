import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:list_car/pages/carro/carro.dart';
import 'package:list_car/pages/carro/loremipsum_api.dart';
import 'package:list_car/pages/widgets/utilText.dart';

import 'favoritos/favorito_service.dart';

class CarroPage extends StatefulWidget {
  Carros carro;
  CarroPage(this.carro);

  @override
  State<CarroPage> createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  final _lorimpsumBloc = LorimpsumBloc();

  Carros get car => widget.carro;
  @override
  void initState() {
    super.initState();
    _lorimpsumBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(widget.carro.nome),
      actions: <Widget>[
        IconButton(
          onPressed: _onClickMap,
          icon: Icon(Icons.place),
        ),
        IconButton(
          onPressed: _onClickVideoCam,
          icon: Icon(Icons.videocam),
        ),
        PopupMenuButton<String>(
          onSelected: (String value) => _onClickPopoupMenu(value),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: 'Editar',
                child: Text('Editar'),
              ),
              PopupMenuItem(
                value: 'Deletar',
                child: Text('Deletar'),
              ),
              PopupMenuItem(
                value: 'Share',
                child: Text('Share'),
              ),
            ];
          },
        ),
      ],
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          CachedNetworkImage(imageUrl: widget.carro.urlFoto),
          _descricaoCarro(),
          Divider(),
          _blocoDois()
        ],
      ),
    );
  }

  Row _descricaoCarro() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.carro.nome,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.carro.tipo,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        _blocoUm(),
      ],
    );
  }

  Row _blocoUm() {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: _onClickFavorito,
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
            size: 40,
          ),
        ),
        IconButton(
          onPressed: _onCliShare,
          icon: Icon(
            Icons.share,
            color: Colors.black,
            size: 40,
          ),
        ),
      ],
    );
  }

  void _onClickVideoCam() {}

  void _onClickMap() {}

  _onClickPopoupMenu(String value) {
    switch (value) {
      case "Editar":
        print('Editando !!');
        break;
      case "Deletar":
        print('Deletando !!');
        break;
      case "Share":
        print('Compartilhando !!');
        break;
      default:
    }
  }

  void _onClickFavorito() {
    FavoritoService.Favoritar(car);
  }

  void _onCliShare() {}
  void dispose() {
    super.dispose();
    _lorimpsumBloc.dispose();
  }

  _blocoDois() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        StreamBuilder<String>(
            stream: _lorimpsumBloc.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return TextUtil(snapshot.data.toString());
            }),
      ],
    );
  }
}
