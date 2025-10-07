import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/features/auth/presentation/views/sign_up_widgets/date_box_widget.dart';
import 'package:ieee/features/auth/presentation/views/sign_up_widgets/gender_button_widget.dart';
import 'package:ieee/features/home.dart';
import '../../../posts_analysis/platform_screen_widget/social_icon.dart';
import 'sign_in.dart';
import '../manager/sign_up_cubit/sign_up_cubit.dart';
import '../manager/sign_up_cubit/sign_up_states.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});


  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocBuilder<SignUpCubit, SignUpStates>(
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/signup_png.png',
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Text(
                          'Create',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                        Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                        SizedBox(height: 20),
                        Form(
                          key: SignUpCubit.get(context).formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: SignUpCubit.get(context).usernameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'Please,enter your username';
                                  if (value.length < 4)
                                    return 'User Name shouldn\'t be less than 4 characters';
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person_pin_outlined,
                                    color: Color(0xff5893D4),
                                  ),
                                  hintText: 'User Name',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                              SizedBox(height: 10),

                              TextFormField(
                                controller: SignUpCubit.get(context).emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'Please,enter your email';
                                  if (!value.contains('@'))
                                    return 'Please,enter valid email';
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Color(0xff5893D4),
                                  ),
                                  hintText: 'Email address',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),

                              SizedBox(height: 10),
                              TextFormField(
                                controller: SignUpCubit.get(context).passwordController,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'Please,enter your password';
                                  if (value.length < 8)
                                    return 'Your password should be more than or equal to \n8 characters';
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Color(0xff5893D4),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: SignUpCubit.get(context).githubController,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'Please,enter your github link';
                                  if (!value.contains('token ghp'))
                                    return 'Invalid token';
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset(
                                    'assets/images/github.png',
                                    width: 40,
                                  ),
                                  hintText:
                                  'token ghp-a9ZAkh9AToZoiy8Eg1Ka6A4SXuXW0W23ynMb',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "BirthDate",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Ubuntu',
                                  color: const Color.fromARGB(255, 44, 44, 44),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  DateBoxWidget(hint: "MM", controller: SignUpCubit.get(context).monthController),
                                  DateBoxWidget(hint: "DD", controller: SignUpCubit.get(context).dayController),
                                  DateBoxWidget(hint: "YYYY", controller: SignUpCubit.get(context).yearController),
                                ],
                              ),
                              SizedBox(height: 3),
                              Container(
                                width: double.infinity,
                                height: 2,
                                color: const Color.fromARGB(255, 187, 186, 186),
                              ),

                              SizedBox(height: 10),
                              Text(
                                "Gender",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Ubuntu',
                                  color: const Color.fromARGB(255, 44, 44, 44),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(width: 25),
                                  GenderButtonWidget(gender: "Male"),
                                  SizedBox(width: 15),
                                  GenderButtonWidget(gender: "Female")
                                ],
                              ),
                              SizedBox(height: 3),
                              Container(
                                width: double.infinity,
                                height: 2,
                                color: const Color.fromARGB(255, 187, 186, 186),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sign up',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            BlocBuilder<SignUpCubit, SignUpStates>(
                              builder: (BuildContext context, SignUpStates state) => GestureDetector(
                                onTap: () {
                                  if (SignUpCubit.get(context).formkey.currentState!.validate()) {
                                    SignUpCubit.get(context).registerUser();
                                    if(state is RegisterSuccessState)
                                    {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Home()),
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Color(0xff5893D4),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SocialIcon(img: 'assets/images/google.png'),
                            SocialIcon(img: 'assets/images/facebook.png'),
                            SocialIcon(img: 'assets/images/apple.png'),
                          ],
                        ),
                        SizedBox(height: 50),
                        Center(
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Already have an account?',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Ubuntu',
                                      ),
                                    ),
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SignIn(),
                                            ),
                                          );
                                        },
                                      text: 'sign in',
                                      style: TextStyle(
                                        color: Color(0xff5893D4),
                                        fontFamily: 'Ubuntu',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 120,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //SizedBox(height: 10),
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

