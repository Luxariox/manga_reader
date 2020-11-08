import 'package:flutter/material.dart';
import 'package:manga_reader/model/mangadex_api.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MangadexApi.getChapterList(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            {
              var chaptersData = snapshot.data;

              return ListView.builder(
                  itemCount: chaptersData.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(chaptersData[i]),
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
