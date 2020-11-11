import 'package:flutter/material.dart';
import 'package:manga_reader/model/user_data.dart';
import 'package:manga_reader/pages/home_list.dart';
import 'package:manga_reader/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  var userData = UserData();

  await userData.initialize();
  userData.loadData();

  runApp(MyApp(userData: userData));
}

class MyApp extends StatelessWidget {
  final UserData userData;

  MyApp({this.userData});

  @override
  Widget build(BuildContext context) {
    var drawer = Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text('Feed'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );

    return Provider.value(
      value: userData,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          Routes.home: (_) => HomeList(drawer: drawer),
        },
      ),
    );
  }
}
