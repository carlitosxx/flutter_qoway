/// Clase Usuario
class Usuario {
  /// Constructor
  Usuario({
    this.id,
    this.nombre,
    this.correo,
    this.clave,
    this.descDivisa,
    this.cortoDivisa,
    this.simboloDivisa,
    this.ladoDivisa,
  });

  /// id
  int? id;

  /// Nombre de usuario
  String? nombre;

  /// correo electronico
  String? correo;

  /// clave
  String? clave;

  /// descripcion de la divisa
  String? descDivisa;

  /// descripcion corta de la divisa
  String? cortoDivisa;

  /// simnbolo de la divisa
  String? simboloDivisa;

  /// posicion del lado de la divisa derecha (1) o izquierda(0)
  int? ladoDivisa;

  /// METODO para construr a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'correo': correo,
      'clave': clave,
      'descDivisa': descDivisa,
      'cortoDivisa': cortoDivisa,
      'simboloDivisa': simboloDivisa,
      'ladoDivisa': ladoDivisa,
    };
  }
}
