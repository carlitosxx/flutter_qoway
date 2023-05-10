// To parse this JSON data, do
//
//     final cuentasMovimiento = cuentasMovimientoFromMap(jsonString);

import 'dart:convert';

/// de map a List<CuentasMovimiento>
List<CuentasMovimiento> cuentasMovimientoFromMap(String str) =>
    List<CuentasMovimiento>.from(
      (json.decode(str) as List<Map<String, dynamic>>)
          .map(CuentasMovimiento.fromMap),
    );
// List<CuentasMovimiento> deMapAListCuentaMovimiento(Map<String, dynamic> s)
/// de List<CuentasMovimiento> a Json
String cuentasMovimientoToMap(List<CuentasMovimiento> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

/// cuentas Movimiento
class CuentasMovimiento {
  ///constructor
  CuentasMovimiento({
    required this.id,
    required this.descripcion,
    required this.estaIncluido,
    required this.movimientos,
  });

  /// de mapa a CuentasMovimiento
  factory CuentasMovimiento.fromMap(Map<String, dynamic> json) {
    final dynamicList = (json['movimientos'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    return CuentasMovimiento(
      id: json['id'] as int,
      descripcion: json['descripcion'] as String,
      estaIncluido: json['estaIncluido'] as int,
      movimientos: List<Movimiento>.from(
        dynamicList.map((x) {
          return Movimiento.fromMap(x);
        }),
      ),
    );
  }

  ///id
  final int id;

  ///descripcion
  final String descripcion;

  /// esta incluido en la sumatoria de total
  final int estaIncluido;

  /// Lista de movimientos entre ingresos y egresos
  final List<Movimiento> movimientos;

  /// a mapa
  Map<String, dynamic> toMap() => {
        'id': id,
        'descripcion': descripcion,
        'estaIncluido': estaIncluido,
        'movimientos': List<dynamic>.from(movimientos.map((x) => x.toMap())),
      };
}

/// clase movimiento
class Movimiento {
  /// constructor
  Movimiento({
    required this.idMovimiento,
    required this.tipoMovimiento,
    required this.monto,
    required this.fecha,
    required this.comentario,
  });

  /// de map a Movimiento
  factory Movimiento.fromMap(Map<String, dynamic> json) {
    return Movimiento(
      idMovimiento: json['idMovimiento'] as int,
      tipoMovimiento: json['tipoMovimiento'] as int,
      monto: json['monto'] as double,
      fecha: json['fecha'] as int,
      comentario: json['comentario'] as String,
    );
  }

  /// idMovimiento
  int idMovimiento;

  ///tipo de movimiento 1 ingreso 0 egreso
  final int tipoMovimiento;

  /// monto
  final double monto;

  /// fecha en formato unix
  final int fecha;

  /// comentario
  final String comentario;

  /// a mapa
  Map<String, dynamic> toMap() => {
        'idMovimiento': idMovimiento,
        'tipoMovimiento': tipoMovimiento,
        'monto': monto,
        'fecha': fecha,
        'comentario': comentario,
      };
}
