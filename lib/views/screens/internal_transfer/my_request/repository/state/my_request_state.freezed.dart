// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyRequestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyRequestStateCopyWith<$Res> {
  factory $MyRequestStateCopyWith(
          MyRequestState value, $Res Function(MyRequestState) then) =
      _$MyRequestStateCopyWithImpl<$Res, MyRequestState>;
}

/// @nodoc
class _$MyRequestStateCopyWithImpl<$Res, $Val extends MyRequestState>
    implements $MyRequestStateCopyWith<$Res> {
  _$MyRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MyRequestListImplCopyWith<$Res> {
  factory _$$MyRequestListImplCopyWith(
          _$MyRequestListImpl value, $Res Function(_$MyRequestListImpl) then) =
      __$$MyRequestListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MyRequest> myRequestList});
}

/// @nodoc
class __$$MyRequestListImplCopyWithImpl<$Res>
    extends _$MyRequestStateCopyWithImpl<$Res, _$MyRequestListImpl>
    implements _$$MyRequestListImplCopyWith<$Res> {
  __$$MyRequestListImplCopyWithImpl(
      _$MyRequestListImpl _value, $Res Function(_$MyRequestListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myRequestList = null,
  }) {
    return _then(_$MyRequestListImpl(
      null == myRequestList
          ? _value._myRequestList
          : myRequestList // ignore: cast_nullable_to_non_nullable
              as List<MyRequest>,
    ));
  }
}

/// @nodoc

class _$MyRequestListImpl implements MyRequestList {
  const _$MyRequestListImpl(final List<MyRequest> myRequestList)
      : _myRequestList = myRequestList;

  final List<MyRequest> _myRequestList;
  @override
  List<MyRequest> get myRequestList {
    if (_myRequestList is EqualUnmodifiableListView) return _myRequestList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myRequestList);
  }

  @override
  String toString() {
    return 'MyRequestState.loadMyRequestData(myRequestList: $myRequestList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyRequestListImpl &&
            const DeepCollectionEquality()
                .equals(other._myRequestList, _myRequestList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_myRequestList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyRequestListImplCopyWith<_$MyRequestListImpl> get copyWith =>
      __$$MyRequestListImplCopyWithImpl<_$MyRequestListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadMyRequestData(myRequestList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadMyRequestData?.call(myRequestList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadMyRequestData != null) {
      return loadMyRequestData(myRequestList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadMyRequestData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadMyRequestData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadMyRequestData != null) {
      return loadMyRequestData(this);
    }
    return orElse();
  }
}

abstract class MyRequestList implements MyRequestState {
  const factory MyRequestList(final List<MyRequest> myRequestList) =
      _$MyRequestListImpl;

  List<MyRequest> get myRequestList;
  @JsonKey(ignore: true)
  _$$MyRequestListImplCopyWith<_$MyRequestListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsDataExitImplCopyWith<$Res> {
  factory _$$IsDataExitImplCopyWith(
          _$IsDataExitImpl value, $Res Function(_$IsDataExitImpl) then) =
      __$$IsDataExitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isExit});
}

/// @nodoc
class __$$IsDataExitImplCopyWithImpl<$Res>
    extends _$MyRequestStateCopyWithImpl<$Res, _$IsDataExitImpl>
    implements _$$IsDataExitImplCopyWith<$Res> {
  __$$IsDataExitImplCopyWithImpl(
      _$IsDataExitImpl _value, $Res Function(_$IsDataExitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExit = null,
  }) {
    return _then(_$IsDataExitImpl(
      null == isExit
          ? _value.isExit
          : isExit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IsDataExitImpl implements IsDataExit {
  const _$IsDataExitImpl(this.isExit);

  @override
  final bool isExit;

  @override
  String toString() {
    return 'MyRequestState.isDataExist(isExit: $isExit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsDataExitImpl &&
            (identical(other.isExit, isExit) || other.isExit == isExit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isExit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsDataExitImplCopyWith<_$IsDataExitImpl> get copyWith =>
      __$$IsDataExitImplCopyWithImpl<_$IsDataExitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return isDataExist(isExit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return isDataExist?.call(isExit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (isDataExist != null) {
      return isDataExist(isExit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return isDataExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return isDataExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (isDataExist != null) {
      return isDataExist(this);
    }
    return orElse();
  }
}

abstract class IsDataExit implements MyRequestState {
  const factory IsDataExit(final bool isExit) = _$IsDataExitImpl;

  bool get isExit;
  @JsonKey(ignore: true)
  _$$IsDataExitImplCopyWith<_$IsDataExitImpl> get copyWith =>
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
    extends _$MyRequestStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'MyRequestState.initial()';
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
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(bool isExit)? isDataExist,
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
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements MyRequestState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$MyRequestLoadingImplCopyWith<$Res> {
  factory _$$MyRequestLoadingImplCopyWith(_$MyRequestLoadingImpl value,
          $Res Function(_$MyRequestLoadingImpl) then) =
      __$$MyRequestLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyRequestLoadingImplCopyWithImpl<$Res>
    extends _$MyRequestStateCopyWithImpl<$Res, _$MyRequestLoadingImpl>
    implements _$$MyRequestLoadingImplCopyWith<$Res> {
  __$$MyRequestLoadingImplCopyWithImpl(_$MyRequestLoadingImpl _value,
      $Res Function(_$MyRequestLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyRequestLoadingImpl implements MyRequestLoading {
  const _$MyRequestLoadingImpl();

  @override
  String toString() {
    return 'MyRequestState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MyRequestLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(bool isExit)? isDataExist,
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
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MyRequestLoading implements MyRequestState {
  const factory MyRequestLoading() = _$MyRequestLoadingImpl;
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
    extends _$MyRequestStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'MyRequestState.error(error: $error)';
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
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(bool isExit)? isDataExist,
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
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements MyRequestState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}