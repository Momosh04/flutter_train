import 'package:dio/dio.dart';
import 'package:herry_up/core/config/dependency_injection.dart';
import 'package:herry_up/core/data/model/login_model.dart';
import 'package:herry_up/core/data/model/signup_model.dart';
import 'package:herry_up/core/data/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthService extends BaseService {
  signUP(ModAuth signup);
  logIn(Mod_login login);
}

class AuthServiceImp extends AuthService {
  @override
  signUP(ModAuth signup) async {
    Response response = await dio.post(baseUrl, data: signup.toJson());
    if (response.statusCode == 200) {
      String token = response.data['token'];
      storage.get<SharedPreferences>().setString('token', token);
      return true;
    } else {
      return false;
    }
  }

  logIn(Mod_login login) async {
    Response response = await dio.post(baseUrl, data: login.toJson());
    if (response.statusCode == 200) {
      String token = response.data['token'];
      storage.get<SharedPreferences>().setString('token', token);
      return true;
    } else {
      return false;
    }
  }
}
