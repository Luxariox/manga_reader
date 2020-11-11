import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TitlePage extends StatelessWidget {
  final Drawer drawer;

  TitlePage({@required this.drawer});

  @override
  Widget build(BuildContext context) {
    var tmp = ['Naruto', 'DarkSasuke.xX'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Manga Reader'),
      ),
      drawer: drawer,
      body: ListView.builder(
        itemCount: tmp.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(tmp[i]),
            trailing: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    /// Remove a title from the base
                  },
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /// Add a title to the base
          var pref = await SharedPreferences.getInstance();
          pref.setStringList('titles', []);
        },
      ),
    );
  }
}
