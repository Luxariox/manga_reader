import 'package:flutter/material.dart';
import 'package:manga_reader/pages/home_list.dart';
import 'package:manga_reader/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var drawer = Drawer();

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        Routes.home: (_) => HomeList(drawer: drawer),
      },
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
