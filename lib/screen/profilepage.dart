import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ristekmob/main.dart';
import 'package:ristekmob/screen/homepage.dart';
import 'package:ristekmob/widget/drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(endDrawer: ScfDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          
          leading: IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, "/home");
                      },
                      icon: Icon(Icons.keyboard_arrow_left_sharp),
                      iconSize: 36,
                      color: Colors.black,
                    ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "About Me",
            style: TextStyle(color: Colors.black),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 102,
                        child: CircleAvatar(
                          radius: 100.0,
                          backgroundImage: NetworkImage(
                              "https://media.licdn.com/dms/image/D5603AQH9yXn-J1FLXg/profile-displayphoto-shrink_400_400/0/1672214650615?e=1683158400&v=beta&t=QxkNIkvJ1UDpiFAw2zqKKOOTUIp4NZM8au0Sb9LdbHw"),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Muhammad Raditya Hanif",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Ilmu Komputer 2021",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                        height: 26,
                      ),
                Text(
                  "Panggilan",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Adit",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(
                  height: 18,
                ),

                Text(
                  "Hobi",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Musik",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(
                  height: 18,
                ),

                Text(
                  "Instagram",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "@raditya.hnf",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(
                  height: 18,
                ),

                Text(
                  "Tentang",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "A second-year computer science student who has a strong interest in mobile app development using Flutter. With a passion for coding and a natural curiosity,",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ));
  }
}
