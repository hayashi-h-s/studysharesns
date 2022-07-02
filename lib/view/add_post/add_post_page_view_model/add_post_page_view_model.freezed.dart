// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_post_page_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPostPageState {
  bool get isPosted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPostPageStateCopyWith<AddPostPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPostPageStateCopyWith<$Res> {
  factory $AddPostPageStateCopyWith(
          AddPostPageState value, $Res Function(AddPostPageState) then) =
      _$AddPostPageStateCopyWithImpl<$Res>;
  $Res call({bool isPosted});
}

/// @nodoc
class _$AddPostPageStateCopyWithImpl<$Res>
    implements $AddPostPageStateCopyWith<$Res> {
  _$AddPostPageStateCopyWithImpl(this._value, this._then);

  final AddPostPageState _value;
  // ignore: unused_field
  final $Res Function(AddPostPageState) _then;

  @override
  $Res call({
    Object? isPosted = freezed,
  }) {
    return _then(_value.copyWith(
      isPosted: isPosted == freezed
          ? _value.isPosted
          : isPosted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_AddPostPageStateCopyWith<$Res>
    implements $AddPostPageStateCopyWith<$Res> {
  factory _$$_AddPostPageStateCopyWith(
          _$_AddPostPageState value, $Res Function(_$_AddPostPageState) then) =
      __$$_AddPostPageStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isPosted});
}

/// @nodoc
class __$$_AddPostPageStateCopyWithImpl<$Res>
    extends _$AddPostPageStateCopyWithImpl<$Res>
    implements _$$_AddPostPageStateCopyWith<$Res> {
  __$$_AddPostPageStateCopyWithImpl(
      _$_AddPostPageState _value, $Res Function(_$_AddPostPageState) _then)
      : super(_value, (v) => _then(v as _$_AddPostPageState));

  @override
  _$_AddPostPageState get _value => super._value as _$_AddPostPageState;

  @override
  $Res call({
    Object? isPosted = freezed,
  }) {
    return _then(_$_AddPostPageState(
      isPosted: isPosted == freezed
          ? _value.isPosted
          : isPosted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddPostPageState implements _AddPostPageState {
  const _$_AddPostPageState({this.isPosted = false});

  @override
  @JsonKey()
  final bool isPosted;

  @override
  String toString() {
    return 'AddPostPageState(isPosted: $isPosted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddPostPageState &&
            const DeepCollectionEquality().equals(other.isPosted, isPosted));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isPosted));

  @JsonKey(ignore: true)
  @override
  _$$_AddPostPageStateCopyWith<_$_AddPostPageState> get copyWith =>
      __$$_AddPostPageStateCopyWithImpl<_$_AddPostPageState>(this, _$identity);
}

abstract class _AddPostPageState implements AddPostPageState {
  const factory _AddPostPageState({final bool isPosted}) = _$_AddPostPageState;

  @override
  bool get isPosted => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AddPostPageStateCopyWith<_$_AddPostPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
