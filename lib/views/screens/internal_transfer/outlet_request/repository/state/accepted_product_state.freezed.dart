// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accepted_product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AcceptedProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<int, Map<String, dynamic>> acceptedProductLineMap)
        loadOtherRequestData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<int, Map<String, dynamic>> acceptedProductLineMap)?
        loadOtherRequestData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<int, Map<String, dynamic>> acceptedProductLineMap)?
        loadOtherRequestData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AcceptedProductLineMap value)
        loadOtherRequestData,
    required TResult Function(Initial value) initial,
    required TResult Function(AcceptedLoading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AcceptedProductLineMap value)? loadOtherRequestData,
    TResult? Function(Initial value)? initial,
    TResult? Function(AcceptedLoading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AcceptedProductLineMap value)? loadOtherRequestData,
    TResult Function(Initial value)? initial,
    TResult Function(AcceptedLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcceptedProductStateCopyWith<$Res> {
  factory $AcceptedProductStateCopyWith(AcceptedProductState value,
          $Res Function(AcceptedProductState) then) =
      _$AcceptedProductStateCopyWithImpl<$Res, AcceptedProductState>;
}

/// @nodoc
class _$AcceptedProductStateCopyWithImpl<$Res,
        $Val extends AcceptedProductState>
    implements $AcceptedProductStateCopyWith<$Res> {
  _$AcceptedProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AcceptedProductLineMapImplCopyWith<$Res> {
  factory _$$AcceptedProductLineMapImplCopyWith(
          _$AcceptedProductLineMapImpl value,
          $Res Function(_$AcceptedProductLineMapImpl) then) =
      __$$AcceptedProductLineMapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<int, Map<String, dynamic>> acceptedProductLineMap});
}

/// @nodoc
class __$$AcceptedProductLineMapImplCopyWithImpl<$Res>
    extends _$AcceptedProductStateCopyWithImpl<$Res,
        _$AcceptedProductLineMapImpl>
    implements _$$AcceptedProductLineMapImplCopyWith<$Res> {
  __$$AcceptedProductLineMapImplCopyWithImpl(
      _$AcceptedProductLineMapImpl _value,
      $Res Function(_$AcceptedProductLineMapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptedProductLineMap = null,
  }) {
    return _then(_$AcceptedProductLineMapImpl(
      null == acceptedProductLineMap
          ? _value._acceptedProductLineMap
          : acceptedProductLineMap // ignore: cast_nullable_to_non_nullable
              as Map<int, Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$AcceptedProductLineMapImpl implements AcceptedProductLineMap {
  const _$AcceptedProductLineMapImpl(
      final Map<int, Map<String, dynamic>> acceptedProductLineMap)
      : _acceptedProductLineMap = acceptedProductLineMap;

  final Map<int, Map<String, dynamic>> _acceptedProductLineMap;
  @override
  Map<int, Map<String, dynamic>> get acceptedProductLineMap {
    if (_acceptedProductLineMap is EqualUnmodifiableMapView)
      return _acceptedProductLineMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_acceptedProductLineMap);
  }

  @override
  String toString() {
    return 'AcceptedProductState.loadOtherRequestData(acceptedProductLineMap: $acceptedProductLineMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptedProductLineMapImpl &&
            const DeepCollectionEquality().equals(
                other._acceptedProductLineMap, _acceptedProductLineMap));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_acceptedProductLineMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptedProductLineMapImplCopyWith<_$AcceptedProductLineMapImpl>
      get copyWith => __$$AcceptedProductLineMapImplCopyWithImpl<
          _$AcceptedProductLineMapImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<int, Map<String, dynamic>> acceptedProductLineMap)
        loadOtherRequestData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadOtherRequestData(acceptedProductLineMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<int, Map<String, dynamic>> acceptedProductLineMap)?
        loadOtherRequestData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadOtherRequestData?.call(acceptedProductLineMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<int, Map<String, dynamic>> acceptedProductLineMap)?
        loadOtherRequestData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadOtherRequestData != null) {
      return loadOtherRequestData(acceptedProductLineMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AcceptedProductLineMap value)
        loadOtherRequestData,
    required TResult Function(Initial value) initial,
    required TResult Function(AcceptedLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadOtherRequestData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AcceptedProductLineMap value)? loadOtherRequestData,
    TResult? Function(Initial value)? initial,
    TResult? Function(AcceptedLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadOtherRequestData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AcceptedProductLineMap value)? loadOtherRequestData,
    TResult Function(Initial value)? initial,
    TResult Function(AcceptedLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadOtherRequestData != null) {
      return loadOtherRequestData(this);
    }
    return orElse();
  }
}

abstract class AcceptedProductLineMap implements AcceptedProductState {
  const factory AcceptedProductLineMap(
          final Map<int, Map<String, dynamic>> acceptedProductLineMap) =
      _$AcceptedProductLineMapImpl;

  Map<int, Map<String, dynamic>> get acceptedProductLineMap;
  @JsonKey(ignore: true)
  _$$AcceptedProductLineMapImplCopyWith<_$AcceptedProductLineMapImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AcceptedProductStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'AcceptedProductState.initial()';
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
    required TResult Function(
            Map<int, Map<String, dynamic>> acceptedProductLineMap)
        loadOtherRequestData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<int, Map<String, dynamic>> acceptedProductLineMap)?
        loadOtherRequestData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<int, Map<String, dynamic>> acceptedProductLineMap)?
        loadOtherRequestData,
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
    required TResult Function(AcceptedProductLineMap value)
        loadOtherRequestData,
    required TResult Function(Initial value) initial,
    required TResult Function(AcceptedLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AcceptedProductLineMap value)? loadOtherRequestData,
    TResult? Function(Initial value)? initial,
    TResult? Function(AcceptedLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AcceptedProductLineMap value)? loadOtherRequestData,
    TResult Function(Initial value)? initial,
    TResult Function(AcceptedLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AcceptedProductState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AcceptedLoadingImplCopyWith<$Res> {
  factory _$$AcceptedLoadingImplCopyWith(_$AcceptedLoadingImpl value,
          $Res Function(_$AcceptedLoadingImpl) then) =
      __$$AcceptedLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AcceptedLoadingImplCopyWithImpl<$Res>
    extends _$AcceptedProductStateCopyWithImpl<$Res, _$AcceptedLoadingImpl>
    implements _$$AcceptedLoadingImplCopyWith<$Res> {
  __$$AcceptedLoadingImplCopyWithImpl(
      _$AcceptedLoadingImpl _value, $Res Function(_$AcceptedLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AcceptedLoadingImpl implements AcceptedLoading {
  const _$AcceptedLoadingImpl();

  @override
  String toString() {
    return 'AcceptedProductState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AcceptedLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<int, Map<String, dynamic>> acceptedProductLineMap)
        loadOtherRequestData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<int, Map<String, dynamic>> acceptedProductLineMap)?
        loadOtherRequestData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<int, Map<String, dynamic>> acceptedProductLineMap)?
        loadOtherRequestData,
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
    required TResult Function(AcceptedProductLineMap value)
        loadOtherRequestData,
    required TResult Function(Initial value) initial,
    required TResult Function(AcceptedLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AcceptedProductLineMap value)? loadOtherRequestData,
    TResult? Function(Initial value)? initial,
    TResult? Function(AcceptedLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AcceptedProductLineMap value)? loadOtherRequestData,
    TResult Function(Initial value)? initial,
    TResult Function(AcceptedLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AcceptedLoading implements AcceptedProductState {
  const factory AcceptedLoading() = _$AcceptedLoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AcceptedProductStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'AcceptedProductState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<int, Map<String, dynamic>> acceptedProductLineMap)
        loadOtherRequestData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<int, Map<String, dynamic>> acceptedProductLineMap)?
        loadOtherRequestData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<int, Map<String, dynamic>> acceptedProductLineMap)?
        loadOtherRequestData,
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
    required TResult Function(AcceptedProductLineMap value)
        loadOtherRequestData,
    required TResult Function(Initial value) initial,
    required TResult Function(AcceptedLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AcceptedProductLineMap value)? loadOtherRequestData,
    TResult? Function(Initial value)? initial,
    TResult? Function(AcceptedLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AcceptedProductLineMap value)? loadOtherRequestData,
    TResult Function(Initial value)? initial,
    TResult Function(AcceptedLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements AcceptedProductState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
