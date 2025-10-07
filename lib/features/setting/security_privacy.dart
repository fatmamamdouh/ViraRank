import 'package:flutter/material.dart';
import 'package:ieee/features/setting/privacy_view.dart';
import 'package:ieee/features/setting/setting_screens_widgets/setting_options.dart';
import '../../components/components.dart';
import '../auth/presentation/views/changePassword.dart';

class Security_Privacy extends StatelessWidget {
  const Security_Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("security and privacy", context),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
          SettingOptions(
              title: 'Change Password',
              onTap: ()
              {
                navigateTo(Change_password(), context);
              }
          ),
            SizedBox(height: 10,),
            SettingOptions(
                title: 'Privacy',
                onTap: ()
                {
                  navigateTo(Privacy(), context);
                },
            ),
          ],
        ),
      ),
    );
  }
}