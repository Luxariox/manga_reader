import '../data/chapter_list.dart';

class ChapterListResponse {
  int code;
  String status;
  ChapterListData data;

  ChapterListResponse({this.code, this.status, this.data});

  factory ChapterListResponse.fromJson(Map<String, dynamic> json) {
    return ChapterListResponse(
      code: json['code'],
      status: json['status'],
      data: ChapterListData.fromJson(json['data']),
    );
  }
}