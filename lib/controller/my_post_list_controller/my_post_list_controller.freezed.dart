// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_post_list_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyPostListState {
  Post? get post => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyPostListStateCopyWith<MyPostListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPostListStateCopyWith<$Res> {
  factory $MyPostListStateCopyWith(
          MyPostListState value, $Res Function(MyPostListState) then) =
      _$MyPostListStateCopyWithImpl<$Res>;
  $Res call({Post? post});

  $PostCopyWith<$Res>? get post;
}

/// @nodoc
class _$MyPostListStateCopyWithImpl<$Res>
    implements $MyPostListStateCopyWith<$Res> {
  _$MyPostListStateCopyWithImpl(this._value, this._then);

  final MyPostListState _value;
  // ignore: unused_field
  final $Res Function(MyPostListState) _then;

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
abstract class _$$_MyPostListStateCopyWith<$Res>
    implements $MyPostListStateCopyWith<$Res> {
  factory _$$_MyPostListStateCopyWith(
          _$_MyPostListState value, $Res Function(_$_MyPostListState) then) =
      __$$_MyPostListStateCopyWithImpl<$Res>;
  @override
  $Res call({Post? post});

  @override
  $PostCopyWith<$Res>? get post;
}

/// @nodoc
class __$$_MyPostListStateCopyWithImpl<$Res>
    extends _$MyPostListStateCopyWithImpl<$Res>
    implements _$$_MyPostListStateCopyWith<$Res> {
  __$$_MyPostListStateCopyWithImpl(
      _$_MyPostListState _value, $Res Function(_$_MyPostListState) _then)
      : super(_value, (v) => _then(v as _$_MyPostListState));

  @override
  _$_MyPostListState get _value => super._value as _$_MyPostListState;

  @override
  $Res call({
    Object? post = freezed,
  }) {
    return _then(_$_MyPostListState(
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
    ));
  }
}

/// @nodoc

class _$_MyPostListState implements _MyPostListState {
  const _$_MyPostListState({this.post});

  @override
  final Post? post;

  @override
  String toString() {
    return 'MyPostListState(post: $post)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyPostListState &&
            const DeepCollectionEquality().equals(other.post, post));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(post));

  @JsonKey(ignore: true)
  @override
  _$$_MyPostListStateCopyWith<_$_MyPostListState> get copyWith =>
      __$$_MyPostListStateCopyWithImpl<_$_MyPostListState>(this, _$identity);
}

abstract class _MyPostListState implements MyPostListState {
  const factory _MyPostListState({final Post? post}) = _$_MyPostListState;

  @override
  Post? get post => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MyPostListStateCopyWith<_$_MyPostListState> get copyWith =>
      throw _privateConstructorUsedError;
}
