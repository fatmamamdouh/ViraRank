import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateTo(Widget screen, context)
{
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

PreferredSizeWidget customAppBar(String title, context) => AppBar(
  backgroundColor: Colors.white,
  leading: IconButton(
    onPressed: () => Navigator.pop(context),
    icon: Icon(Icons.arrow_back_ios, color: Color(0xff5893D4)),
  ),
  title: Text(
    title,
    style: TextStyle(color: Colors.black, fontSize: 25),
  ),
);