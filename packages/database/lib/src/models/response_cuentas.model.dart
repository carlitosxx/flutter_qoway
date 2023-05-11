import 'package:database/src/models/cuentas.model.dart';

/// clase response de cuentas incluye el total
class ResponseCuentas {
  /// constructor
  ResponseCuentas(this.data, this.total);

  /// propiedad total
  final double total;

  /// propiedad data
  final List<Cuentas> data;
}
