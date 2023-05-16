import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qoway/core/utils/map_failure_to_string.dart';
import 'package:security/security.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this._registerUC) : super(const RegisterState.initial()) {
    on<RegisterLoad>((event, emit) async {
      emit(const RegisterState.loading());
      final register = await _registerUC(
        event.name,
        event.email,
        event.password,
        event.descCurrency,
        event.descShortCurrency,
        event.simbolCurrency,
        event.sideCurrency,
      );
      register.when(
        left: (failure) =>
            emit(RegisterState.error(mapFailureToString(failure))),
        right: (register) => emit(RegisterState.loaded(register)),
      );
    });
  }
  final RegisterUC _registerUC;
}
