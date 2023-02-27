import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ristekmob/main.dart';
import 'package:ristekmob/screen/detail_page.dart';

import 'dart:convert' as convert;

import 'package:ristekmob/util/fetch.dart';
import 'package:ristekmob/widget/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      endDrawer: ScfDrawer(),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/add");
          },
          child: Icon(Icons.add, )),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          
         
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "My Items",
            style: TextStyle(color: Colors.black),
          ),
        ),
        resizeToAvoidBottomInset: false,
      body: Column(
        children: [Container(height: 10, width: double.infinity,),
          Expanded(
            child: FutureBuilder(
                future: fetchItem(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromRGBO(254, 185, 0, 100))));
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text(
                            "There is no data yet",
                            style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => Container(
                                      height: 120,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 5),
                                      padding: const EdgeInsets.all(10.0),
                                      child: Dismissible(key: Key(snapshot.data![index].title),  
                                      onDismissed: (direction) async {
                                        var data = convert.jsonEncode(
                                          <String, String?>{
                                            'title':
                                                "${snapshot.data![index].title}",
                                            'description':
                                                "${snapshot.data![index].description}",
                                            'imageLink':
                                                "${snapshot.data![index].imageLink}",
                                          },
                                        );

                                        final response = await request.postJson(
                                            "https://project-desktop-production.up.railway.app/delete/",
                                            data);
                                        setState(() {});
                                      },
                                        child: ListTile(
                                          onTap: (() {
                                            Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ItemDetail(
                                                  title: snapshot.data![index].title,
                                                  description: snapshot.data![index].description,
                                                  image_link: snapshot.data![index].imageLink,
                                                  favorite: snapshot.data![index].favorite,
                                                  
                                                )),
                                                                          );
                                          }) ,
                                          title: Text(
                                            "${snapshot.data![index].title}",
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          subtitle: Container(
                                            child: Text(
                                              "${snapshot.data![index].description}",
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          leading: ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: Image.network(
                                              "${snapshot.data![index].imageLink}",
                                              height: 40,
                                              width: 40,
                                            ),
                                          ),
                                          trailing: IconButton(
                                            onPressed: () async {
                                              
                                              var data = convert.jsonEncode(
                                                <String, String?>{
                                                  'title':
                                                      "${snapshot.data![index].title}",
                                                  'description':
                                                      "${snapshot.data![index].description}",
                                                  'imageLink':
                                                      "${snapshot.data![index].imageLink}",
                                                },
                                              );
                                      
                                              final response = await request.postJson(
                                                  "https://project-desktop-production.up.railway.app/favorite/", data);
                                              setState(() {});
                                            },
                                            icon: Icon(Icons.favorite),
                                            color:snapshot.data![index].favorite ? Colors.red : Colors.grey
                                          ),
                                        ),
                                      ),
                                    )),
                          ),
                        ],
                      );
                    }
                  }
                }),
          ),
        ],
      ),
    );
  }
}
