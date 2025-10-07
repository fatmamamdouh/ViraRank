class LoginModel
{
  String token;
  String githubToken;

  LoginModel(
      this.token,
      this.githubToken,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json)
  {
    return LoginModel(
        json['token'],
        json['githubToken'],
    );
  }
}