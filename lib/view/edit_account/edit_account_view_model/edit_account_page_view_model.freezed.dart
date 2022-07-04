// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_account_page_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditAccountPageState {
  bool get isUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditAccountPageStateCopyWith<EditAccountPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditAccountPageStateCopyWith<$Res> {
  factory $EditAccountPageStateCopyWith(EditAccountPageState value,
          $Res Function(EditAccountPageState) then) =
      _$EditAccountPageStateCopyWithImpl<$Res>;
  $Res call({bool isUpdated});
}

/// @nodoc
class _$EditAccountPageStateCopyWithImpl<$Res>
    implements $EditAccountPageStateCopyWith<$Res> {
  _$EditAccountPageStateCopyWithImpl(this._value, this._then);

  final EditAccountPageState _value;
  // ignore: unused_field
  final $Res Function(EditAccountPageState) _then;

  @override
  $Res call({
    Object? isUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      isUpdated: isUpdated == freezed
          ? _value.isUpdated
          : isUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_EditAccountPageStateCopyWith<$Res>
    implements $EditAccountPageStateCopyWith<$Res> {
  factory _$$_EditAccountPageStateCopyWith(_$_EditAccountPageState value,
          $Res Function(_$_EditAccountPageState) then) =
      __$$_EditAccountPageStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isUpdated});
}

/// @nodoc
class __$$_EditAccountPageStateCopyWithImpl<$Res>
    extends _$EditAccountPageStateCopyWithImpl<$Res>
    implements _$$_EditAccountPageStateCopyWith<$Res> {
  __$$_EditAccountPageStateCopyWithImpl(_$_EditAccountPageState _value,
      $Res Function(_$_EditAccountPageState) _then)
      : super(_value, (v) => _then(v as _$_EditAccountPageState));

  @override
  _$_EditAccountPageState get _value => super._value as _$_EditAccountPageState;

  @override
  $Res call({
    Object? isUpdated = freezed,
  }) {
    return _then(_$_EditAccountPageState(
      isUpdated: isUpdated == freezed
          ? _value.isUpdated
          : isUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_EditAccountPageState implements _EditAccountPageState {
  const _$_EditAccountPageState({this.isUpdated = false});

  @override
  @JsonKey()
  final bool isUpdated;

  @override
  String toString() {
    return 'EditAccountPageState(isUpdated: $isUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditAccountPageState &&
            const DeepCollectionEquality().equals(other.isUpdated, isUpdated));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isUpdated));

  @JsonKey(ignore: true)
  @override
  _$$_EditAccountPageStateCopyWith<_$_EditAccountPageState> get copyWith =>
      __$$_EditAccountPageStateCopyWithImpl<_$_EditAccountPageState>(
          this, _$identity);
}

abstract class _EditAccountPageState implements EditAccountPageState {
  const factory _EditAccountPageState({final bool isUpdated}) =
      _$_EditAccountPageState;

  @override
  bool get isUpdated => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EditAccountPageStateCopyWith<_$_EditAccountPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
