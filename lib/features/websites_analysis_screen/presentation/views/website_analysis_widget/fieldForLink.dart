import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fieldforlink extends StatelessWidget {
  const Fieldforlink({super.key, required this.hintText, required this.controller});

  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42.0),
      child: SizedBox(
        height: 70,
        child: Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23),
                side: BorderSide(color:  const Color.fromARGB(255, 231, 229, 229),)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(color: Color(0xffC8E6F5)),
                    border: OutlineInputBorder(borderSide: BorderSide.none)
                ),
              ),
            )
        ),
      ),
    );
  }
}
