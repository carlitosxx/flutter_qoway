import 'package:database/src/models/cuentas.model.dart';

/// clase response de cuentas incluye el total
class ResponseCuentas {
  /// constructor
  ResponseCuentas({required this.total, required this.data});

  /// propiedad total
  final double total;

  /// propiedad data
  final List<Cuentas> data;

  /// copywith
  ResponseCuentas copyWith({
    double? total,
    List<Cuentas>? data,
  }) =>
      ResponseCuentas(
        total: total ?? this.total,
        data: data ?? this.data,
      );
}
