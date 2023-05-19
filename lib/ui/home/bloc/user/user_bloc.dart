import 'package:bloc/bloc.dart';
import 'package:database/database.dart' as db;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qoway/core/utils/map_failure_to_string.dart';

import 'package:security/security.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._getUserByIdUC) : super(const _Initial()) {
    on<_Loaded>((event, emit) async {
      final response = await _getUserByIdUC(event.userId);
      response.when(
        left: (failure) => emit(UserState.error(mapFailureToString(failure))),
        right: (user) => emit(UserState.loadUser(user[0])),
      );
    });
  }
  final GetUserByIdUC _getUserByIdUC;
}
