import 'package:manga_reader/model/chapter_list/data.dart';

class Sorter {
  static void chapterDataTimestamp(List<ChapterData> original,
      {bool reversed = false}) {
    original.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    if (reversed) {
      original = original.reversed.toList();
    }
  }
}
