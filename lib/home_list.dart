import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future(() {}),
      builder: (context, snapshot) {
        var tmp = ['test', 'test2', 'test3', 'test4'];

        switch (snapshot.connectionState) {
          case ConnectionState.done:
            {
              return ListView.builder(
                  itemCount: tmp.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(tmp[i]),
                    );
                  },
              );
            }
          default:
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        }
      },
    );
  }
}
