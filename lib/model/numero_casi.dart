// ignore_for_file: prefer_final_fields

class numero_casi {
  var _infetti = 0;
  var _morti = 0;
  var _guariti = 0;

  numero_casi(this._infetti, this._morti, this._guariti);

  int getInfetti() {
    return _infetti;
  }

  int getMorti() {
    return _morti;
  }

  int getGuariti() {
    return _guariti;
  }
}
