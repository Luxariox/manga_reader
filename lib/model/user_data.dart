import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData extends ChangeNotifier {
  Map<int, String> titles;
  SharedPreferences _sharedPreferences;

  UserData({this.titles});

  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void loadData() {
    loadTitles();
  }

  void loadTitles() {
    var titlesList = _sharedPreferences
        .getStringList('titles')
        .map((e) => int.parse(e))
        .toList();

    for (var title in titlesList) {
      titles[title] = '$title';
    }
  }

  void addTitle(int id, String title) {
    titles[id] = title;

    var store = titles.keys.map((e) => '$e').toList();
    _sharedPreferences.setStringList('titles', store);

    notifyListeners();
  }

  void removeTitle(int id) {
    titles.remove(id);

    var store = titles.keys.map((e) => '$e').toList();
    _sharedPreferences.setStringList('titles', store);

    notifyListeners();
  }
}