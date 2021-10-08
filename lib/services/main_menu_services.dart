import 'dart:convert';

import 'package:http/http.dart' as http;

class MainMenuServices {
  Future<List<dynamic>> fetchHighlight() async {
    var url = Uri.parse('https://api.jsonbin.io/b/6152c7974a82881d6c56d30c');
    var response = await http.get(url);
    var decoded = jsonDecode(response.body);
    var highlightData = decoded['data'];
    print(highlightData);
    return highlightData;
  }

  Future<List<dynamic>> fetchHighMusic() async {
    var url = Uri.parse('https://api.jsonbin.io/b/6152c7f6aa02be1d445015a4');
    var response = await http.get(url);
    var decoded = jsonDecode(response.body);
    var decodedMusic = decoded['data'];

    return decodedMusic;
  }
}
