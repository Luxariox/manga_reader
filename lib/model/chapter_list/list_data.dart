import 'data.dart';

class ChapterListData {
  List<ChapterData> chapters;
  Map<String, String> groups;

  ChapterListData({this.chapters, this.groups});

  factory ChapterListData.fromJson(Map<String, dynamic> json) {
    var chapterList = json['chapters'] as List;

    return ChapterListData(
      chapters: chapterList.map((e) => ChapterData.fromJson(e)).toList(),
      groups: Map<String, String>.from(json['groups']),
    );
  }
}