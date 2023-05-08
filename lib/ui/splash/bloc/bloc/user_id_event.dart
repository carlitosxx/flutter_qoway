part of 'user_id_bloc.dart';

@freezed
class UserIdEvent with _$UserIdEvent {
  const factory UserIdEvent.started() = Started;
  const factory UserIdEvent.load() = UserIdLoad;
}
