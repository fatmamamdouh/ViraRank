import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/features/posts_analysis/presentation/views/select_platform.dart';
import 'package:ieee/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:ieee/features/profile/presentation/manager/profile_cubit/profile_states.dart';
import 'package:ieee/features/websites_analysis_screen/presentation/views/analyze_website.dart';
import 'package:ieee/features/setting/settings_view.dart';
import 'package:ieee/components/components.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/ViraRank.png', width: 110),
                    BlocConsumer<ProfileCubit, ProfileStates>(
                      builder: (context, state) {
                         return GestureDetector(
                           onTap: ()
                           {
                             ProfileCubit.get(context).getUserProfile();
                           },
                           child: CircleAvatar(
                             radius: 20,
                             backgroundImage: AssetImage('assets/images/profile.jpg'),
                           ),
                         );
                      },
                      listener: (context, state)
                      {
                        if(state is GetProfileSuccessState)
                        {
                          navigateTo(Settings(
                            profileModel: ProfileCubit.get(context).profileModel!,
                          ), context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:  Text('Start your analysis with one click',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 35,fontFamily: 'Ubuntu'),),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              navigateTo(website_analysis(), context);
            },
            child: SizedBox(
              height: 70,
              width: 270,
              child: Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                    side: BorderSide(color:  const Color.fromARGB(255, 231, 229, 229),)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Analyze Website',style: TextStyle(color:Color(0xff5893D4),fontWeight: FontWeight.bold ,fontSize: 20),),
                    SizedBox(width: 30,),
                    Icon(Icons.arrow_forward_ios,color: Color(0xff5893D4),)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PlatformView()));
            },
            child: SizedBox(
              height: 70,
              width: 270,
              child: Card(
                elevation: 5,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                    side: BorderSide(color:  const Color.fromARGB(255, 231, 229, 229),)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Analyze Post',style: TextStyle(color:Color(0xff5893D4),fontWeight: FontWeight.bold ,fontSize: 20),),
                    SizedBox(width: 30,),
                    Icon(Icons.arrow_forward_ios,color: Color(0xff5893D4),)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Image.asset('assets/images/home_png.png',height: 300,)
        ],
      ),
    );
  }
}
