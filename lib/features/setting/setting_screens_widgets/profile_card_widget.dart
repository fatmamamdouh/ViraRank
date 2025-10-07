import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ieee/features/profile/data/profile_model.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({super.key, required this.model});

  final ProfileModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(model.imageUrl?? 'assets/images/profile.jpg'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.userName,style: TextStyle(color: Colors.black,fontSize: 22),),
            Text(model.email,style: TextStyle(color: Colors.black,fontSize: 17),)
          ],
        ),
        SizedBox(width: 30,),
        Icon(Icons.arrow_forward_ios,color: Color(0xff5893D4),)
      ],
    );
  }
}
