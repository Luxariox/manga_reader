import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:manga_reader/model/chapter_list/data.dart';
import 'package:manga_reader/model/chapter_list/response.dart';

class MangadexApi {
  static Future<http.Response> _fetchAddress(String address) async {
    return http.get(address);
  }

  static Future<List<ChapterData>> getChaptersList(List<int> titles) async {
    var response = await _fetchAddress(
        'https://mangadex.org/api/v2/title/${titles[0]}/chapters');

    var respData = ChapterListResponse.fromJson(jsonDecode(response.body));

    return respData.data.chapters;
  }
}