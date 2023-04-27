import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:vgp_cliente/app/data/models/bad_request/bad-request.model.dart';

part 'http_request_failure.freezed.dart';

/// (carlitosxx) clase para controlar los fallos htttp
@freezed
class HttpRequestFailure with _$HttpRequestFailure {
  /// (carlitosxx) falla de red
  factory HttpRequestFailure.network() = _Network;

  /// (carlitosxx) solicitud no encontrado
  factory HttpRequestFailure.notFound() = _NotFound;

  /// (carlitosxx) Falla en el servidor
  factory HttpRequestFailure.server() = _Server;

  /// (carlitosxx) No autorizado
  factory HttpRequestFailure.unauthorized() = _Unauthorized;

  /// (carlitosxx) falla local
  factory HttpRequestFailure.local() = _Local;
}
