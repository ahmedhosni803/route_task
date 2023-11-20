import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:route_task/model/comment_response.dart';

class CommentManger {
  static Future<CommentResponse> getComments(String id) async {
    Uri url = Uri.parse("https://gorest.co.in/public/v2/posts/$id/comments");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    return CommentResponse.fromJson(json);
  }
}
