class CommentResponse {
  CommentResponse({
      this.commentModel,});

  CommentResponse.fromJson(List<dynamic> json) {
      commentModel = [];
      json.forEach((v) {
        commentModel?.add(CommentModel.fromJson(v));
      });

  }
  List<CommentModel>? commentModel;

}

class CommentModel {
  CommentModel({
      this.id, 
      this.postId, 
      this.name, 
      this.email, 
      this.body,});

  CommentModel.fromJson(dynamic json) {
    id = json['id'];
    postId = json['post_id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
  num? id;
  num? postId;
  String? name;
  String? email;
  String? body;

}