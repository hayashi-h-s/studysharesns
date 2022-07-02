// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_index_page_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostIndexPageState {
  bool get isPosted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostIndexPageStateCopyWith<PostIndexPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostIndexPageStateCopyWith<$Res> {
  factory $PostIndexPageStateCopyWith(
          PostIndexPageState value, $Res Function(PostIndexPageState) then) =
      _$PostIndexPageStateCopyWithImpl<$Res>;
  $Res call({bool isPosted});
}

/// @nodoc
class _$PostIndexPageStateCopyWithImpl<$Res>
    implements $PostIndexPageStateCopyWith<$Res> {
  _$PostIndexPageStateCopyWithImpl(this._value, this._then);

  final PostIndexPageState _value;
  // ignore: unused_field
  final $Res Function(PostIndexPageState) _then;

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
abstract class _$$_PostIndexPageStateCopyWith<$Res>
    implements $PostIndexPageStateCopyWith<$Res> {
  factory _$$_PostIndexPageStateCopyWith(_$_PostIndexPageState value,
          $Res Function(_$_PostIndexPageState) then) =
      __$$_PostIndexPageStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isPosted});
}

/// @nodoc
class __$$_PostIndexPageStateCopyWithImpl<$Res>
    extends _$PostIndexPageStateCopyWithImpl<$Res>
    implements _$$_PostIndexPageStateCopyWith<$Res> {
  __$$_PostIndexPageStateCopyWithImpl(
      _$_PostIndexPageState _value, $Res Function(_$_PostIndexPageState) _then)
      : super(_value, (v) => _then(v as _$_PostIndexPageState));

  @override
  _$_PostIndexPageState get _value => super._value as _$_PostIndexPageState;

  @override
  $Res call({
    Object? isPosted = freezed,
  }) {
    return _then(_$_PostIndexPageState(
      isPosted: isPosted == freezed
          ? _value.isPosted
          : isPosted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PostIndexPageState implements _PostIndexPageState {
  const _$_PostIndexPageState({this.isPosted = false});

  @override
  @JsonKey()
  final bool isPosted;

  @override
  String toString() {
    return 'PostIndexPageState(isPosted: $isPosted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostIndexPageState &&
            const DeepCollectionEquality().equals(other.isPosted, isPosted));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isPosted));

  @JsonKey(ignore: true)
  @override
  _$$_PostIndexPageStateCopyWith<_$_PostIndexPageState> get copyWith =>
      __$$_PostIndexPageStateCopyWithImpl<_$_PostIndexPageState>(
          this, _$identity);
}

abstract class _PostIndexPageState implements PostIndexPageState {
  const factory _PostIndexPageState({final bool isPosted}) =
      _$_PostIndexPageState;

  @override
  bool get isPosted => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PostIndexPageStateCopyWith<_$_PostIndexPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
