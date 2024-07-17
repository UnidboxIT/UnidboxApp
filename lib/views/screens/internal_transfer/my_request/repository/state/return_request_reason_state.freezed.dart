// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_request_reason_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReturnRequestReasonState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReturnRequestReason> returnRequestReasonList)
        loadReturnRequestReason,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReturnRequestReason> returnRequestReasonList)?
        loadReturnRequestReason,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReturnRequestReason> returnRequestReasonList)?
        loadReturnRequestReason,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReturnRequestReasonList value)
        loadReturnRequestReason,
    required TResult Function(Initial value) initial,
    required TResult Function(ReturnReceiveLoading value) loading,
    required TResult Function(ReturnReceiveError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReturnRequestReasonList value)? loadReturnRequestReason,
    TResult? Function(Initial value)? initial,
    TResult? Function(ReturnReceiveLoading value)? loading,
    TResult? Function(ReturnReceiveError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReturnRequestReasonList value)? loadReturnRequestReason,
    TResult Function(Initial value)? initial,
    TResult Function(ReturnReceiveLoading value)? loading,
    TResult Function(ReturnReceiveError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnRequestReasonStateCopyWith<$Res> {
  factory $ReturnRequestReasonStateCopyWith(ReturnRequestReasonState value,
          $Res Function(ReturnRequestReasonState) then) =
      _$ReturnRequestReasonStateCopyWithImpl<$Res, ReturnRequestReasonState>;
}

/// @nodoc
class _$ReturnRequestReasonStateCopyWithImpl<$Res,
        $Val extends ReturnRequestReasonState>
    implements $ReturnRequestReasonStateCopyWith<$Res> {
  _$ReturnRequestReasonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReturnRequestReasonListImplCopyWith<$Res> {
  factory _$$ReturnRequestReasonListImplCopyWith(
          _$ReturnRequestReasonListImpl value,
          $Res Function(_$ReturnRequestReasonListImpl) then) =
      __$$ReturnRequestReasonListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ReturnRequestReason> returnRequestReasonList});
}

/// @nodoc
class __$$ReturnRequestReasonListImplCopyWithImpl<$Res>
    extends _$ReturnRequestReasonStateCopyWithImpl<$Res,
        _$ReturnRequestReasonListImpl>
    implements _$$ReturnRequestReasonListImplCopyWith<$Res> {
  __$$ReturnRequestReasonListImplCopyWithImpl(
      _$ReturnRequestReasonListImpl _value,
      $Res Function(_$ReturnRequestReasonListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnRequestReasonList = null,
  }) {
    return _then(_$ReturnRequestReasonListImpl(
      null == returnRequestReasonList
          ? _value._returnRequestReasonList
          : returnRequestReasonList // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestReason>,
    ));
  }
}

/// @nodoc

class _$ReturnRequestReasonListImpl implements ReturnRequestReasonList {
  const _$ReturnRequestReasonListImpl(
      final List<ReturnRequestReason> returnRequestReasonList)
      : _returnRequestReasonList = returnRequestReasonList;

  final List<ReturnRequestReason> _returnRequestReasonList;
  @override
  List<ReturnRequestReason> get returnRequestReasonList {
    if (_returnRequestReasonList is EqualUnmodifiableListView)
      return _returnRequestReasonList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_returnRequestReasonList);
  }

  @override
  String toString() {
    return 'ReturnRequestReasonState.loadReturnRequestReason(returnRequestReasonList: $returnRequestReasonList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnRequestReasonListImpl &&
            const DeepCollectionEquality().equals(
                other._returnRequestReasonList, _returnRequestReasonList));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_returnRequestReasonList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnRequestReasonListImplCopyWith<_$ReturnRequestReasonListImpl>
      get copyWith => __$$ReturnRequestReasonListImplCopyWithImpl<
          _$ReturnRequestReasonListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReturnRequestReason> returnRequestReasonList)
        loadReturnRequestReason,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadReturnRequestReason(returnRequestReasonList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReturnRequestReason> returnRequestReasonList)?
        loadReturnRequestReason,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadReturnRequestReason?.call(returnRequestReasonList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReturnRequestReason> returnRequestReasonList)?
        loadReturnRequestReason,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadReturnRequestReason != null) {
      return loadReturnRequestReason(returnRequestReasonList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReturnRequestReasonList value)
        loadReturnRequestReason,
    required TResult Function(Initial value) initial,
    required TResult Function(ReturnReceiveLoading value) loading,
    required TResult Function(ReturnReceiveError value) error,
  }) {
    return loadReturnRequestReason(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReturnRequestReasonList value)? loadReturnRequestReason,
    TResult? Function(Initial value)? initial,
    TResult? Function(ReturnReceiveLoading value)? loading,
    TResult? Function(ReturnReceiveError value)? error,
  }) {
    return loadReturnRequestReason?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReturnRequestReasonList value)? loadReturnRequestReason,
    TResult Function(Initial value)? initial,
    TResult Function(ReturnReceiveLoading value)? loading,
    TResult Function(ReturnReceiveError value)? error,
    required TResult orElse(),
  }) {
    if (loadReturnRequestReason != null) {
      return loadReturnRequestReason(this);
    }
    return orElse();
  }
}

abstract class ReturnRequestReasonList implements ReturnRequestReasonState {
  const factory ReturnRequestReasonList(
          final List<ReturnRequestReason> returnRequestReasonList) =
      _$ReturnRequestReasonListImpl;

  List<ReturnRequestReason> get returnRequestReasonList;
  @JsonKey(ignore: true)
  _$$ReturnRequestReasonListImplCopyWith<_$ReturnRequestReasonListImpl>
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
    extends _$ReturnRequestReasonStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ReturnRequestReasonState.initial()';
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
    required TResult Function(List<ReturnRequestReason> returnRequestReasonList)
        loadReturnRequestReason,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReturnRequestReason> returnRequestReasonList)?
        loadReturnRequestReason,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReturnRequestReason> returnRequestReasonList)?
        loadReturnRequestReason,
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
    required TResult Function(ReturnRequestReasonList value)
        loadReturnRequestReason,
    required TResult Function(Initial value) initial,
    required TResult Function(ReturnReceiveLoading value) loading,
    required TResult Function(ReturnReceiveError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReturnRequestReasonList value)? loadReturnRequestReason,
    TResult? Function(Initial value)? initial,
    TResult? Function(ReturnReceiveLoading value)? loading,
    TResult? Function(ReturnReceiveError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReturnRequestReasonList value)? loadReturnRequestReason,
    TResult Function(Initial value)? initial,
    TResult Function(ReturnReceiveLoading value)? loading,
    TResult Function(ReturnReceiveError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ReturnRequestReasonState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ReturnReceiveLoadingImplCopyWith<$Res> {
  factory _$$ReturnReceiveLoadingImplCopyWith(_$ReturnReceiveLoadingImpl value,
          $Res Function(_$ReturnReceiveLoadingImpl) then) =
      __$$ReturnReceiveLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReturnReceiveLoadingImplCopyWithImpl<$Res>
    extends _$ReturnRequestReasonStateCopyWithImpl<$Res,
        _$ReturnReceiveLoadingImpl>
    implements _$$ReturnReceiveLoadingImplCopyWith<$Res> {
  __$$ReturnReceiveLoadingImplCopyWithImpl(_$ReturnReceiveLoadingImpl _value,
      $Res Function(_$ReturnReceiveLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReturnReceiveLoadingImpl implements ReturnReceiveLoading {
  const _$ReturnReceiveLoadingImpl();

  @override
  String toString() {
    return 'ReturnRequestReasonState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnReceiveLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReturnRequestReason> returnRequestReasonList)
        loadReturnRequestReason,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReturnRequestReason> returnRequestReasonList)?
        loadReturnRequestReason,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReturnRequestReason> returnRequestReasonList)?
        loadReturnRequestReason,
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
    required TResult Function(ReturnRequestReasonList value)
        loadReturnRequestReason,
    required TResult Function(Initial value) initial,
    required TResult Function(ReturnReceiveLoading value) loading,
    required TResult Function(ReturnReceiveError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReturnRequestReasonList value)? loadReturnRequestReason,
    TResult? Function(Initial value)? initial,
    TResult? Function(ReturnReceiveLoading value)? loading,
    TResult? Function(ReturnReceiveError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReturnRequestReasonList value)? loadReturnRequestReason,
    TResult Function(Initial value)? initial,
    TResult Function(ReturnReceiveLoading value)? loading,
    TResult Function(ReturnReceiveError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ReturnReceiveLoading implements ReturnRequestReasonState {
  const factory ReturnReceiveLoading() = _$ReturnReceiveLoadingImpl;
}

/// @nodoc
abstract class _$$ReturnReceiveErrorImplCopyWith<$Res> {
  factory _$$ReturnReceiveErrorImplCopyWith(_$ReturnReceiveErrorImpl value,
          $Res Function(_$ReturnReceiveErrorImpl) then) =
      __$$ReturnReceiveErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$ReturnReceiveErrorImplCopyWithImpl<$Res>
    extends _$ReturnRequestReasonStateCopyWithImpl<$Res,
        _$ReturnReceiveErrorImpl>
    implements _$$ReturnReceiveErrorImplCopyWith<$Res> {
  __$$ReturnReceiveErrorImplCopyWithImpl(_$ReturnReceiveErrorImpl _value,
      $Res Function(_$ReturnReceiveErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ReturnReceiveErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReturnReceiveErrorImpl implements ReturnReceiveError {
  const _$ReturnReceiveErrorImpl({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'ReturnRequestReasonState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnReceiveErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnReceiveErrorImplCopyWith<_$ReturnReceiveErrorImpl> get copyWith =>
      __$$ReturnReceiveErrorImplCopyWithImpl<_$ReturnReceiveErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReturnRequestReason> returnRequestReasonList)
        loadReturnRequestReason,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReturnRequestReason> returnRequestReasonList)?
        loadReturnRequestReason,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReturnRequestReason> returnRequestReasonList)?
        loadReturnRequestReason,
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
    required TResult Function(ReturnRequestReasonList value)
        loadReturnRequestReason,
    required TResult Function(Initial value) initial,
    required TResult Function(ReturnReceiveLoading value) loading,
    required TResult Function(ReturnReceiveError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReturnRequestReasonList value)? loadReturnRequestReason,
    TResult? Function(Initial value)? initial,
    TResult? Function(ReturnReceiveLoading value)? loading,
    TResult? Function(ReturnReceiveError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReturnRequestReasonList value)? loadReturnRequestReason,
    TResult Function(Initial value)? initial,
    TResult Function(ReturnReceiveLoading value)? loading,
    TResult Function(ReturnReceiveError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ReturnReceiveError implements ReturnRequestReasonState {
  const factory ReturnReceiveError({final String? error}) =
      _$ReturnReceiveErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ReturnReceiveErrorImplCopyWith<_$ReturnReceiveErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
