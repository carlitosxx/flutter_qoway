import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

/// (carlitosxx) Freezed para construir el codigo de programacion funcional
@freezed
class Either<L, R> with _$Either<L, R> {
  /// (carlitosxx) recibir objetos a la izquierda(error)
  factory Either.left(L value) = _Left;

  /// (carlitosxx) recibir objetos a la derecha(respuesta)
  factory Either.right(R value) = _Right;
}
