import 'package:flutter/material.dart';
import 'package:manga_reader/model/data/chapter_data.dart';
import 'package:manga_reader/model/mangadex_api.dart';
import 'package:manga_reader/pages/chapter_reader.dart';

class ChapterItem extends StatelessWidget {
  final ChapterData chapterData;

  ChapterItem({@required this.chapterData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chapterData.getTitle()),
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
