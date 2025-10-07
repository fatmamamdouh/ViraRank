import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({super.key, this.icon, required this.title, required this.onTap});

  final IconData? icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 62,
        width: 400,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: const Color.fromARGB(255, 230, 227, 227))
          ),
          color: Colors.white,
          child: ListTile(
              leading: Icon(icon,color: Colors.black,),
              title: Text(title,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500,fontFamily: 'Ubuntu'),),
              trailing: SizedBox(width: 15,
                  child: Icon(Icons.arrow_forward_ios,color: Color(0xff5893D4)))
          ),
        ),
      ),
    );
  }
}
