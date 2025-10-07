import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderShow extends StatelessWidget {
  const SliderShow({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
