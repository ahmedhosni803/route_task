class UserResponse {
  List<UserModel>? userModel;

  UserResponse({this.userModel});

  UserResponse.fromJson(List<dynamic> json) {
      userModel = <UserModel>[];
      json.forEach((v) {
        userModel!.add(new UserModel.fromJson(v));
      });

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userModel != null) {
      data['user_model'] = this.userModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserModel {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  UserModel({this.id, this.name, this.email, this.gender, this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['status'] = this.status;
    return data;
  }
}
