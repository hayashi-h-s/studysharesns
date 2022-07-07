// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_account_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateAccountPageState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateAccountPageStateCopyWith<CreateAccountPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAccountPageStateCopyWith<$Res> {
  factory $CreateAccountPageStateCopyWith(CreateAccountPageState value,
          $Res Function(CreateAccountPageState) then) =
      _$CreateAccountPageStateCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

/// @nodoc
class _$CreateAccountPageStateCopyWithImpl<$Res>
    implements $CreateAccountPageStateCopyWith<$Res> {
  _$CreateAccountPageStateCopyWithImpl(this._value, this._then);

  final CreateAccountPageState _value;
  // ignore: unused_field
  final $Res Function(CreateAccountPageState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_CreateAccountPageStateCopyWith<$Res>
    implements $CreateAccountPageStateCopyWith<$Res> {
  factory _$$_CreateAccountPageStateCopyWith(_$_CreateAccountPageState value,
          $Res Function(_$_CreateAccountPageState) then) =
      __$$_CreateAccountPageStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_CreateAccountPageStateCopyWithImpl<$Res>
    extends _$CreateAccountPageStateCopyWithImpl<$Res>
    implements _$$_CreateAccountPageStateCopyWith<$Res> {
  __$$_CreateAccountPageStateCopyWithImpl(_$_CreateAccountPageState _value,
      $Res Function(_$_CreateAccountPageState) _then)
      : super(_value, (v) => _then(v as _$_CreateAccountPageState));

  @override
  _$_CreateAccountPageState get _value =>
      super._value as _$_CreateAccountPageState;

  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_$_CreateAccountPageState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CreateAccountPageState implements _CreateAccountPageState {
  const _$_CreateAccountPageState({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'CreateAccountPageState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateAccountPageState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_CreateAccountPageStateCopyWith<_$_CreateAccountPageState> get copyWith =>
      __$$_CreateAccountPageStateCopyWithImpl<_$_CreateAccountPageState>(
          this, _$identity);
}

abstract class _CreateAccountPageState implements CreateAccountPageState {
  const factory _CreateAccountPageState({final bool isLoading}) =
      _$_CreateAccountPageState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CreateAccountPageStateCopyWith<_$_CreateAccountPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
