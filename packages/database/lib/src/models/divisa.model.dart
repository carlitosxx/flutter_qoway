///Divisa
class Divisa {
  /// constructor
  Divisa({
    this.id,
    required this.descDivisa,
    required this.cortoDivisa,
    required this.simboloDivisa,
    required this.ladoDivisa,
  });

  ///id
  int? id;

  ///descripcion de divisa
  String descDivisa;

  ///descripcion corta de divisa
  String cortoDivisa;

  /// simbolo de divisa
  String simboloDivisa;

  /// posicion de la divisa,izqueirda o derecho
  int ladoDivisa;
}
