import 'package:flutter/material.dart';
import 'package:ieee/components/components.dart';

class Rateapp extends StatefulWidget {
  const Rateapp({super.key});

  @override
  State<Rateapp> createState() => _RateappState();
}

class _RateappState extends State<Rateapp> {
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Rate Us", context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 110,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedRating == index + 1) {
                          selectedRating = 0; 
                        } else {
                          selectedRating = index + 1; 
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(
                        index < selectedRating
                            ? 'assets/images/selected_rate.png' 
                            : 'assets/images/notselected-rate.png', 
                      
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 213, 230, 248),
                  minimumSize: const Size(120, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Color(0xff5893D4), 
                    fontFamily: 'Ubuntu',
                    fontSize: 16
                  ),
                ),
              ),
              Image(image:
              AssetImage("assets/images/ratePage_png.png",),
                width: double.infinity,
                fit: BoxFit.cover,
              )
              // Image.asset(',),
              
            ],
          ),
        ),
      ),
    );
  }
}
