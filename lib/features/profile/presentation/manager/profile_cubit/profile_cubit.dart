import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/features/profile/data/profile_model.dart';
import 'package:ieee/features/profile/presentation/manager/profile_cubit/profile_states.dart';
import 'package:ieee/network/local/shared_pref.dart';
import 'package:ieee/network/remote/end_points.dart';

import '../../../../../network/remote/dio_helper.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of<ProfileCubit>(context);

  ProfileModel? profileModel;


  Future<void> getUserProfile() async
  {
    emit(GetProfileLoadingState());

    await DioHelper.getData(
        url: GETPROFILE,
      token: LocalStorage.token,
    ).then((onValue){
      profileModel = ProfileModel.fromJson(onValue.data);
      print("The profile data is : ${onValue.data}");
      emit(GetProfileSuccessState());
    })  .catchError((error){
      print('error when get profile is : ${error.toString()}');
      emit(GetProfileFailureState());
    });
  }
}
