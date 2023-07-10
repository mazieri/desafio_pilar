import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  List wordsSaved = [];

  Future saveWord(String key, value) async {
    final pref = await SharedPreferences.getInstance();
    wordsSaved.add(key);
    return pref.setString(key, value);
  }

  Future getWord(String key) async {
    final pref = await SharedPreferences.getInstance();
    return json.decode(pref.getString(key)!) ?? "";
  }
}
