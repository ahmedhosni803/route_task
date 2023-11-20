class PostResponse {
  PostResponse({
      this.postModel,});

  PostResponse.fromJson(dynamic json) {
      postModel = [];
      json.forEach((v) {
        postModel?.add(PostModel.fromJson(v));
      });

  }
  List<PostModel>? postModel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (postModel != null) {
      map['PostModel'] = postModel?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class PostModel {
  PostModel({
      this.id, 
      this.userId, 
      this.title,
    this.userName,
      this.body,});
  num? id;
  num? userId;
  String? title;
  String? userName;
  String? body;
  PostModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    body = json['body'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['title'] = title;
    map['body'] = body;
    return map;
  }

}