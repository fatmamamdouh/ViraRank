import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/components/components.dart';
import '../../../home.dart';
import '../../../posts_analysis/platform_screen_widget/social_icon.dart';
import '../manager/login_cubit/login_cubit.dart';
import '../manager/login_cubit/login_states.dart';
import 'changePassword.dart';
import 'sign_up.dart';

class SignIn extends StatelessWidget {
   SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LogInCubit(),
      child: BlocBuilder<LogInCubit, LogInStates>(
        builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/signin_png1.png',
                  width: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  'assets/images/signin_png2.png',
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text('Welcome',style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Ubuntu'),),
                      Text('Back!',style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Ubuntu'),),
                      SizedBox(height: 50,),
                      Form(
                        key: LogInCubit.get(context).formkey,
                        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox( width: 200,
                              child: TextFormField(
                                controller: LogInCubit.get(context).emailController,
                                validator: (value) {
                                  if(value == null || value.isEmpty)
                                    return 'Please,enter your email';
                                  if(!value.contains('@'))
                                    return 'Please,enter valid email';
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined,color: Color(0xff5893D4),),
                                  hintText: 'Email address',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(height: 30,),
                            SizedBox( width: 220,
                              child: TextFormField(
                                controller: LogInCubit.get(context).passwordController,
                                obscureText: true,
                                validator: (value) {
                                  if(value == null || value.isEmpty)
                                    return 'Please,enter your password';
                                  if(value.length < 8)
                                    return 'Your password should be more than \nor equal to 8 characters';
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock_outline,color: Color(0xff5893D4),),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sign in',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold,fontFamily: 'Ubuntu'),),
                          BlocConsumer<LogInCubit, LogInStates>(
                            builder: (context, state) => GestureDetector(
                              onTap: () {
                                if(LogInCubit.get(context).formkey.currentState!.validate()){
                                  LogInCubit.get(context).userLogIn();
                                }
                              },
                              child: Container(
                                width: 45, height: 45,
                                decoration: BoxDecoration(
                                    color: Color(0xff5893D4),
                                    shape: BoxShape.circle
                                ),
                                child: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,),
                              ),
                            ),
                            listener: (context, state)
                            {
                              if(state is LoginSuccessState)
                              {
                                navigateTo(Home(), context);
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 40,),
                      const Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialIcon(img: 'assets/images/google.png',),
                          SocialIcon(img: 'assets/images/facebook.png'),
                          SocialIcon(img: 'assets/images/apple.png'),
                        ],
                      ),
                      SizedBox(height: 50,),
                      Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                              },
                              child: Text('Sign up',style: TextStyle(color: Colors.black,fontFamily: 'Ubuntu'),)),
                          SizedBox(width: 20,),
                          GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Change_password())),
                              child: Text('Forget Password?',style: TextStyle(color: Colors.black,fontFamily: 'Ubuntu')))
                        ],
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child: Container(
                          width: 120,height: 3,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(height: 65,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
