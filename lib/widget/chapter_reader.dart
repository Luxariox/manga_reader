import 'package:flutter/material.dart';
import 'package:manga_reader/model/chapter/chapter.dart';

class ChapterReader extends StatelessWidget {
  final Chapter chapter;

  ChapterReader({@required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chapter.pages.length,
        itemBuilder: (context, i) {
          return Image.network('${chapter.server}/${chapter.hash}/${chapter.pages[i]}');
        },
      ),
    );
  }
}
