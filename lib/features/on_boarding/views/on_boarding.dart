import 'package:flutter/material.dart';
import 'package:ieee/Lists/on-boardingList.dart';
import 'package:ieee/features/auth/presentation/views/welcome.dart';
import 'package:ieee/features/on_boarding/views/on_boarding_widgets/slider_show.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int index = 0;
  double height = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Welcome())),
              child: Text('Skip', style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 23,
                    ),),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('${on_boarding[index]['image']}'),
                  SizedBox(height: 50),
                  Text(
                    '${on_boarding[index]['text']}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 60),
                  SizedBox(
                    width: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SliderShow(width: index == 0 ? 20 : 10),
                        SliderShow(width: index == 1 ? 20 : 10),
                        SliderShow(width: index == 2 ? 20 : 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 10 + height),                                  
                  Align( alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          if (index < on_boarding.length - 1) {
                            setState(() {
                              index++;
                              height = index == 2 ? 20 : 0;
                            });
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Welcome(),
                              ),
                            );
                          }                          
                        },
                        
                        child: Container(
                          width: 50,height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: Container(
                              width: 40, height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 30,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

