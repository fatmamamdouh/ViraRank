import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/components/components.dart';
import '../../platform_screen_widget/social_icon.dart';
import '../manager/posts_analysis_cubit/posts_analysis_cubit.dart';
import '../manager/posts_analysis_cubit/posts_analysis_state.dart';
import 'analyze_post.dart';


class PlatformView extends StatelessWidget {
  const PlatformView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar("analyze post", context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'select platform',
                style: TextStyle(
                  color: Color(0xff5893D4),
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  fontFamily: 'Ubuntu'
                ),
              ),
            ),
            SizedBox(height: 50),
            BlocBuilder<PostsAnalysisCubit, PostsAnalysisStates>(
              builder: (context, state) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      PostsAnalysisCubit.get(context).instagramPlatform();
                      navigateTo(Analyzepost(), context);
                    },
                    child: SocialIcon(img: 'assets/images/instagram.png',),
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                      PostsAnalysisCubit.get(context).facebookPlatform();
                      navigateTo(Analyzepost(), context);
                    },
                    child: SocialIcon(img: 'assets/images/facebook.png',),
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                      PostsAnalysisCubit.get(context).linkedInPlatform();
                      navigateTo(Analyzepost(), context);
                    },
                    child: SocialIcon(img: 'assets/images/linkedin.png',),
                  ),
                  GestureDetector(
                    onTap: () {
                      PostsAnalysisCubit.get(context).twitterPlatform();
                      navigateTo(Analyzepost(), context);
                    },
                    child: SocialIcon(img: 'assets/images/X.png',),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Image.asset('assets/images/analyze_post_png.png'),
          ],
        ),
      ),
    );
  }
}
