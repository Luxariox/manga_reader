import 'package:flutter/material.dart';
import 'package:manga_reader/model/user_data.dart';
import 'package:provider/provider.dart';

class TitlePage extends StatelessWidget {
  final Drawer drawer;

  TitlePage({@required this.drawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manga Reader'),
      ),
      drawer: drawer,
      body: Consumer<UserData>(
        builder: (context, userData, child) {
          return ListView.builder(
            itemCount: userData.titles.length,
            itemBuilder: (context, i) {
              var keyList = userData.titles.keys.toList();
              var valueList = userData.titles.values.toList();

              return ListTile(
                title: Text(valueList[i]),
                trailing: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        /// Remove a title from the base
                        userData.removeTitle(keyList[i]);
                      },
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// Add a title to the base
        },
      ),
    );
  }
}
