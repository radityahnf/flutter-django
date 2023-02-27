import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ristekmob/screen/add_item.dart';
import 'package:ristekmob/screen/homepage.dart';
import 'package:ristekmob/screen/profilepage.dart';


void main() {
  runApp(const MyApp());
}





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'RISTEK',
        theme: ThemeData(
          fontFamily: 'Poppins',
          

        ),
        initialRoute: "/profile",
        routes: {
          "/add": ((BuildContext context) => const AddItem()),
          "/home": ((BuildContext context) => const HomePage()),
          "/profile": ((BuildContext context) => const ProfilePage()),

          
          
        },
      ),
    );
  }
}