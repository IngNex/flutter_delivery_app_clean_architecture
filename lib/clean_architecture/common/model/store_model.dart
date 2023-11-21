class StoreModel {
  String? id;
  String? email;
  String? token;

  StoreModel(this.id, this.email, this.token);

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id!,
      'email': email!,
      'token': token!,
    };
  }
}
