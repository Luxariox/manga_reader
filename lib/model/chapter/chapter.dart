class Chapter {
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
  String status;
  List<String> pages;
  String server;

  Chapter({
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

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
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
      status: json['status'],
      pages: List<String>.from(json['pages']),
      server: json['server'],
    );
  }
}