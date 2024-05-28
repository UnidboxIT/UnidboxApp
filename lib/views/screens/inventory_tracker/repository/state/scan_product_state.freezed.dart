// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScanProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Products> scanProductList) loadScanProduct,
    required TResult Function(bool isExit) isSearchDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Products> scanProductList)? loadScanProduct,
    TResult? Function(bool isExit)? isSearchDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Products> scanProductList)? loadScanProduct,
    TResult Function(bool isExit)? isSearchDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScanProductList value) loadScanProduct,
    required TResult Function(IsScanDataExit value) isSearchDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScanProductList value)? loadScanProduct,
    TResult? Function(IsScanDataExit value)? isSearchDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScanProductList value)? loadScanProduct,
    TResult Function(IsScanDataExit value)? isSearchDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanProductStateCopyWith<$Res> {
  factory $ScanProductStateCopyWith(
          ScanProductState value, $Res Function(ScanProductState) then) =
      _$ScanProductStateCopyWithImpl<$Res, ScanProductState>;
}

/// @nodoc
class _$ScanProductStateCopyWithImpl<$Res, $Val extends ScanProductState>
    implements $ScanProductStateCopyWith<$Res> {
  _$ScanProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ScanProductListImplCopyWith<$Res> {
  factory _$$ScanProductListImplCopyWith(_$ScanProductListImpl value,
          $Res Function(_$ScanProductListImpl) then) =
      __$$ScanProductListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Products> scanProductList});
}

/// @nodoc
class __$$ScanProductListImplCopyWithImpl<$Res>
    extends _$ScanProductStateCopyWithImpl<$Res, _$ScanProductListImpl>
    implements _$$ScanProductListImplCopyWith<$Res> {
  __$$ScanProductListImplCopyWithImpl(
      _$ScanProductListImpl _value, $Res Function(_$ScanProductListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanProductList = null,
  }) {
    return _then(_$ScanProductListImpl(
      null == scanProductList
          ? _value._scanProductList
          : scanProductList // ignore: cast_nullable_to_non_nullable
              as List<Products>,
    ));
  }
}

/// @nodoc

class _$ScanProductListImpl implements ScanProductList {
  const _$ScanProductListImpl(final List<Products> scanProductList)
      : _scanProductList = scanProductList;

  final List<Products> _scanProductList;
  @override
  List<Products> get scanProductList {
    if (_scanProductList is EqualUnmodifiableListView) return _scanProductList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scanProductList);
  }

  @override
  String toString() {
    return 'ScanProductState.loadScanProduct(scanProductList: $scanProductList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanProductListImpl &&
            const DeepCollectionEquality()
                .equals(other._scanProductList, _scanProductList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_scanProductList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanProductListImplCopyWith<_$ScanProductListImpl> get copyWith =>
      __$$ScanProductListImplCopyWithImpl<_$ScanProductListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Products> scanProductList) loadScanProduct,
    required TResult Function(bool isExit) isSearchDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadScanProduct(scanProductList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Products> scanProductList)? loadScanProduct,
    TResult? Function(bool isExit)? isSearchDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadScanProduct?.call(scanProductList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Products> scanProductList)? loadScanProduct,
    TResult Function(bool isExit)? isSearchDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadScanProduct != null) {
      return loadScanProduct(scanProductList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScanProductList value) loadScanProduct,
    required TResult Function(IsScanDataExit value) isSearchDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadScanProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScanProductList value)? loadScanProduct,
    TResult? Function(IsScanDataExit value)? isSearchDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadScanProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScanProductList value)? loadScanProduct,
    TResult Function(IsScanDataExit value)? isSearchDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadScanProduct != null) {
      return loadScanProduct(this);
    }
    return orElse();
  }
}

abstract class ScanProductList implements ScanProductState {
  const factory ScanProductList(final List<Products> scanProductList) =
      _$ScanProductListImpl;

  List<Products> get scanProductList;
  @JsonKey(ignore: true)
  _$$ScanProductListImplCopyWith<_$ScanProductListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsScanDataExitImplCopyWith<$Res> {
  factory _$$IsScanDataExitImplCopyWith(_$IsScanDataExitImpl value,
          $Res Function(_$IsScanDataExitImpl) then) =
      __$$IsScanDataExitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isExit});
}

/// @nodoc
class __$$IsScanDataExitImplCopyWithImpl<$Res>
    extends _$ScanProductStateCopyWithImpl<$Res, _$IsScanDataExitImpl>
    implements _$$IsScanDataExitImplCopyWith<$Res> {
  __$$IsScanDataExitImplCopyWithImpl(
      _$IsScanDataExitImpl _value, $Res Function(_$IsScanDataExitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExit = null,
  }) {
    return _then(_$IsScanDataExitImpl(
      null == isExit
          ? _value.isExit
          : isExit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IsScanDataExitImpl implements IsScanDataExit {
  const _$IsScanDataExitImpl(this.isExit);

  @override
  final bool isExit;

  @override
  String toString() {
    return 'ScanProductState.isSearchDataExist(isExit: $isExit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsScanDataExitImpl &&
            (identical(other.isExit, isExit) || other.isExit == isExit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isExit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsScanDataExitImplCopyWith<_$IsScanDataExitImpl> get copyWith =>
      __$$IsScanDataExitImplCopyWithImpl<_$IsScanDataExitImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Products> scanProductList) loadScanProduct,
    required TResult Function(bool isExit) isSearchDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return isSearchDataExist(isExit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Products> scanProductList)? loadScanProduct,
    TResult? Function(bool isExit)? isSearchDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return isSearchDataExist?.call(isExit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Products> scanProductList)? loadScanProduct,
    TResult Function(bool isExit)? isSearchDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (isSearchDataExist != null) {
      return isSearchDataExist(isExit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ScanProductList value) loadScanProduct,
    required TResult Function(IsScanDataExit value) isSearchDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return isSearchDataExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScanProductList value)? loadScanProduct,
    TResult? Function(IsScanDataExit value)? isSearchDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return isSearchDataExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScanProductList value)? loadScanProduct,
    TResult Function(IsScanDataExit value)? isSearchDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (isSearchDataExist != null) {
      return isSearchDataExist(this);
    }
    return orElse();
  }
}

abstract class IsScanDataExit implements ScanProductState {
  const factory IsScanDataExit(final bool isExit) = _$IsScanDataExitImpl;

  bool get isExit;
  @JsonKey(ignore: true)
  _$$IsScanDataExitImplCopyWith<_$IsScanDataExitImpl> get copyWith =>
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
    extends _$ScanProductStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ScanProductState.initial()';
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
    required TResult Function(List<Products> scanProductList) loadScanProduct,
    required TResult Function(bool isExit) isSearchDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Products> scanProductList)? loadScanProduct,
    TResult? Function(bool isExit)? isSearchDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Products> scanProductList)? loadScanProduct,
    TResult Function(bool isExit)? isSearchDataExist,
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
    required TResult Function(ScanProductList value) loadScanProduct,
    required TResult Function(IsScanDataExit value) isSearchDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScanProductList value)? loadScanProduct,
    TResult? Function(IsScanDataExit value)? isSearchDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScanProductList value)? loadScanProduct,
    TResult Function(IsScanDataExit value)? isSearchDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ScanProductState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ScanProductStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ScanProductState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Products> scanProductList) loadScanProduct,
    required TResult Function(bool isExit) isSearchDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Products> scanProductList)? loadScanProduct,
    TResult? Function(bool isExit)? isSearchDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Products> scanProductList)? loadScanProduct,
    TResult Function(bool isExit)? isSearchDataExist,
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
    required TResult Function(ScanProductList value) loadScanProduct,
    required TResult Function(IsScanDataExit value) isSearchDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScanProductList value)? loadScanProduct,
    TResult? Function(IsScanDataExit value)? isSearchDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScanProductList value)? loadScanProduct,
    TResult Function(IsScanDataExit value)? isSearchDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ScanProductState {
  const factory Loading() = _$LoadingImpl;
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
    extends _$ScanProductStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'ScanProductState.error(error: $error)';
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
    required TResult Function(List<Products> scanProductList) loadScanProduct,
    required TResult Function(bool isExit) isSearchDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Products> scanProductList)? loadScanProduct,
    TResult? Function(bool isExit)? isSearchDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Products> scanProductList)? loadScanProduct,
    TResult Function(bool isExit)? isSearchDataExist,
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
    required TResult Function(ScanProductList value) loadScanProduct,
    required TResult Function(IsScanDataExit value) isSearchDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ScanProductList value)? loadScanProduct,
    TResult? Function(IsScanDataExit value)? isSearchDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ScanProductList value)? loadScanProduct,
    TResult Function(IsScanDataExit value)? isSearchDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ScanProductState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
