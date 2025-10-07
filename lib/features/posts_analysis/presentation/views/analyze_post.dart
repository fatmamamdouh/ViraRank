import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/features/posts_analysis/presentation/views/post_result.dart';
import 'package:ieee/components/components.dart';
import '../../../websites_analysis_screen/presentation/views/website_analysis_widget/custom_elevated_button.dart';
import '../../../websites_analysis_screen/presentation/views/website_analysis_widget/fieldForLink.dart';
import '../manager/posts_analysis_cubit/posts_analysis_cubit.dart';
import '../manager/posts_analysis_cubit/posts_analysis_state.dart';

class Analyzepost extends StatelessWidget {
  const Analyzepost({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsAnalysisCubit, PostsAnalysisStates>(
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white,
          appBar: customAppBar("analyze post", context),
          body: SingleChildScrollView(
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text('Optimize your social content',style: TextStyle(color: Color(0xff5893D4),fontWeight: FontWeight.bold,fontSize: 32,fontFamily: 'Ubuntu'),),
                ),
                SizedBox(height: 30,),
                Fieldforlink(
                    hintText: 'Enter post content',
                    controller: PostsAnalysisCubit.get(context).postsController,
                ),
                SizedBox(height: 15,),
                BlocConsumer<PostsAnalysisCubit, PostsAnalysisStates>(
                  builder: (context, state) => CustomElevatedButton(
                    textOfButton: "Analyze Post",
                    onPressed: ()
                    {
                      PostsAnalysisCubit.get(context).getViralPosts();
                    },
                  ),
                  listener: (context, state) {
                    if (state is GetViralPostsSuccessState) {
                      final model = PostsAnalysisCubit.get(context).postsModel;
                       navigateTo(PostResult(
                         postsModel: model!,
                       ), context);
                    }
                  },
                ),
                Image.asset('assets/images/spot.png')
              ],
            ),
          ),
        )
    );
  }
}