import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/change_password_cubit/change_pass_cubit.dart';
import '../manager/change_password_cubit/change_pass_states.dart';
import 'change_password_screen_widgets/custom_field.dart';

class Change_password extends StatelessWidget {
   Change_password({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChangePassCubit(),
      child: BlocBuilder<ChangePassCubit, ChangePassStates>(
          builder: (context, state) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: ()=> Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios,color: Color(0xff5893D4),)),
              title: Text('CHANGE PASSWORD',style: TextStyle(color: Colors.black,fontSize: 19),),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Form(
                    key: ChangePassCubit.get(context).formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        CustomField(
                          controller: ChangePassCubit.get(context).oldPasswordController,
                          hint: 'Enter your password',
                          validate: (value){
                            if(value == null || value.isEmpty)
                              return 'Please, enter your password';
                          },
                        ),
                        SizedBox(height: 10,),
                        CustomField(
                          controller: ChangePassCubit.get(context).newPasswordController,
                          hint: 'Enter new password',
                          validate: (value){
                            if(value == null || value.isEmpty)
                              return 'Please, enter your new password';
                          },
                        ),
                        SizedBox(height: 10,),
                        CustomField(
                          controller: ChangePassCubit.get(context).confirmPasswordController,
                          hint: 'Confirm your password',
                          validate: (value){
                            if(value == null || value.isEmpty)
                              return 'Please, confirm your new password';
                            if(ChangePassCubit.get(context).confirmPasswordController.text != ChangePassCubit.get(context).newPasswordController.text)
                              return 'wrong password';
                          },
                        ),
                        SizedBox(height: 15,),
                        ElevatedButton(
                          onPressed: (){
                          if(ChangePassCubit.get(context).formKey.currentState!.validate())
                          {
                            ChangePassCubit.get(context).changePassword();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content:
                              Text("Password changed successfully"),
                              width: double.infinity,
                              duration: Duration(seconds: 3),
                              backgroundColor: Color(0xff5893D4),
                              behavior: SnackBarBehavior.floating,
                                ),
                            );
                          }
                        },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff5893D4),
                              minimumSize: Size(270,80),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                          ),
                          child: Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ),

    );
  }
}
