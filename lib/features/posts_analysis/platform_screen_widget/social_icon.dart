import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({super.key, required this.img});

  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,height: 45,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey)
      ),
      child: Center(child: Image.asset('$img',width: 25,height: 25,)),
    );
  }
}
