

import '../../../data/login_model.dart';

abstract class LogInStates {}

class LoginInitialState extends LogInStates{}

class LoginSuccessState extends LogInStates
{
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginLoadingState extends LogInStates{}

class LoginErrorState extends LogInStates
{
}