import 'dart:convert';

import 'package:http/http.dart' as http;

class json_handler {
  final _urlCasi =
      "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-andamento-nazionale-latest.json";

  final _urlNotizie =
      "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-note.json";

  getJsonCasi() async {
    var url = Uri.parse(this._urlCasi);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  Future getJsonNotizie() async {
    var url = Uri.parse(this._urlNotizie);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    var jsonNews = jsonDecode(response.body);
    var lastIndex = response.body.length;
    for (var i = lastIndex; i < lastIndex - 6; i--) {
      print(jsonNews[i]["note"]);
    }
  }
}
