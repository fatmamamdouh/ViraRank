import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/features/auth/presentation/manager/sign_up_cubit/sign_up_states.dart';
import '../../../../../network/remote/dio_helper.dart';
import '../../../../../network/remote/end_points.dart';
import '../../../data/login_model.dart';


class SignUpCubit extends Cubit<SignUpStates> {

  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of<SignUpCubit>(context);

  var formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var usernameController = TextEditingController();

  var githubController = TextEditingController();

  final TextEditingController dayController = TextEditingController();

  final TextEditingController monthController = TextEditingController();

  final TextEditingController yearController = TextEditingController();


  bool isSecure = true;

  LoginModel? signUpModel;

  void registerUser()
  {
    emit(RegisterLoadingState());

    DioHelper.postData(
        url: SIGNUP,
        data: {
          'userName' : usernameController.text,
          'email' : emailController.text,
          'birthDate' : "${yearController.text}-${monthController.text}-${dayController.text}T00:00:00Z",
          'gender' : false,
          'password' : passwordController.text,
          'githubToken' : githubController.text,
        }).then((onValue){
      print(onValue.data);
      signUpModel = LoginModel.fromJson(onValue.data);
      emit(RegisterSuccessState());
    }).catchError((error){
      print('error is : ${error.toString()}');
      emit(RegisterErrorState());
    });
  }

}