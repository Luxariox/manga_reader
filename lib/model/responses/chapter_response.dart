import '../data/chapter_data.dart';

class ChapterResponse {
  int code;
  String status;
  ChapterData data;

  ChapterResponse({this.code, this.status, this.data});

  factory ChapterResponse.fromJson(Map<String, dynamic> json) {
    return ChapterResponse(
      code: json['code'],
      status: json['status'],
      data: ChapterData.fromJson(json['data']),
    );
  }
}