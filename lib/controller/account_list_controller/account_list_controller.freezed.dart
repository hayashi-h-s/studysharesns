// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_list_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountListState {
  Account? get account => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountListStateCopyWith<AccountListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountListStateCopyWith<$Res> {
  factory $AccountListStateCopyWith(
          AccountListState value, $Res Function(AccountListState) then) =
      _$AccountListStateCopyWithImpl<$Res>;
  $Res call({Account? account});

  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class _$AccountListStateCopyWithImpl<$Res>
    implements $AccountListStateCopyWith<$Res> {
  _$AccountListStateCopyWithImpl(this._value, this._then);

  final AccountListState _value;
  // ignore: unused_field
  final $Res Function(AccountListState) _then;

  @override
  $Res call({
    Object? account = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
    ));
  }

  @override
  $AccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc
abstract class _$$_AccountListStateCopyWith<$Res>
    implements $AccountListStateCopyWith<$Res> {
  factory _$$_AccountListStateCopyWith(
          _$_AccountListState value, $Res Function(_$_AccountListState) then) =
      __$$_AccountListStateCopyWithImpl<$Res>;
  @override
  $Res call({Account? account});

  @override
  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class __$$_AccountListStateCopyWithImpl<$Res>
    extends _$AccountListStateCopyWithImpl<$Res>
    implements _$$_AccountListStateCopyWith<$Res> {
  __$$_AccountListStateCopyWithImpl(
      _$_AccountListState _value, $Res Function(_$_AccountListState) _then)
      : super(_value, (v) => _then(v as _$_AccountListState));

  @override
  _$_AccountListState get _value => super._value as _$_AccountListState;

  @override
  $Res call({
    Object? account = freezed,
  }) {
    return _then(_$_AccountListState(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
    ));
  }
}

/// @nodoc

class _$_AccountListState implements _AccountListState {
  const _$_AccountListState({this.account});

  @override
  final Account? account;

  @override
  String toString() {
    return 'AccountListState(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountListState &&
            const DeepCollectionEquality().equals(other.account, account));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(account));

  @JsonKey(ignore: true)
  @override
  _$$_AccountListStateCopyWith<_$_AccountListState> get copyWith =>
      __$$_AccountListStateCopyWithImpl<_$_AccountListState>(this, _$identity);
}

abstract class _AccountListState implements AccountListState {
  const factory _AccountListState({final Account? account}) =
      _$_AccountListState;

  @override
  Account? get account => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AccountListStateCopyWith<_$_AccountListState> get copyWith =>
      throw _privateConstructorUsedError;
}
