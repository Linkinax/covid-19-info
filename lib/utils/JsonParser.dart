import 'dart:convert';

import '../model/NumeroCasi.dart';

class JsonParser {
  NumeroCasi nc = NumeroCasi(0, 0, 0);

  JsonParser(var jsonNews) {
    print("Parsing json....\n");
    print(jsonNews);

    nc = NumeroCasi(jsonNews[0]['nuovi_positivi'], jsonNews[0]['deceduti'],
        jsonNews[0]['dimessi_guariti']);
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
