import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/sign_up_cubit/sign_up_cubit.dart';
import '../../manager/sign_up_cubit/sign_up_states.dart';


class GenderButtonWidget extends StatelessWidget {
  const GenderButtonWidget({super.key, required this.gender});

  final String gender;


  @override
  Widget build(BuildContext context) {
    String? selectedGender;
    bool isSelected = selectedGender == gender;
    return BlocBuilder<SignUpCubit, SignUpStates>(
        builder : (context, state) => GestureDetector(
          onTap: (){
            selectedGender = gender;
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_checked,
                  color: isSelected ? const Color(0xff5893D4) : Colors.grey,
                ),
                const SizedBox(width: 6),
                Text(
                  gender,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ],
            ),
          ),
        )
    );;
  }
}
