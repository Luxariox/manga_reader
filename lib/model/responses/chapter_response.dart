import 'package:manga_reader/model/data/chapter_detailled_data.dart';

class ChapterResponse {
  int code;
  String status;
  ChapterDetailedData data;

  ChapterResponse({this.code, this.status, this.data});

  factory ChapterResponse.fromJson(Map<String, dynamic> json) {
    return ChapterResponse(
      code: json['code'],
      status: json['status'],
      data: ChapterDetailedData.fromJson(json['data']),
    );
  }
}