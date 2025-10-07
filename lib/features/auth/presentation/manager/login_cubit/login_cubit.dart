import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/login_model.dart';
import '../../../../../network/local/shared_pref.dart';
import '../../../../../network/remote/dio_helper.dart';
import '../../../../../network/remote/end_points.dart';
import 'login_states.dart';

class LogInCubit extends Cubit<LogInStates>
{
  LogInCubit() : super(LoginInitialState());

  static LogInCubit get(context) => BlocProvider.of<LogInCubit>(context);


  var formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool isSecure = true;


  LoginModel? loginModel;

  void userLogIn()
  {
    emit(LoginLoadingState());

    DioHelper.postData(
        url: LOGIN,
        data: {
          'email' : emailController.text,
          'password' : passwordController.text,
        }).then((onValue){
      print("data from login request ${onValue.data}");
      loginModel = LoginModel.fromJson(onValue.data);
      LocalStorage.saveToken(loginModel!.token);
      LocalStorage.saveGithubToken(loginModel!.githubToken);
      print("token is : ${LocalStorage.token}");
      emit(LoginSuccessState(loginModel!));
    }).catchError((error){
      print('error is : ${error.toString()}');
      emit(LoginErrorState());
    });
  }

}

