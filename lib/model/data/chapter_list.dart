import 'package:manga_reader/model/data/group.dart';

import 'chapter_data.dart';

class ChapterListData {
  List<ChapterData> chapters;
  List<Group> groups;

  ChapterListData({this.chapters, this.groups});

  factory ChapterListData.fromJson(Map<String, dynamic> json) {
    var chapterList = json['chapters'] as List;
    var groupList = json ['groups'] as List;

    return ChapterListData(
      chapters: chapterList.map((e) => ChapterData.fromJson(e)).toList(),
      groups: groupList.map((e) => Group.fromJson(e)).toList(),
    );
  }
}