part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loadUser(db.Usuario user) = _LoadUser;
  const factory UserState.error(String error) = _Error;
}
