import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:vidyalayas/modals/game_model.dart';
import 'package:vidyalayas/modals/login_model.dart';
import 'package:vidyalayas/modals/user_model.dart';

class ApiServices {
  static Future<bool> validateLogin({username, password}) async {
    String url = 'iomad314159.chimpvine.com';

    final loginUrl = Uri.https('$url', "/TestApi/login.php");
    var response = await http.post(
      loginUrl,
      body: {
        'username': username,
        'password': password,
      },
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  static Future<LoginModel> getLoginToken({username, password}) async {
    String url = 'iomad314159.chimpvine.com';

    final loginUrl = Uri.https('$url', "/TestApi/login.php");
    var response = await http.post(
      loginUrl,
      body: {
        'username': username,
        'password': password,
      },
      encoding: Encoding.getByName("utf-8"),
    );
    LoginModel result = loginModelFromJson(response.body);
    return result;
  }

  static Future<GameModel> getGameInfo({token}) async {
    String url = 'iomad314159.chimpvine.com';

    final loginUrl = Uri.https('$url', "/TestApi/game.php");
    var response = await http.get(
      loginUrl,
      headers: {
        HttpHeaders.authorizationHeader: 'Token $token',
      },
    );
    GameModel result = gameModelFromJson(response.body);
    return result;
  }

  static Future<UserModel> getUserInfo({token}) async {
    String url = 'iomad314159.chimpvine.com';

    final loginUrl = Uri.https('$url', "/TestApi/user.php");
    var response = await http.get(
      loginUrl,
      headers: {
        HttpHeaders.authorizationHeader: 'Token $token',
      },
    );
    UserModel result = userModelFromJson(response.body);

    return result;
  }

  static Future<UserModel> postUserInfo(
      {email, age, school, number, token}) async {
    String url = 'iomad314159.chimpvine.com';

    final loginUrl = Uri.https('$url', "/TestApi/user.php");
    var response = await http.post(loginUrl, headers: {
      HttpHeaders.authorizationHeader: 'Token $token',
    }, body: {
      'email': email,
      'age': age,
      'school': school,
      'number': number,
    });
    UserModel data = userModelFromJson(response.body);
    return data;
  }

  static Future<UserModel> putUserInfo(
      {email, age, school, number, token}) async {
    String url = 'iomad314159.chimpvine.com';

    Map<String, String> params = {
      'email': email,
      'age': age,
      'school': school,
      'number': number,
    };

    final loginUrl = Uri.https('$url', "/TestApi/user.php");
    var response = await http.put(
      loginUrl,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      encoding: Encoding.getByName("utf-8"),
      body: params,
    );
    UserModel result = userModelFromJson(response.body);
    return result;
  }
}
