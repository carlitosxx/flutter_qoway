import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:security/security.dart';
part 'user_id_event.dart';
part 'user_id_state.dart';
part 'user_id_bloc.freezed.dart';

class UserIdBloc extends Bloc<UserIdEvent, UserIdState> {
  UserIdBloc(this._getUserIdUC) : super(const UserIdState.initial()) {
    on<UserIdLoad>((event, emit) async {
      emit(const UserIdState.loading());
      final userId = await _getUserIdUC('cuenta');
      if (userId == '0' || userId == '') {
        emit(const UserIdState.error());
      } else {
        emit(UserIdState.loaded(userId));
      }
    });
  }
  final GetUserIdUC _getUserIdUC;
}
