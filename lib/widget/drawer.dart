import 'package:flutter/material.dart';
import 'package:ristekmob/screen/homepage.dart';
import '../main.dart';
class ScfDrawer extends StatelessWidget {
  const ScfDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 200,
        child: Drawer(
          
          child: Column(
            children: [
              ListTile(
                title: const Text('My Items', style: TextStyle(color: Colors.black),),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/home");
                },
              ),
              ListTile(
                title: const Text('About Me'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/profile");
                },
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}