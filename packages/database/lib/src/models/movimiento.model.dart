/// Clase movimiento
class Movimiento {
  ///constructor
  Movimiento({
    required this.idMovimiento,
    required this.tipoMovimiento,
    required this.monto,
    required this.fecha,
    required this.comentario,
  });

  /// de Json a Movimiento
  factory Movimiento.fromJson(Map<String, dynamic> json) => Movimiento(
        idMovimiento: json['idMovimiento'] as int,
        tipoMovimiento: json['tipoMovimiento'] as int,
        monto: json['monto'] as double,
        fecha: json['fecha'] as int,
        comentario: json['comentario'] as String,
      );

  ///id
  final int idMovimiento;

  ///tipo de movimiento 1 ingreso 0 egreso
  final int tipoMovimiento;

  /// monto
  final double monto;

  /// fecha en formato unix
  final int fecha;

  /// comentario
  final String comentario;

  /// hacer una copia
  Movimiento copyWith({
    int? idMovimiento,
    int? tipoMovimiento,
    double? monto,
    int? fecha,
    String? comentario,
  }) =>
      Movimiento(
        idMovimiento: idMovimiento ?? this.idMovimiento,
        tipoMovimiento: tipoMovimiento ?? this.tipoMovimiento,
        monto: monto ?? this.monto,
        fecha: fecha ?? this.fecha,
        comentario: comentario ?? this.comentario,
      );

  // factory Movimiento.fromRawJson(String str) =>
  //     Movimiento.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  /// convertir a Json
  Map<String, dynamic> toJson() => {
        'id': idMovimiento,
        'tipo_movimiento': tipoMovimiento,
        'monto': monto,
        'fecha': fecha,
        'comentario': comentario,
      };
}
