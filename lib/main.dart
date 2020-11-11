import 'package:flutter/material.dart';
import 'package:manga_reader/pages/home_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeList(drawer: Drawer()),
    );
  }
}


/*
Drawer(
  child: SafeArea(
    child: Column(
      children: [
        ListTile(
          title: Text('Feed'),
          onTap: () {
            setState(() {
              page = MainPages.home;
            });
          },
        ),
      ],
    ),
  ),
);
 */
