import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:manga_reader/model/data/chapter_data.dart';
import 'package:manga_reader/model/data/chapter_detailled_data.dart';
import 'package:manga_reader/model/responses/chapter_response.dart';
import 'package:manga_reader/model/responses/chapter_list_response.dart';

class MangadexApi {
  static Future<http.Response> _fetchAddress(String address) async {
    return http.get(address);
  }

  static Future<List<ChapterData>> _getChapterList(int title) async {
    var response = await _fetchAddress(
        'https://mangadex.org/api/v2/title/$title/chapters');

    var respData = ChapterListResponse.fromJson(jsonDecode(response.body));

    return respData.data.chapters;
  }

  static Future<List<ChapterData>> getChaptersList(List<int> titles) async {
    var result = <ChapterData>[];

    for (var title in titles) {
      result.addAll(await _getChapterList(title));
    }

    return result;
  }

  static Future<ChapterDetailedData> getChapter(ChapterData chapterData) async {
    var response = await _fetchAddress(
        'https://mangadex.org/api/v2/chapter/${chapterData.id}');

    var respData = ChapterResponse.fromJson(jsonDecode(response.body));

    return respData.data;
  }
}