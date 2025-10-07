import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/features/posts_analysis/presentation/manager/posts_analysis_cubit/posts_analysis_state.dart';
import 'package:ieee/features/posts_analysis/data/posts_model.dart';
import '../../../../../network/local/shared_pref.dart';
import '../../../../../network/remote/dio_helper.dart';
import '../../../../../network/remote/end_points.dart';

class PostsAnalysisCubit extends Cubit<PostsAnalysisStates> {
  PostsAnalysisCubit() : super(PostsAnalysisInitialState());

  static PostsAnalysisCubit get(context) => BlocProvider.of<PostsAnalysisCubit>(context);

  String? platform;

  void twitterPlatform()
  {
    platform = 'Twitter';
    emit(ChangePlatformState());
  }

  void facebookPlatform()
  {
    platform = 'Facebook';
    emit(ChangePlatformState());
  }

  void linkedInPlatform()
  {
    platform = 'LinkedIn';
    emit(ChangePlatformState());
  }

  void instagramPlatform()
  {
    platform = 'Instagram';
    emit(ChangePlatformState());
  }

  var postsController = TextEditingController();

  PostsModel? postsModel;

  Future<void> getViralPosts() async
  {
    emit(GetViralPostsLoadingState());

    await DioHelper.postData(
        token: LocalStorage.token,
        url: TRENDANALYZE,
        data: {
          'text' : postsController.text,
          'platform' : platform,
        }).then((onValue){
      postsModel = PostsModel.fromJson(onValue.data);
      print("The Viral Response is : ${onValue.data}");
      print(platform);
      emit(GetViralPostsSuccessState());
    })  .catchError((error){
      print('error is : ${error.toString()}');
      emit(GetViralPostsErrorState());
    });
  }
}