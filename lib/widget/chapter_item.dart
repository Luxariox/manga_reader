import 'package:flutter/material.dart';
import 'package:manga_reader/model/chapter_list/data.dart';

class ChapterItem extends StatelessWidget {
  ChapterData chapter;

  ChapterItem({@required this.chapter});

  String _getTitle() {
    if (chapter.title != null && chapter.title.isNotEmpty) {
      return 'Ch. ${chapter.chapter} - ${chapter.title}';
    } else {
      return 'Ch. ${chapter.chapter}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_getTitle()),
      onTap: () {

      },
    );
  }
}
