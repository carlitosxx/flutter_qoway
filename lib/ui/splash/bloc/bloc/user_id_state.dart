part of 'user_id_bloc.dart';

@freezed
class UserIdState with _$UserIdState {
  const factory UserIdState.initial() = _Initial;
  const factory UserIdState.loading() = _Loading;
  const factory UserIdState.loaded(String id) = _Loaded;
  const factory UserIdState.error() = _Error;
}
