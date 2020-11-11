import 'package:manga_reader/model/data/chapter_data.dart';

class LanguageFilter {
  static List<ChapterData> chapterData(List<ChapterData> original, List<String> languages) {
    return original.where((e) => languages.contains(e.language)).toList();
  }
}