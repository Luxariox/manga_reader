import 'package:manga_reader/model/data/group.dart';

class ChapterData {
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

  ChapterData({
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
    this.server});

  factory ChapterData.fromJson(Map<String, dynamic> json) {
    var groupsList = json['groups'] as List;
    
    return ChapterData(
      id: json['id'],
      hash: json['hash'],
      mangaId: json['mangaId'],
      mangaTitle: json['mangaTitle'],
      volume: json['volume'],
      chapter: json['chapter'],
      title: json['title'],
      language: json['language'],
      groups: groupsList.map((e) => Group.fromJson(e)).toList(),
      timestamp: json['timestamp'],
      comments: json['comments'],
      status: json['status'],
      pages: List<String>.from(json['pages']),
      server: json['server'],
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