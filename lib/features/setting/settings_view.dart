import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/features/profile/data/profile_model.dart';
import 'package:ieee/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:ieee/features/profile/presentation/manager/profile_cubit/profile_states.dart';
import 'package:ieee/features/setting/about_view.dart';
import 'package:ieee/features/setting/rate_app_view.dart';
import 'package:ieee/features/setting/setting_screens_widgets/profile_card_widget.dart';
import 'package:ieee/features/setting/setting_screens_widgets/setting_options.dart';
import 'package:ieee/features/profile/presentation/views/edit_profile_view.dart';
import 'package:ieee/features/setting/security_privacy.dart';
import 'package:ieee/components/components.dart';

class Settings extends StatelessWidget {
  const Settings({super.key, required this.profileModel});

  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      builder: (context, state)
      {
        if(state is GetProfileSuccessState)
        {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: customAppBar("Setting", context),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50,),
                    Text('Account',style: TextStyle(color: Colors.black,fontSize: 23),),
                    SizedBox(height: 20,),
                    BlocConsumer<ProfileCubit, ProfileStates>(
                      builder: (context, state) => GestureDetector(
                        onTap: () {
                          navigateTo(Editprofile(profileModel: ProfileCubit.get(context).profileModel!,), context);
                        },
                        child: ProfileCardWidget(model: profileModel,),
                      ),
                      listener: (context, state)
                      {},
                    ),
                    SizedBox(height: 80,),
                    Text('Setting',style: TextStyle(color: Colors.black,fontSize: 23),),
                    SizedBox(height: 10,),
                    SettingOptions(
                        icon: Icons.info,
                        title: 'About this App',
                        onTap: ()
                        {
                          navigateTo(About(), context);
                        }
                    ),
                    SettingOptions(
                        icon: Icons.lock_outline,
                        title: 'Security and Privacy',
                        onTap: ()
                        {
                          navigateTo(Security_Privacy(), context);
                        }
                    ),
                    SettingOptions(
                        icon: Icons.star,
                        title: 'Rate App',
                        onTap: ()
                        {
                          navigateTo(Rateapp(), context);
                        }
                    ),
                  ],
                ),
              ),
            ),
          );
        } else
        {
          return Center(child: CircularProgressIndicator(
            color: Colors.blue,
            backgroundColor: Colors.white,
          ));
        }
      },
      listener: (context, state) => {},
    );
  }
}
