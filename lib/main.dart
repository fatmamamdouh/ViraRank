import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:ieee/features/splash_view.dart';
import 'features/posts_analysis/presentation/manager/posts_analysis_cubit/posts_analysis_cubit.dart';
import 'features/websites_analysis_screen/presentation/manager/website_analysis_cubit/website_analysis_cubit.dart';
import 'network/local/shared_pref.dart';
import 'network/remote/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await LocalStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => WebsiteAnalysisCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => PostsAnalysisCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ProfileCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(titleTextStyle: TextStyle(fontFamily: 'Bruno')),
        ),
        home: SplashScreen(),

      ),
    );
  }
}
