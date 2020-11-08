import 'package:manga_reader/model/chapter_list/data.dart';

class LanguageFilter {
  static List filterChapterData(List<ChapterData> original, List<String> languages) {
    return original.where((e) => languages.contains(e.language)).toList();
  }
}