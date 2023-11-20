import 'package:flutter/material.dart';
import 'package:route_task/apis/comment_api.dart';

import '../model/comment_response.dart';

class DetailsViewModel extends ChangeNotifier {
  List<CommentModel> comments = [];
  bool isLoading = true;
  getComments(String id) {
    CommentManger.getComments(id).then((value) {
      comments = value.commentModel ?? [];
      isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
