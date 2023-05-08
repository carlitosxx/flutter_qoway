///modelo cuenta
class Cuenta {
  /// coinstructor cuenta
  Cuenta({
    this.id,
    required this.descripcion,
    required this.estaIncluido,
    required this.idUsuario,
  });

  ///metodo para construir desde un map a una cuenta
  factory Cuenta.fromMap(Map<String, dynamic> e) => Cuenta(
        id: e['id'] as int,
        descripcion: e['descripcion'] as String,
        estaIncluido: e['estaIncluido'] as int,
        idUsuario: e['idUsuario'] as int,
      );

  /// id
  int? id;

  /// descripcion
  String descripcion;

  /// esta cuenta esta incluido al total
  /// (esto para sumar el total de las cuentas)
  int estaIncluido;

  /// id de usuario
  int idUsuario;

  /// construir a un map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descripcion': descripcion,
      'estaIncluido': estaIncluido,
      'idUsuario': idUsuario
    };
  }
}
