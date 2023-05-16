// To parse this JSON data, do
//
//     final cuentas = cuentasFromJson(jsonString);

import 'package:database/src/models/movimiento.model.dart';

/// transofmra un List<Map<String, dynamic>> a una lista de Cuentas
List<Cuentas> cuentasFromMap(List<Map<String, dynamic>> listmap) =>
    listmap.map(Cuentas.fromMap).toList();

/// clase cuentas
class Cuentas {
  /// constructor
  Cuentas({
    required this.id,
    required this.descripcion,
    required this.estaIncluido,
    this.idUsuario,
    this.total,
    required this.movimientos,
  });

  /// de mapa a CuentasMovimiento
  factory Cuentas.fromMap(Map<String, dynamic> json) {
    final dynamicList = (json['movimientos'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    return Cuentas(
      id: json['id'] as int,
      descripcion: json['descripcion'] as String,
      estaIncluido: json['estaIncluido'] as int,
      total: json['total'] as double,
      movimientos: List<Movimiento>.from(
        dynamicList.map((x) {
          return Movimiento.fromJson(x);
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

  /// id del usuario de la cuenta
  final int? idUsuario;

  /// total
  final double? total;

  /// Lista de movimientos entre ingresos y egresos
  final List<Movimiento> movimientos;

  /// Crear una copia de la clase cuentas
  Cuentas copyWith({
    int? id,
    String? descripcion,
    int? estaIncluido,
    int? idUsuario,
    double? total,
    List<Movimiento>? movimientos,
  }) =>
      Cuentas(
        id: id ?? this.id,
        descripcion: descripcion ?? this.descripcion,
        estaIncluido: estaIncluido ?? this.estaIncluido,
        idUsuario: idUsuario ?? this.idUsuario,
        total: total ?? this.total,
        movimientos: movimientos ?? this.movimientos,
      );

  /// a rawJson
  // String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'id': id,
        'descripcion': descripcion,
        'esta_incluido': estaIncluido,
        'id_usuario': idUsuario,
        'total': total,
        'movimientos': List<dynamic>.from(movimientos.map((x) => x.toMap())),
      };
}
