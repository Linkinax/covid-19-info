import 'dart:convert';

import '../model/NumeroCasi.dart';

class JsonParser {
  NumeroCasi nc = NumeroCasi(0, 0, 0);
  String today = " Caricamento data...";

  JsonParser(var jsonNews) {
    print("Parsing json....\n");
    print(jsonNews);

    nc = NumeroCasi(jsonNews[0]['totale_positivi'], jsonNews[0]['deceduti'],
        jsonNews[0]['dimessi_guariti']);

    //Example:  data: 2022-06-18T17:00:00,
    today = jsonNews[0]['data'].toString().split('T')[0];
  }

  int getInfected() {
    return nc.getInfetti();
  }

  int getHealed() {
    return nc.getGuariti();
  }

  int getDeaths() {
    return nc.getMorti();
  }
}
