/// Clase movimiento
class Movimiento {
  ///constructor
  Movimiento({
    this.idMovimiento,
    required this.tipoMovimiento,
    required this.monto,
    required this.fecha,
    required this.comentario,
    this.idCuenta,
  });

  /// de Json a Movimiento
  factory Movimiento.fromJson(Map<String, dynamic> json) => Movimiento(
        idMovimiento: json['idMovimiento'] as int,
        tipoMovimiento: json['tipoMovimiento'] as int,
        monto: json['monto'] as double,
        fecha: json['fecha'] as int,
        comentario: json['comentario'] as String,
        idCuenta: json['idCuenta'] as int,
      );

  ///id
  final int? idMovimiento;

  ///tipo de movimiento 1 ingreso 0 egreso
  final int tipoMovimiento;

  /// monto
  final double monto;

  /// fecha en formato unix
  final int fecha;

  /// comentario
  final String comentario;

  /// id de cuenta
  int? idCuenta;

  /// hacer una copia
  Movimiento copyWith({
    int? idMovimiento,
    int? tipoMovimiento,
    double? monto,
    int? fecha,
    String? comentario,
    int? idCuenta,
  }) =>
      Movimiento(
        idMovimiento: idMovimiento ?? this.idMovimiento,
        tipoMovimiento: tipoMovimiento ?? this.tipoMovimiento,
        monto: monto ?? this.monto,
        fecha: fecha ?? this.fecha,
        comentario: comentario ?? this.comentario,
        idCuenta: idCuenta ?? this.idCuenta,
      );

  // factory Movimiento.fromRawJson(String str) =>
  //     Movimiento.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  /// convertir a Json
  Map<String, dynamic> toMap() => {
        'id': idMovimiento,
        'tipoMovimiento': tipoMovimiento,
        'monto': monto,
        'fecha': fecha,
        'comentario': comentario,
        'idCuenta': idCuenta,
      };
}
