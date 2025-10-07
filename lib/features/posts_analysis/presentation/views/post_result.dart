import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/features/posts_analysis/data/posts_model.dart';

import '../../../../components/components.dart';
import '../manager/posts_analysis_cubit/posts_analysis_cubit.dart';
import '../manager/posts_analysis_cubit/posts_analysis_state.dart';

class PostResult extends StatelessWidget {
  const PostResult({super.key, required this.postsModel});

  final PostsModel postsModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsAnalysisCubit, PostsAnalysisStates>(
      builder: (context, state)
      {
        if(state is GetViralPostsSuccessState)
        {
          return Scaffold(
            backgroundColor: Color(0xffEDEFF3),
            appBar: customAppBar("Result", context),
            body: SingleChildScrollView(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Posts overview',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 12,
                                  ),
                                  child: Text(
                                    'Rank',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: postsModel.viral ? Color(0xff27D095) : Color(0xffE74C3C),
                                        width: 20,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        postsModel.viral
                                            ? Image.asset('assets/images/up.png', width: 35, height: 35,)
                                            : Image.asset('assets/images/down.png', width: 35, height: 35,),
                                        SizedBox(height: 10),
                                        Text(
                                          postsModel.viral ? 'match' : 'not match',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Ubuntu',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 12,
                                ),
                                child: Text(
                                  'Chance to appear in search',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Ubuntu',
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 65.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 280,
                                      child: SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          trackHeight: 12,
                                          thumbShape: SliderComponentShape.noThumb,
                                          overlayShape: SliderComponentShape.noThumb,
                                          activeTrackColor: Color(0xff0000FF),
                                          inactiveTrackColor: Colors.grey.shade300,
                                        ),
                                        child: Slider(
                                          min: 0,
                                          max: 100,
                                          value:  postsModel.probability,
                                          onChanged: (value) {
                                            postsModel.probability = value ;
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Text(
                                        '${postsModel.probability.toInt()}%',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        else if(state is GetViralPostsLoadingState)
        {
          return Center(child: CircularProgressIndicator());
        } else
        {
          return Text("");
        }
      },
    );
  }
}
