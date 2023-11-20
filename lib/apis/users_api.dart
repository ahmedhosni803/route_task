import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user_response.dart';

class UserManger {
  static Future<UserModel> getUser(String id) async {
    Uri url = Uri.parse("https://gorest.co.in/public/v2/users/$id");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return UserModel.fromJson(json);
    } else {
      throw "Something went wrong";
    }
  }
}
