import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:route_task/model/post_response.dart';

class PostManger {
  static Future<PostResponse> getPost({int page = 1}) async {
    Uri url = Uri.parse("https://gorest.co.in/public/v2/posts?page=$page");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return PostResponse.fromJson(json);
    } else {
      throw "Something went wrong";
    }
  }
}
