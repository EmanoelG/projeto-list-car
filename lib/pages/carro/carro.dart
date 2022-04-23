class Carros {
  int _id;
  String _nome;
  String _tipo;
  String _descricao;
  String _urlFoto;
  String _urlVideo;
  String _latitude;
  String _longitude;

  Carros(
      {int id,
      String nome,
      String tipo,
      String descricao,
      String urlFoto,
      String urlVideo,
      String latitude,
      String longitude}) {
    this._id = id;
    this._nome = nome;
    this._tipo = tipo;
    this._descricao = descricao;
    this._urlFoto = urlFoto;
    this._urlVideo = urlVideo;
    this._latitude = latitude;
    this._longitude = longitude;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get nome => _nome;
  set nome(String nome) => _nome = nome;
  String get tipo => _tipo;
  set tipo(String tipo) => _tipo = tipo;
  String get descricao => _descricao;
  set descricao(String descricao) => _descricao = descricao;
  String get urlFoto => _urlFoto;
  set urlFoto(String urlFoto) => _urlFoto = urlFoto;
  String get urlVideo => _urlVideo;
  set urlVideo(String urlVideo) => _urlVideo = urlVideo;
  String get latitude => _latitude;
  set latitude(String latitude) => _latitude = latitude;
  String get longitude => _longitude;
  set longitude(String longitude) => _longitude = longitude;

  Carros.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nome = json['nome'];
    _tipo = json['tipo'];
    _descricao = json['descricao'];
    _urlFoto = json['urlFoto'];
    _urlVideo = json['urlVideo'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nome'] = this._nome;
    data['tipo'] = this._tipo;
    data['descricao'] = this._descricao;
    data['urlFoto'] = this._urlFoto;
    data['urlVideo'] = this._urlVideo;
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    return data;
  }
}