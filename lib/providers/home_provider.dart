// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:route_task/model/user_response.dart';

import '../apis/posts_api.dart';
import '../apis/users_api.dart';
import '../model/post_response.dart';

class HomeViewModel extends ChangeNotifier {
  bool _disposed = false;
  ScrollController scrollController = ScrollController();
  int page = 1;
  HomeViewModel() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          getPosts();
          notifyListeners();
        }
      }
    });
  }
  List<PostModel> posts = [];
  bool isLoading = true;
  bool isError = false;
  getPosts() async {
    PostResponse postsResponse;
    await PostManger.getPost(page: page++).then((value) {
      postsResponse = value;
      if (posts.isEmpty) {
        posts = postsResponse.postModel ?? [];
      } else {
        posts.addAll(postsResponse.postModel!);
      }
      posts.forEach((element) async {
        element.userName ??= await getUsers(element.userId.toString());
        notifyListeners();
      });
      isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isLoading = false;
      isError = true;
      notifyListeners();
    });
  }

  UserModel? user;
  Future getUsers(String id) async {
    UserModel data = await UserManger.getUser(id);
    user = data;
    return user?.name;
  }

  // getUsername(int userId) {
  //   String name = 'anonymous';
  //   users.forEach((element) {
  //     if (element.id!.toInt() == userId) {
  //       name = element.name ?? "anonymous";
  //     }
  //   });
  //   print("name");
  //
  //   return name;
  // }

  getUsersAndPosts() async {
    // await getUsers();
    getPosts();
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
