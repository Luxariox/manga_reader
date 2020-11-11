import 'package:flutter/material.dart';
import 'package:manga_reader/model/user_data.dart';
import 'package:manga_reader/pages/home_list.dart';
import 'package:manga_reader/pages/title.dart';
import 'package:manga_reader/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                ListTile(
                  title: Text('Feed'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.home);
                  },
                ),
                ListTile(
                  title: Text('Titles'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.titles);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );

    return ChangeNotifierProvider.value(
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
          Routes.titles: (_) => TitlePage(drawer: drawer),
        },
      ),
    );
  }
}
