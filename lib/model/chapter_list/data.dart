class ChapterData {
  int id;
  String hash;
  int mangaId;
  String mangaTitle;
  String volume;
  String chapter;
  String title;
  String language;
  List<int> groups;
  int timestamp;
  int comments;

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
      this.comments});

  factory ChapterData.fromJson(Map<String, dynamic> json) {
    return ChapterData(
      id: json['id'],
      hash: json['hash'],
      mangaId: json['mangaId'],
      mangaTitle: json['mangaTitle'],
      volume: json['volume'],
      chapter: json['chapter'],
      title: json['title'],
      language: json['language'],
      groups: List<int>.from(json['groups']),
      timestamp: json['timestamp'],
      comments: json['comments'],
    );
  }
}