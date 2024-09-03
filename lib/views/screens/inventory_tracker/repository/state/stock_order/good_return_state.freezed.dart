// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'good_return_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GoodReturnState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)
        checkOut,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)?
        checkOut,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)?
        checkOut,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsGoodReturnMap value) checkOut,
    required TResult Function(Initial value) initial,
    required TResult Function(GoodReturnLoading value) loading,
    required TResult Function(GoodReturnError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IsGoodReturnMap value)? checkOut,
    TResult? Function(Initial value)? initial,
    TResult? Function(GoodReturnLoading value)? loading,
    TResult? Function(GoodReturnError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsGoodReturnMap value)? checkOut,
    TResult Function(Initial value)? initial,
    TResult Function(GoodReturnLoading value)? loading,
    TResult Function(GoodReturnError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoodReturnStateCopyWith<$Res> {
  factory $GoodReturnStateCopyWith(
          GoodReturnState value, $Res Function(GoodReturnState) then) =
      _$GoodReturnStateCopyWithImpl<$Res, GoodReturnState>;
}

/// @nodoc
class _$GoodReturnStateCopyWithImpl<$Res, $Val extends GoodReturnState>
    implements $GoodReturnStateCopyWith<$Res> {
  _$GoodReturnStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IsGoodReturnMapImplCopyWith<$Res> {
  factory _$$IsGoodReturnMapImplCopyWith(_$IsGoodReturnMapImpl value,
          $Res Function(_$IsGoodReturnMapImpl) then) =
      __$$IsGoodReturnMapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, Map<int, List<bool>>> isGoodReturnMap});
}

/// @nodoc
class __$$IsGoodReturnMapImplCopyWithImpl<$Res>
    extends _$GoodReturnStateCopyWithImpl<$Res, _$IsGoodReturnMapImpl>
    implements _$$IsGoodReturnMapImplCopyWith<$Res> {
  __$$IsGoodReturnMapImplCopyWithImpl(
      _$IsGoodReturnMapImpl _value, $Res Function(_$IsGoodReturnMapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isGoodReturnMap = null,
  }) {
    return _then(_$IsGoodReturnMapImpl(
      null == isGoodReturnMap
          ? _value._isGoodReturnMap
          : isGoodReturnMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<int, List<bool>>>,
    ));
  }
}

/// @nodoc

class _$IsGoodReturnMapImpl implements IsGoodReturnMap {
  const _$IsGoodReturnMapImpl(
      final Map<String, Map<int, List<bool>>> isGoodReturnMap)
      : _isGoodReturnMap = isGoodReturnMap;

  final Map<String, Map<int, List<bool>>> _isGoodReturnMap;
  @override
  Map<String, Map<int, List<bool>>> get isGoodReturnMap {
    if (_isGoodReturnMap is EqualUnmodifiableMapView) return _isGoodReturnMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isGoodReturnMap);
  }

  @override
  String toString() {
    return 'GoodReturnState.checkOut(isGoodReturnMap: $isGoodReturnMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsGoodReturnMapImpl &&
            const DeepCollectionEquality()
                .equals(other._isGoodReturnMap, _isGoodReturnMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_isGoodReturnMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsGoodReturnMapImplCopyWith<_$IsGoodReturnMapImpl> get copyWith =>
      __$$IsGoodReturnMapImplCopyWithImpl<_$IsGoodReturnMapImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)
        checkOut,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return checkOut(isGoodReturnMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)?
        checkOut,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return checkOut?.call(isGoodReturnMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)?
        checkOut,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (checkOut != null) {
      return checkOut(isGoodReturnMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsGoodReturnMap value) checkOut,
    required TResult Function(Initial value) initial,
    required TResult Function(GoodReturnLoading value) loading,
    required TResult Function(GoodReturnError value) error,
  }) {
    return checkOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IsGoodReturnMap value)? checkOut,
    TResult? Function(Initial value)? initial,
    TResult? Function(GoodReturnLoading value)? loading,
    TResult? Function(GoodReturnError value)? error,
  }) {
    return checkOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsGoodReturnMap value)? checkOut,
    TResult Function(Initial value)? initial,
    TResult Function(GoodReturnLoading value)? loading,
    TResult Function(GoodReturnError value)? error,
    required TResult orElse(),
  }) {
    if (checkOut != null) {
      return checkOut(this);
    }
    return orElse();
  }
}

abstract class IsGoodReturnMap implements GoodReturnState {
  const factory IsGoodReturnMap(
          final Map<String, Map<int, List<bool>>> isGoodReturnMap) =
      _$IsGoodReturnMapImpl;

  Map<String, Map<int, List<bool>>> get isGoodReturnMap;
  @JsonKey(ignore: true)
  _$$IsGoodReturnMapImplCopyWith<_$IsGoodReturnMapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GoodReturnStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GoodReturnState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)
        checkOut,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)?
        checkOut,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)?
        checkOut,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
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
    required TResult Function(IsGoodReturnMap value) checkOut,
    required TResult Function(Initial value) initial,
    required TResult Function(GoodReturnLoading value) loading,
    required TResult Function(GoodReturnError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IsGoodReturnMap value)? checkOut,
    TResult? Function(Initial value)? initial,
    TResult? Function(GoodReturnLoading value)? loading,
    TResult? Function(GoodReturnError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsGoodReturnMap value)? checkOut,
    TResult Function(Initial value)? initial,
    TResult Function(GoodReturnLoading value)? loading,
    TResult Function(GoodReturnError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements GoodReturnState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$GoodReturnLoadingImplCopyWith<$Res> {
  factory _$$GoodReturnLoadingImplCopyWith(_$GoodReturnLoadingImpl value,
          $Res Function(_$GoodReturnLoadingImpl) then) =
      __$$GoodReturnLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoodReturnLoadingImplCopyWithImpl<$Res>
    extends _$GoodReturnStateCopyWithImpl<$Res, _$GoodReturnLoadingImpl>
    implements _$$GoodReturnLoadingImplCopyWith<$Res> {
  __$$GoodReturnLoadingImplCopyWithImpl(_$GoodReturnLoadingImpl _value,
      $Res Function(_$GoodReturnLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoodReturnLoadingImpl implements GoodReturnLoading {
  const _$GoodReturnLoadingImpl();

  @override
  String toString() {
    return 'GoodReturnState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoodReturnLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)
        checkOut,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)?
        checkOut,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)?
        checkOut,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
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
    required TResult Function(IsGoodReturnMap value) checkOut,
    required TResult Function(Initial value) initial,
    required TResult Function(GoodReturnLoading value) loading,
    required TResult Function(GoodReturnError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IsGoodReturnMap value)? checkOut,
    TResult? Function(Initial value)? initial,
    TResult? Function(GoodReturnLoading value)? loading,
    TResult? Function(GoodReturnError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsGoodReturnMap value)? checkOut,
    TResult Function(Initial value)? initial,
    TResult Function(GoodReturnLoading value)? loading,
    TResult Function(GoodReturnError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GoodReturnLoading implements GoodReturnState {
  const factory GoodReturnLoading() = _$GoodReturnLoadingImpl;
}

/// @nodoc
abstract class _$$GoodReturnErrorImplCopyWith<$Res> {
  factory _$$GoodReturnErrorImplCopyWith(_$GoodReturnErrorImpl value,
          $Res Function(_$GoodReturnErrorImpl) then) =
      __$$GoodReturnErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$GoodReturnErrorImplCopyWithImpl<$Res>
    extends _$GoodReturnStateCopyWithImpl<$Res, _$GoodReturnErrorImpl>
    implements _$$GoodReturnErrorImplCopyWith<$Res> {
  __$$GoodReturnErrorImplCopyWithImpl(
      _$GoodReturnErrorImpl _value, $Res Function(_$GoodReturnErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$GoodReturnErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GoodReturnErrorImpl implements GoodReturnError {
  const _$GoodReturnErrorImpl({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'GoodReturnState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoodReturnErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoodReturnErrorImplCopyWith<_$GoodReturnErrorImpl> get copyWith =>
      __$$GoodReturnErrorImplCopyWithImpl<_$GoodReturnErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)
        checkOut,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)?
        checkOut,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, Map<int, List<bool>>> isGoodReturnMap)?
        checkOut,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IsGoodReturnMap value) checkOut,
    required TResult Function(Initial value) initial,
    required TResult Function(GoodReturnLoading value) loading,
    required TResult Function(GoodReturnError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IsGoodReturnMap value)? checkOut,
    TResult? Function(Initial value)? initial,
    TResult? Function(GoodReturnLoading value)? loading,
    TResult? Function(GoodReturnError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IsGoodReturnMap value)? checkOut,
    TResult Function(Initial value)? initial,
    TResult Function(GoodReturnLoading value)? loading,
    TResult Function(GoodReturnError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GoodReturnError implements GoodReturnState {
  const factory GoodReturnError({final String? error}) = _$GoodReturnErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$GoodReturnErrorImplCopyWith<_$GoodReturnErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
