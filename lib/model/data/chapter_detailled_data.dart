import 'package:manga_reader/model/data/group.dart';

class ChapterDetailedData {
  int id;
  String hash;
  int mangaId;
  String mangaTitle;
  String volume;
  String chapter;
  String title;
  String language;
  List<Group> groups;
  int timestamp;
  int comments;
  String status;
  List<String> pages;
  String server;

  ChapterDetailedData({
    this.id,
    this.hash,
    this.mangaId,
    this.mangaTitle,
    this.volume,
    this.chapter,
    this.title,
    this.language,
    this.groups,
    this.timestamp,
    this.comments,
    this.status,
    this.pages,
    this.server,});

  factory ChapterDetailedData.fromJson(Map<String, dynamic> json) {
    var groupList = json['groups'] as List;

    return ChapterDetailedData(
      id: json['id'],
      hash: json['hash'],
      mangaId: json['mangaId'],
      mangaTitle: json['mangaTitle'],
      volume: json['volume'],
      chapter: json['chapter'],
      title: json['title'],
      language: json['language'],
      groups: groupList.map((e) => Group.fromJson(e)).toList(),
      timestamp: json['timestamp'],
      comments: json['comments'],
      status: json['status'],
      server: json['server'],
      pages: List<String>.from(json['pages']),
    );
  }

  String getTitle() {
    if (title != null && title.isNotEmpty) {
      return 'Ch. $chapter - $title';
    } else {
      return 'Ch. $chapter';
    }
  }
}