import 'package:flutter/material.dart';
import 'package:ieee/features/auth/presentation/views/welcome_view_widget/button_widget.dart';
import 'sign_in.dart';
import 'sign_up.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/welcome_png1.png',
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/welcome_png4.png',
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 120,
              right: 80,
              child: Image.asset('assets/images/welcome_png2.png'),
            ),
            Positioned(
              bottom: 160,
              left: 30,
              child: Image.asset('assets/images/welcome_png3.png'),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    Image.asset('assets/images/ViraRank.png', width: 280),
                    SizedBox(height: 120),
                    Image.asset('assets/images/welcome.png'),
                    SizedBox(height: 80),
                    ButtonWidget(txt: 'Sign in', page: SignIn()),
                    ButtonWidget(txt: 'Sign up', page: SignUp()),
                    SizedBox(height: 10),
                    Container(
                      width: 110,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
