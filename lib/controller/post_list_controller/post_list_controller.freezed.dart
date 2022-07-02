// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_list_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostListState {
  Post? get post => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostListStateCopyWith<PostListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostListStateCopyWith<$Res> {
  factory $PostListStateCopyWith(
          PostListState value, $Res Function(PostListState) then) =
      _$PostListStateCopyWithImpl<$Res>;
  $Res call({Post? post});

  $PostCopyWith<$Res>? get post;
}

/// @nodoc
class _$PostListStateCopyWithImpl<$Res>
    implements $PostListStateCopyWith<$Res> {
  _$PostListStateCopyWithImpl(this._value, this._then);

  final PostListState _value;
  // ignore: unused_field
  final $Res Function(PostListState) _then;

  @override
  $Res call({
    Object? post = freezed,
  }) {
    return _then(_value.copyWith(
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
    ));
  }

  @override
  $PostCopyWith<$Res>? get post {
    if (_value.post == null) {
      return null;
    }

    return $PostCopyWith<$Res>(_value.post!, (value) {
      return _then(_value.copyWith(post: value));
    });
  }
}

/// @nodoc
abstract class _$$_PostListStateCopyWith<$Res>
    implements $PostListStateCopyWith<$Res> {
  factory _$$_PostListStateCopyWith(
          _$_PostListState value, $Res Function(_$_PostListState) then) =
      __$$_PostListStateCopyWithImpl<$Res>;
  @override
  $Res call({Post? post});

  @override
  $PostCopyWith<$Res>? get post;
}

/// @nodoc
class __$$_PostListStateCopyWithImpl<$Res>
    extends _$PostListStateCopyWithImpl<$Res>
    implements _$$_PostListStateCopyWith<$Res> {
  __$$_PostListStateCopyWithImpl(
      _$_PostListState _value, $Res Function(_$_PostListState) _then)
      : super(_value, (v) => _then(v as _$_PostListState));

  @override
  _$_PostListState get _value => super._value as _$_PostListState;

  @override
  $Res call({
    Object? post = freezed,
  }) {
    return _then(_$_PostListState(
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
    ));
  }
}

/// @nodoc

class _$_PostListState implements _PostListState {
  const _$_PostListState({this.post});

  @override
  final Post? post;

  @override
  String toString() {
    return 'PostListState(post: $post)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostListState &&
            const DeepCollectionEquality().equals(other.post, post));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(post));

  @JsonKey(ignore: true)
  @override
  _$$_PostListStateCopyWith<_$_PostListState> get copyWith =>
      __$$_PostListStateCopyWithImpl<_$_PostListState>(this, _$identity);
}

abstract class _PostListState implements PostListState {
  const factory _PostListState({final Post? post}) = _$_PostListState;

  @override
  Post? get post => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PostListStateCopyWith<_$_PostListState> get copyWith =>
      throw _privateConstructorUsedError;
}
