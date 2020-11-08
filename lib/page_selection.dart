import 'package:flutter/material.dart';
import 'package:manga_reader/pages/home_list.dart';

enum MainPages {
  home,
}

class PageSelection extends StatefulWidget {
  @override
  _PageSelectionState createState() => _PageSelectionState();
}

class _PageSelectionState extends State<PageSelection> {
  MainPages page;

  @override
  void initState() {
    page = MainPages.home;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var drawer = Drawer(
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

    switch (page) {
      case MainPages.home:
        return HomeList(drawer: drawer);

      default:
        return Center(
          child: Text('An error occured'),
        );
    }
  }
}
