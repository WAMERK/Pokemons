class AuthModel {
  late String access_token;
  String? token_type;

  AuthModel({required this.access_token, this.token_type});

  AuthModel.fromJson(Map<String, dynamic> json) {
    access_token = json['access_token'];
    token_type = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = access_token;
    data['token_type'] = token_type;

    return data;
  }

  @override
  Map<String, dynamic> toMap() => {
        "access_token": access_token,
        "token_type": token_type,
      }..removeWhere((key, value) => value == null);
}
