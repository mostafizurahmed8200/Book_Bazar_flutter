class LoginSqlModel {
  String? loginFlag;

  LoginSqlModel({
    required this.loginFlag,
  });

  Map<String, dynamic> toMap() {
    return {
      'loginFlag': loginFlag,
    };
  }
}
