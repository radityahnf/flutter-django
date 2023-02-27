import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

import '../widget/drawer.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({
    super.key,
    required this.title,
    required this.description,
    required this.image_link,
    required this.favorite,
  });

  final String description;
  final String title;
  final String image_link;
  final bool favorite;

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        endDrawer: ScfDrawer(),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/home");
            },
            icon: Icon(Icons.keyboard_arrow_left_sharp),
            iconSize: 36,
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Item Details",
            style: TextStyle(color: Colors.black),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 10, minHeight: 10),
            child: IntrinsicHeight(
              child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      width: double.infinity,
                      child: FittedBox(
                        child: Image.network(
                          widget.image_link,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Text(widget.description)),
                    
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(left: 10, right: 10),
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () async {
                          var data = convert.jsonEncode(
                            <String, String?>{
                              'title': widget.title,
                              'description': widget.description,
                              'imageLink': widget.image_link,
                            },
                          );
                
                          final response = await request.postJson(
                              "https://project-desktop-production.up.railway.app/delete/", data).then((value) => Navigator.pushReplacementNamed(context, "/home"));
                          
                        },
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ),);
  }
}
