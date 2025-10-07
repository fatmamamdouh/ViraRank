import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key, required this.controller, required this.hint, this.validate});

  final TextEditingController controller;
  final String hint;
  final FormFieldValidator<String>? validate;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: SizedBox(
        child: TextFormField(
          controller: controller,
          validator: validate,
          decoration: InputDecoration(
              fillColor: Color(0xffF0F0F0),
              filled: true,
              hintText: hint,
              hintStyle: TextStyle(color: const Color.fromARGB(255, 82, 82, 82),fontWeight: FontWeight.bold),
              border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 20)
          ),
        ),
      ),
    );
  }
}
