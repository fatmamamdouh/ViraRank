import 'package:flutter/material.dart';
import 'package:ieee/components/components.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.txt, required this.page});

  final String txt;
  final Widget page;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()
      {
        navigateTo(page, context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.grey),
        minimumSize: Size(130, 35),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        '$txt',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            fontFamily: 'Ubuntu'
        ),
      ),
    );
  }
}
