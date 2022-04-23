import 'dart:async';


import 'package:list_car/pages/login/login_api.dart';
import 'package:list_car/pages/login/usuario.dart';

import 'api_response.dart';

class LoginBloc {
  final _streamControllerShProgress = StreamController<bool>();
  get stramControllerProgress => _streamControllerShProgress.stream;

  Future<ApisResponse<Usuario>> login(String login, String senha) async {
    _streamControllerShProgress.add(true);
    ApisResponse response = await LoginApi.login(login, senha);
    _streamControllerShProgress.add(false);
    return response;
  }

  void dispose() {
    _streamControllerShProgress.close();
  }
}
