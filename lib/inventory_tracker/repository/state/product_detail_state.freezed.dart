// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Products products) loadProductDetail,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Products products)? loadProductDetail,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Products products)? loadProductDetail,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetail value) loadProductDetail,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(ProductDetailLoading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetail value)? loadProductDetail,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(ProductDetailLoading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetail value)? loadProductDetail,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(ProductDetailLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailStateCopyWith<$Res> {
  factory $ProductDetailStateCopyWith(
          ProductDetailState value, $Res Function(ProductDetailState) then) =
      _$ProductDetailStateCopyWithImpl<$Res, ProductDetailState>;
}

/// @nodoc
class _$ProductDetailStateCopyWithImpl<$Res, $Val extends ProductDetailState>
    implements $ProductDetailStateCopyWith<$Res> {
  _$ProductDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProductDetailImplCopyWith<$Res> {
  factory _$$ProductDetailImplCopyWith(
          _$ProductDetailImpl value, $Res Function(_$ProductDetailImpl) then) =
      __$$ProductDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Products products});
}

/// @nodoc
class __$$ProductDetailImplCopyWithImpl<$Res>
    extends _$ProductDetailStateCopyWithImpl<$Res, _$ProductDetailImpl>
    implements _$$ProductDetailImplCopyWith<$Res> {
  __$$ProductDetailImplCopyWithImpl(
      _$ProductDetailImpl _value, $Res Function(_$ProductDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$ProductDetailImpl(
      null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as Products,
    ));
  }
}

/// @nodoc

class _$ProductDetailImpl implements ProductDetail {
  const _$ProductDetailImpl(this.products);

  @override
  final Products products;

  @override
  String toString() {
    return 'ProductDetailState.loadProductDetail(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailImpl &&
            (identical(other.products, products) ||
                other.products == products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailImplCopyWith<_$ProductDetailImpl> get copyWith =>
      __$$ProductDetailImplCopyWithImpl<_$ProductDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Products products) loadProductDetail,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadProductDetail(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Products products)? loadProductDetail,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadProductDetail?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Products products)? loadProductDetail,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadProductDetail != null) {
      return loadProductDetail(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetail value) loadProductDetail,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(ProductDetailLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadProductDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetail value)? loadProductDetail,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(ProductDetailLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadProductDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetail value)? loadProductDetail,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(ProductDetailLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadProductDetail != null) {
      return loadProductDetail(this);
    }
    return orElse();
  }
}

abstract class ProductDetail implements ProductDetailState {
  const factory ProductDetail(final Products products) = _$ProductDetailImpl;

  Products get products;
  @JsonKey(ignore: true)
  _$$ProductDetailImplCopyWith<_$ProductDetailImpl> get copyWith =>
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
    extends _$ProductDetailStateCopyWithImpl<$Res, _$IsDataExitImpl>
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
    return 'ProductDetailState.isDataExist(isExit: $isExit)';
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
    required TResult Function(Products products) loadProductDetail,
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
    TResult? Function(Products products)? loadProductDetail,
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
    TResult Function(Products products)? loadProductDetail,
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
    required TResult Function(ProductDetail value) loadProductDetail,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(ProductDetailLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return isDataExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetail value)? loadProductDetail,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(ProductDetailLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return isDataExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetail value)? loadProductDetail,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(ProductDetailLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (isDataExist != null) {
      return isDataExist(this);
    }
    return orElse();
  }
}

abstract class IsDataExit implements ProductDetailState {
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
    extends _$ProductDetailStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ProductDetailState.initial()';
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
    required TResult Function(Products products) loadProductDetail,
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
    TResult? Function(Products products)? loadProductDetail,
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
    TResult Function(Products products)? loadProductDetail,
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
    required TResult Function(ProductDetail value) loadProductDetail,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(ProductDetailLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetail value)? loadProductDetail,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(ProductDetailLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetail value)? loadProductDetail,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(ProductDetailLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ProductDetailState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ProductDetailLoadingImplCopyWith<$Res> {
  factory _$$ProductDetailLoadingImplCopyWith(_$ProductDetailLoadingImpl value,
          $Res Function(_$ProductDetailLoadingImpl) then) =
      __$$ProductDetailLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductDetailLoadingImplCopyWithImpl<$Res>
    extends _$ProductDetailStateCopyWithImpl<$Res, _$ProductDetailLoadingImpl>
    implements _$$ProductDetailLoadingImplCopyWith<$Res> {
  __$$ProductDetailLoadingImplCopyWithImpl(_$ProductDetailLoadingImpl _value,
      $Res Function(_$ProductDetailLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductDetailLoadingImpl implements ProductDetailLoading {
  const _$ProductDetailLoadingImpl();

  @override
  String toString() {
    return 'ProductDetailState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Products products) loadProductDetail,
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
    TResult? Function(Products products)? loadProductDetail,
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
    TResult Function(Products products)? loadProductDetail,
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
    required TResult Function(ProductDetail value) loadProductDetail,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(ProductDetailLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetail value)? loadProductDetail,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(ProductDetailLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetail value)? loadProductDetail,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(ProductDetailLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProductDetailLoading implements ProductDetailState {
  const factory ProductDetailLoading() = _$ProductDetailLoadingImpl;
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
    extends _$ProductDetailStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'ProductDetailState.error(error: $error)';
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
    required TResult Function(Products products) loadProductDetail,
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
    TResult? Function(Products products)? loadProductDetail,
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
    TResult Function(Products products)? loadProductDetail,
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
    required TResult Function(ProductDetail value) loadProductDetail,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(ProductDetailLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetail value)? loadProductDetail,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(ProductDetailLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetail value)? loadProductDetail,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(ProductDetailLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ProductDetailState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}