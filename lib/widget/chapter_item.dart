import 'package:flutter/material.dart';
import 'package:manga_reader/model/chapter_list/data.dart';
import 'package:manga_reader/model/mangadex_api.dart';
import 'package:manga_reader/pages/chapter_reader.dart';

class ChapterItem extends StatelessWidget {
  ChapterData chapterData;

  ChapterItem({@required this.chapterData});

  String _getTitle() {
    if (chapterData.title != null && chapterData.title.isNotEmpty) {
      return 'Ch. ${chapterData.chapter} - ${chapterData.title}';
    } else {
      return 'Ch. ${chapterData.chapter}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_getTitle()),
      onTap: () async {
        var chapter = await MangadexApi.getChapter(chapterData);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (b) => ChapterReader(
            chapter: chapter,
          )),
        );
      },
    );
  }
}
