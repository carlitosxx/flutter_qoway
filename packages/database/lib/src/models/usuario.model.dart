/// transforma una lista de mapas a una lista de Usuarios
List<Usuario> fromListMapToListUser(List<Map<String, dynamic>> listmap) =>
    listmap.map(Usuario.fromMap).toList();

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

  /// fabricador de Usuarios de Map
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      nombre: map['nombre'] as String,
      correo: map['correo'] as String,
      descDivisa: map['descdivisa'] as String,
      cortoDivisa: map['cortoDivisa'] as String,
      simboloDivisa: map['simboloDivisa'] as String,
      ladoDivisa: map['ladoDivisa'] as int,
    );
  }

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
