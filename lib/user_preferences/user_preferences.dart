import 'dart:convert';
import 'package:vidyalayas/modals/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? preferences;

  static Future setLoginDetails(LoginModel model) async {
    preferences = await SharedPreferences.getInstance();
    return preferences!.setString('login_details', jsonEncode(model.toJson()));
  }

  static Future getLoginDetails() async {
    preferences = await SharedPreferences.getInstance();
    return (preferences!.getString(
                  "login_details",
                ) !=
                null &&
            preferences!.getString('login_details') != null
        ? LoginModel.fromJson(
            jsonDecode(preferences!.getString('login_details')!))
        : null);
  }

  static Future<bool> isLoggedIn() async {
    bool isLoggedIn = false;
    final preferences = await SharedPreferences.getInstance();
   print(preferences.getString('login_details'));
    if (preferences.getString(
              "login_details",
            ) !=
            "null" &&
        preferences.getString('login_details') != null) {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
    // print(isLoggedIn);
    // print(preferences.getString("login_details"));
    return isLoggedIn;
  }

  static Future logOut() async {
    await setLoginDetails(LoginModel(status: null, token: null));
  }
}
