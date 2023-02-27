// ignore_for_file: constant_identifier_names, use_build_context_synchronously

import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:ristekmob/main.dart';


class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/register';

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();

  String title = "";
  String description = "";
  String image_link = "";

  String statusMessage = "";

  void _initCreate(request) async {
    var data = convert.jsonEncode(
      <String, String?>{
        'title': title,
        'description': description,
        'image_link': image_link,
      },
    );

    final response = await request.postJson(
        "https://project-desktop-production.up.railway.app/add/", data);

    if (response['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("A new item has been added!"),
      ));
      Navigator.pushReplacementNamed(context, "/home");
    } else if (response['status'] == 'dup') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("A similar item already exists!"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("An error occured, please try again."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, "/home");
                      },
                      icon: Icon(Icons.keyboard_arrow_left_sharp),
                      iconSize: 36,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Add New Item",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color.fromARGB(178, 3, 3, 3)),
                ),
                Form(
                  key: _formKey,
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Title",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            title = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            title = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill out this field.";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Description",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            description = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            description = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill out this field.";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Image Link",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            image_link = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            image_link = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill out this field.";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          
                          backgroundColor:
                              Colors.black,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _initCreate(request);
                          }
                        },
                      ),
                    ),
                    Text(statusMessage),
                    SizedBox(
                      height: 5,
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}