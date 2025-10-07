import 'package:flutter/material.dart';
import 'package:ieee/features/profile/data/profile_model.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key, required this.profileModel});

  final ProfileModel profileModel;
  @override
  State<Editprofile> createState() => _EditprofileState();
}

enum Gender { male, female }

class _EditprofileState extends State<Editprofile> {
  Gender? selected_gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new, color: Color(0xff5893D4)),onPressed: () => Navigator.pop(context),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'EDIT PROFILE',
                style: TextStyle(color: Colors.black, fontSize: 25,fontFamily: 'Bruno'),
              ),
              SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(widget.profileModel.imageUrl ?? 'assets/images/profile.jpg'),
                    ),
                    Text(
                      widget.profileModel.userName,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Change Picture',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Text(
                    'Name',
                    style: TextStyle(color: Color(0xff5893D4), fontSize: 20),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            widget.profileModel.userName,
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    'Gender',
                    style: TextStyle(color: Color(0xff5893D4), fontSize: 20),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected_gender = Gender.male;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: selected_gender == Gender.male
                              ? Color(0xff73B9D7)
                              : Color.fromARGB(255, 245, 243, 243),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.male,
                        color: selected_gender == Gender.male
                            ? Colors.white
                            : Color(0xffD9D9D9),
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected_gender = Gender.female;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: selected_gender == Gender.female
                            ? Color(0xff73B9D7)
                            : Color.fromARGB(255, 245, 243, 243),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.female,
                        color: selected_gender == Gender.female
                            ? Colors.white
                            : Color(0xffD9D9D9),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
        
              Row(
                children: [
                  Text(
                    'BirthDate',
                    style: TextStyle(color: Color(0xff5893D4), fontSize: 20),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            widget.profileModel.birthDate,
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
        
              Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(color: Color(0xff5893D4), fontSize: 20),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            widget.profileModel.email,
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
