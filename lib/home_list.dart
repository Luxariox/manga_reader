import 'package:flutter/material.dart';
import 'package:manga_reader/model/chapter_list/data.dart';
import 'package:manga_reader/model/mangadex_api.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MangadexApi.getChaptersList([21063]),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }

        if (snapshot.hasData) {
          var chaptersData = snapshot.data as List<ChapterData>;

          return ListView.builder(
            itemCount: chaptersData.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(chaptersData[i].title),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
