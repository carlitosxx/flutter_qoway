// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Cuentas cuentaInicial) started,
    required TResult Function(Cuentas cuenta) loaded,
    required TResult Function(Cuentas cuenta) reloaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Cuentas cuentaInicial)? started,
    TResult? Function(Cuentas cuenta)? loaded,
    TResult? Function(Cuentas cuenta)? reloaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Cuentas cuentaInicial)? started,
    TResult Function(Cuentas cuenta)? loaded,
    TResult Function(Cuentas cuenta)? reloaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Reloaded value) reloaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Reloaded value)? reloaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Loaded value)? loaded,
    TResult Function(Reloaded value)? reloaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountEventCopyWith<$Res> {
  factory $AccountEventCopyWith(
          AccountEvent value, $Res Function(AccountEvent) then) =
      _$AccountEventCopyWithImpl<$Res, AccountEvent>;
}

/// @nodoc
class _$AccountEventCopyWithImpl<$Res, $Val extends AccountEvent>
    implements $AccountEventCopyWith<$Res> {
  _$AccountEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedCopyWith<$Res> {
  factory _$$StartedCopyWith(_$Started value, $Res Function(_$Started) then) =
      __$$StartedCopyWithImpl<$Res>;
  @useResult
  $Res call({Cuentas cuentaInicial});
}

/// @nodoc
class __$$StartedCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$Started>
    implements _$$StartedCopyWith<$Res> {
  __$$StartedCopyWithImpl(_$Started _value, $Res Function(_$Started) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cuentaInicial = null,
  }) {
    return _then(_$Started(
      null == cuentaInicial
          ? _value.cuentaInicial
          : cuentaInicial // ignore: cast_nullable_to_non_nullable
              as Cuentas,
    ));
  }
}

/// @nodoc

class _$Started implements Started {
  const _$Started(this.cuentaInicial);

  @override
  final Cuentas cuentaInicial;

  @override
  String toString() {
    return 'AccountEvent.started(cuentaInicial: $cuentaInicial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Started &&
            (identical(other.cuentaInicial, cuentaInicial) ||
                other.cuentaInicial == cuentaInicial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cuentaInicial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedCopyWith<_$Started> get copyWith =>
      __$$StartedCopyWithImpl<_$Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Cuentas cuentaInicial) started,
    required TResult Function(Cuentas cuenta) loaded,
    required TResult Function(Cuentas cuenta) reloaded,
  }) {
    return started(cuentaInicial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Cuentas cuentaInicial)? started,
    TResult? Function(Cuentas cuenta)? loaded,
    TResult? Function(Cuentas cuenta)? reloaded,
  }) {
    return started?.call(cuentaInicial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Cuentas cuentaInicial)? started,
    TResult Function(Cuentas cuenta)? loaded,
    TResult Function(Cuentas cuenta)? reloaded,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(cuentaInicial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Reloaded value) reloaded,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Reloaded value)? reloaded,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Loaded value)? loaded,
    TResult Function(Reloaded value)? reloaded,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class Started implements AccountEvent {
  const factory Started(final Cuentas cuentaInicial) = _$Started;

  Cuentas get cuentaInicial;
  @JsonKey(ignore: true)
  _$$StartedCopyWith<_$Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedCopyWith<$Res> {
  factory _$$LoadedCopyWith(_$Loaded value, $Res Function(_$Loaded) then) =
      __$$LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Cuentas cuenta});
}

/// @nodoc
class __$$LoadedCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$Loaded>
    implements _$$LoadedCopyWith<$Res> {
  __$$LoadedCopyWithImpl(_$Loaded _value, $Res Function(_$Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cuenta = null,
  }) {
    return _then(_$Loaded(
      null == cuenta
          ? _value.cuenta
          : cuenta // ignore: cast_nullable_to_non_nullable
              as Cuentas,
    ));
  }
}

/// @nodoc

class _$Loaded implements Loaded {
  const _$Loaded(this.cuenta);

  @override
  final Cuentas cuenta;

  @override
  String toString() {
    return 'AccountEvent.loaded(cuenta: $cuenta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loaded &&
            (identical(other.cuenta, cuenta) || other.cuenta == cuenta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cuenta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedCopyWith<_$Loaded> get copyWith =>
      __$$LoadedCopyWithImpl<_$Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Cuentas cuentaInicial) started,
    required TResult Function(Cuentas cuenta) loaded,
    required TResult Function(Cuentas cuenta) reloaded,
  }) {
    return loaded(cuenta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Cuentas cuentaInicial)? started,
    TResult? Function(Cuentas cuenta)? loaded,
    TResult? Function(Cuentas cuenta)? reloaded,
  }) {
    return loaded?.call(cuenta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Cuentas cuentaInicial)? started,
    TResult Function(Cuentas cuenta)? loaded,
    TResult Function(Cuentas cuenta)? reloaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(cuenta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Reloaded value) reloaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Reloaded value)? reloaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Loaded value)? loaded,
    TResult Function(Reloaded value)? reloaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements AccountEvent {
  const factory Loaded(final Cuentas cuenta) = _$Loaded;

  Cuentas get cuenta;
  @JsonKey(ignore: true)
  _$$LoadedCopyWith<_$Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReloadedCopyWith<$Res> {
  factory _$$ReloadedCopyWith(
          _$Reloaded value, $Res Function(_$Reloaded) then) =
      __$$ReloadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Cuentas cuenta});
}

/// @nodoc
class __$$ReloadedCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$Reloaded>
    implements _$$ReloadedCopyWith<$Res> {
  __$$ReloadedCopyWithImpl(_$Reloaded _value, $Res Function(_$Reloaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cuenta = null,
  }) {
    return _then(_$Reloaded(
      null == cuenta
          ? _value.cuenta
          : cuenta // ignore: cast_nullable_to_non_nullable
              as Cuentas,
    ));
  }
}

/// @nodoc

class _$Reloaded implements Reloaded {
  const _$Reloaded(this.cuenta);

  @override
  final Cuentas cuenta;

  @override
  String toString() {
    return 'AccountEvent.reloaded(cuenta: $cuenta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Reloaded &&
            (identical(other.cuenta, cuenta) || other.cuenta == cuenta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cuenta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReloadedCopyWith<_$Reloaded> get copyWith =>
      __$$ReloadedCopyWithImpl<_$Reloaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Cuentas cuentaInicial) started,
    required TResult Function(Cuentas cuenta) loaded,
    required TResult Function(Cuentas cuenta) reloaded,
  }) {
    return reloaded(cuenta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Cuentas cuentaInicial)? started,
    TResult? Function(Cuentas cuenta)? loaded,
    TResult? Function(Cuentas cuenta)? reloaded,
  }) {
    return reloaded?.call(cuenta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Cuentas cuentaInicial)? started,
    TResult Function(Cuentas cuenta)? loaded,
    TResult Function(Cuentas cuenta)? reloaded,
    required TResult orElse(),
  }) {
    if (reloaded != null) {
      return reloaded(cuenta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Reloaded value) reloaded,
  }) {
    return reloaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Reloaded value)? reloaded,
  }) {
    return reloaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(Loaded value)? loaded,
    TResult Function(Reloaded value)? reloaded,
    required TResult orElse(),
  }) {
    if (reloaded != null) {
      return reloaded(this);
    }
    return orElse();
  }
}

abstract class Reloaded implements AccountEvent {
  const factory Reloaded(final Cuentas cuenta) = _$Reloaded;

  Cuentas get cuenta;
  @JsonKey(ignore: true)
  _$$ReloadedCopyWith<_$Reloaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Cuentas cuenta) setAccount,
    required TResult Function(Cuentas cuenta) setNewAccount,
    required TResult Function(Cuentas cuenta) reloadAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Cuentas cuenta)? setAccount,
    TResult? Function(Cuentas cuenta)? setNewAccount,
    TResult? Function(Cuentas cuenta)? reloadAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Cuentas cuenta)? setAccount,
    TResult Function(Cuentas cuenta)? setNewAccount,
    TResult Function(Cuentas cuenta)? reloadAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetAccount value) setAccount,
    required TResult Function(_SetNewAccount value) setNewAccount,
    required TResult Function(_ReloadAccount value) reloadAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetAccount value)? setAccount,
    TResult? Function(_SetNewAccount value)? setNewAccount,
    TResult? Function(_ReloadAccount value)? reloadAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetAccount value)? setAccount,
    TResult Function(_SetNewAccount value)? setNewAccount,
    TResult Function(_ReloadAccount value)? reloadAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res, AccountState>;
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res, $Val extends AccountState>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AccountState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Cuentas cuenta) setAccount,
    required TResult Function(Cuentas cuenta) setNewAccount,
    required TResult Function(Cuentas cuenta) reloadAccount,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Cuentas cuenta)? setAccount,
    TResult? Function(Cuentas cuenta)? setNewAccount,
    TResult? Function(Cuentas cuenta)? reloadAccount,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Cuentas cuenta)? setAccount,
    TResult Function(Cuentas cuenta)? setNewAccount,
    TResult Function(Cuentas cuenta)? reloadAccount,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetAccount value) setAccount,
    required TResult Function(_SetNewAccount value) setNewAccount,
    required TResult Function(_ReloadAccount value) reloadAccount,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetAccount value)? setAccount,
    TResult? Function(_SetNewAccount value)? setNewAccount,
    TResult? Function(_ReloadAccount value)? reloadAccount,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetAccount value)? setAccount,
    TResult Function(_SetNewAccount value)? setNewAccount,
    TResult Function(_ReloadAccount value)? reloadAccount,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AccountState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'AccountState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Cuentas cuenta) setAccount,
    required TResult Function(Cuentas cuenta) setNewAccount,
    required TResult Function(Cuentas cuenta) reloadAccount,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Cuentas cuenta)? setAccount,
    TResult? Function(Cuentas cuenta)? setNewAccount,
    TResult? Function(Cuentas cuenta)? reloadAccount,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Cuentas cuenta)? setAccount,
    TResult Function(Cuentas cuenta)? setNewAccount,
    TResult Function(Cuentas cuenta)? reloadAccount,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetAccount value) setAccount,
    required TResult Function(_SetNewAccount value) setNewAccount,
    required TResult Function(_ReloadAccount value) reloadAccount,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetAccount value)? setAccount,
    TResult? Function(_SetNewAccount value)? setNewAccount,
    TResult? Function(_ReloadAccount value)? reloadAccount,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetAccount value)? setAccount,
    TResult Function(_SetNewAccount value)? setNewAccount,
    TResult Function(_ReloadAccount value)? reloadAccount,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AccountState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_SetAccountCopyWith<$Res> {
  factory _$$_SetAccountCopyWith(
          _$_SetAccount value, $Res Function(_$_SetAccount) then) =
      __$$_SetAccountCopyWithImpl<$Res>;
  @useResult
  $Res call({Cuentas cuenta});
}

/// @nodoc
class __$$_SetAccountCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$_SetAccount>
    implements _$$_SetAccountCopyWith<$Res> {
  __$$_SetAccountCopyWithImpl(
      _$_SetAccount _value, $Res Function(_$_SetAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cuenta = null,
  }) {
    return _then(_$_SetAccount(
      null == cuenta
          ? _value.cuenta
          : cuenta // ignore: cast_nullable_to_non_nullable
              as Cuentas,
    ));
  }
}

/// @nodoc

class _$_SetAccount implements _SetAccount {
  const _$_SetAccount(this.cuenta);

  @override
  final Cuentas cuenta;

  @override
  String toString() {
    return 'AccountState.setAccount(cuenta: $cuenta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetAccount &&
            (identical(other.cuenta, cuenta) || other.cuenta == cuenta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cuenta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetAccountCopyWith<_$_SetAccount> get copyWith =>
      __$$_SetAccountCopyWithImpl<_$_SetAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Cuentas cuenta) setAccount,
    required TResult Function(Cuentas cuenta) setNewAccount,
    required TResult Function(Cuentas cuenta) reloadAccount,
  }) {
    return setAccount(cuenta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Cuentas cuenta)? setAccount,
    TResult? Function(Cuentas cuenta)? setNewAccount,
    TResult? Function(Cuentas cuenta)? reloadAccount,
  }) {
    return setAccount?.call(cuenta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Cuentas cuenta)? setAccount,
    TResult Function(Cuentas cuenta)? setNewAccount,
    TResult Function(Cuentas cuenta)? reloadAccount,
    required TResult orElse(),
  }) {
    if (setAccount != null) {
      return setAccount(cuenta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetAccount value) setAccount,
    required TResult Function(_SetNewAccount value) setNewAccount,
    required TResult Function(_ReloadAccount value) reloadAccount,
  }) {
    return setAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetAccount value)? setAccount,
    TResult? Function(_SetNewAccount value)? setNewAccount,
    TResult? Function(_ReloadAccount value)? reloadAccount,
  }) {
    return setAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetAccount value)? setAccount,
    TResult Function(_SetNewAccount value)? setNewAccount,
    TResult Function(_ReloadAccount value)? reloadAccount,
    required TResult orElse(),
  }) {
    if (setAccount != null) {
      return setAccount(this);
    }
    return orElse();
  }
}

abstract class _SetAccount implements AccountState {
  const factory _SetAccount(final Cuentas cuenta) = _$_SetAccount;

  Cuentas get cuenta;
  @JsonKey(ignore: true)
  _$$_SetAccountCopyWith<_$_SetAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetNewAccountCopyWith<$Res> {
  factory _$$_SetNewAccountCopyWith(
          _$_SetNewAccount value, $Res Function(_$_SetNewAccount) then) =
      __$$_SetNewAccountCopyWithImpl<$Res>;
  @useResult
  $Res call({Cuentas cuenta});
}

/// @nodoc
class __$$_SetNewAccountCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$_SetNewAccount>
    implements _$$_SetNewAccountCopyWith<$Res> {
  __$$_SetNewAccountCopyWithImpl(
      _$_SetNewAccount _value, $Res Function(_$_SetNewAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cuenta = null,
  }) {
    return _then(_$_SetNewAccount(
      null == cuenta
          ? _value.cuenta
          : cuenta // ignore: cast_nullable_to_non_nullable
              as Cuentas,
    ));
  }
}

/// @nodoc

class _$_SetNewAccount implements _SetNewAccount {
  const _$_SetNewAccount(this.cuenta);

  @override
  final Cuentas cuenta;

  @override
  String toString() {
    return 'AccountState.setNewAccount(cuenta: $cuenta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetNewAccount &&
            (identical(other.cuenta, cuenta) || other.cuenta == cuenta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cuenta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetNewAccountCopyWith<_$_SetNewAccount> get copyWith =>
      __$$_SetNewAccountCopyWithImpl<_$_SetNewAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Cuentas cuenta) setAccount,
    required TResult Function(Cuentas cuenta) setNewAccount,
    required TResult Function(Cuentas cuenta) reloadAccount,
  }) {
    return setNewAccount(cuenta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Cuentas cuenta)? setAccount,
    TResult? Function(Cuentas cuenta)? setNewAccount,
    TResult? Function(Cuentas cuenta)? reloadAccount,
  }) {
    return setNewAccount?.call(cuenta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Cuentas cuenta)? setAccount,
    TResult Function(Cuentas cuenta)? setNewAccount,
    TResult Function(Cuentas cuenta)? reloadAccount,
    required TResult orElse(),
  }) {
    if (setNewAccount != null) {
      return setNewAccount(cuenta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetAccount value) setAccount,
    required TResult Function(_SetNewAccount value) setNewAccount,
    required TResult Function(_ReloadAccount value) reloadAccount,
  }) {
    return setNewAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetAccount value)? setAccount,
    TResult? Function(_SetNewAccount value)? setNewAccount,
    TResult? Function(_ReloadAccount value)? reloadAccount,
  }) {
    return setNewAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetAccount value)? setAccount,
    TResult Function(_SetNewAccount value)? setNewAccount,
    TResult Function(_ReloadAccount value)? reloadAccount,
    required TResult orElse(),
  }) {
    if (setNewAccount != null) {
      return setNewAccount(this);
    }
    return orElse();
  }
}

abstract class _SetNewAccount implements AccountState {
  const factory _SetNewAccount(final Cuentas cuenta) = _$_SetNewAccount;

  Cuentas get cuenta;
  @JsonKey(ignore: true)
  _$$_SetNewAccountCopyWith<_$_SetNewAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReloadAccountCopyWith<$Res> {
  factory _$$_ReloadAccountCopyWith(
          _$_ReloadAccount value, $Res Function(_$_ReloadAccount) then) =
      __$$_ReloadAccountCopyWithImpl<$Res>;
  @useResult
  $Res call({Cuentas cuenta});
}

/// @nodoc
class __$$_ReloadAccountCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$_ReloadAccount>
    implements _$$_ReloadAccountCopyWith<$Res> {
  __$$_ReloadAccountCopyWithImpl(
      _$_ReloadAccount _value, $Res Function(_$_ReloadAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cuenta = null,
  }) {
    return _then(_$_ReloadAccount(
      null == cuenta
          ? _value.cuenta
          : cuenta // ignore: cast_nullable_to_non_nullable
              as Cuentas,
    ));
  }
}

/// @nodoc

class _$_ReloadAccount implements _ReloadAccount {
  const _$_ReloadAccount(this.cuenta);

  @override
  final Cuentas cuenta;

  @override
  String toString() {
    return 'AccountState.reloadAccount(cuenta: $cuenta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReloadAccount &&
            (identical(other.cuenta, cuenta) || other.cuenta == cuenta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cuenta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReloadAccountCopyWith<_$_ReloadAccount> get copyWith =>
      __$$_ReloadAccountCopyWithImpl<_$_ReloadAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Cuentas cuenta) setAccount,
    required TResult Function(Cuentas cuenta) setNewAccount,
    required TResult Function(Cuentas cuenta) reloadAccount,
  }) {
    return reloadAccount(cuenta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Cuentas cuenta)? setAccount,
    TResult? Function(Cuentas cuenta)? setNewAccount,
    TResult? Function(Cuentas cuenta)? reloadAccount,
  }) {
    return reloadAccount?.call(cuenta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Cuentas cuenta)? setAccount,
    TResult Function(Cuentas cuenta)? setNewAccount,
    TResult Function(Cuentas cuenta)? reloadAccount,
    required TResult orElse(),
  }) {
    if (reloadAccount != null) {
      return reloadAccount(cuenta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetAccount value) setAccount,
    required TResult Function(_SetNewAccount value) setNewAccount,
    required TResult Function(_ReloadAccount value) reloadAccount,
  }) {
    return reloadAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetAccount value)? setAccount,
    TResult? Function(_SetNewAccount value)? setNewAccount,
    TResult? Function(_ReloadAccount value)? reloadAccount,
  }) {
    return reloadAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetAccount value)? setAccount,
    TResult Function(_SetNewAccount value)? setNewAccount,
    TResult Function(_ReloadAccount value)? reloadAccount,
    required TResult orElse(),
  }) {
    if (reloadAccount != null) {
      return reloadAccount(this);
    }
    return orElse();
  }
}

abstract class _ReloadAccount implements AccountState {
  const factory _ReloadAccount(final Cuentas cuenta) = _$_ReloadAccount;

  Cuentas get cuenta;
  @JsonKey(ignore: true)
  _$$_ReloadAccountCopyWith<_$_ReloadAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
