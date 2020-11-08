import 'chapter.dart';

class ChapterResponse {
  int code;
  String status;
  Chapter data;

  ChapterResponse({this.code, this.status, this.data});

  factory ChapterResponse.fromJson(Map<String, dynamic> json) {
    return ChapterResponse(
      code: json['code'],
      status: json['status'],
      data: Chapter.fromJson(json['data']),
    );
  }
}