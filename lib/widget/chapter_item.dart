import 'package:flutter/material.dart';
import 'package:manga_reader/model/chapter_list/data.dart';

class ChapterItem extends StatelessWidget {
  ChapterData chapter;

  ChapterItem({@required this.chapter});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chapter.title),
    );
  }
}
