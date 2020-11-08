import 'package:http/http.dart' as http;

class MangadexApi {
  static Future<http.Response> _fetchAddress(String address) async {
    return await http.get(address);
  }

  static Future<List<String>> getChapterList() async {
    var response = await _fetchAddress('https://mangadex.org/api/v2/title/21063/chapters');

    if (response.statusCode == 200) {
      return ['test', 'test2', 'test3', 'test5'];
    } else {
      return null;
    }
  }
}