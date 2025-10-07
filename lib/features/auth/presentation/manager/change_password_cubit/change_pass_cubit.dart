import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/network/local/shared_pref.dart';
import 'package:ieee/network/remote/dio_helper.dart';
import '../../../../../network/remote/end_points.dart';
import 'change_pass_states.dart';

class ChangePassCubit extends Cubit<ChangePassStates> {
  ChangePassCubit() : super(ChangePassInitialState());

  static ChangePassCubit get(context) => BlocProvider.of(context);

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void changePassword()
  {
    emit(ChangePassLoadingState());
    final token = LocalStorage.token;
    DioHelper.postData(
      token: token,
        url: CHANGEPASSWORD,
        data:
        {
          'oldPassword' : oldPasswordController.text,
          'newPassword' : newPasswordController.text,
          'confirmNewPassword' : confirmPasswordController.text,
        }
    ).then((value)
    {
      print("Password changed successfully");
      emit(ChangePassSuccessState());
    }).catchError((error)
    {
      print("error occured when change password : ${error.toString()}");
      emit(ChangePassErrorState());
    });
  }
}