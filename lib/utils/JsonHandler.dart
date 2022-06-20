import 'dart:convert';

import 'package:http/http.dart' as http;

class JsonHandler {
  final _urlCasi =
      "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-andamento-nazionale-latest.json";
  final _urlNotizie =
      "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-note.json";

  Future getJsonCasi() async {
    var url = Uri.parse(_urlCasi);
    var response = await http.get(url);
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    var jsonCasi = jsonDecode(response.body);
    //print(jsonCasi);
    return jsonCasi;
  }

  Future getJsonNotizie() async {
    var url = Uri.parse(_urlNotizie);
    var response = await http.get(url);
    //print('Response status: ${response.statusCode}');

    var jsonNews = jsonDecode(response.body);
    print(jsonNews);

    return jsonNews;
  }
}
