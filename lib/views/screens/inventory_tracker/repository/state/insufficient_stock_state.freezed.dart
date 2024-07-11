// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insufficient_stock_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InsufficientStockState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String success) success,
    required TResult Function(List<Products> productList) laodProductList,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String success)? success,
    TResult? Function(List<Products> productList)? laodProductList,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String success)? success,
    TResult Function(List<Products> productList)? laodProductList,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Successful value) success,
    required TResult Function(ProductList value) laodProductList,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(InsuffcientLoading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Successful value)? success,
    TResult? Function(ProductList value)? laodProductList,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(InsuffcientLoading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Successful value)? success,
    TResult Function(ProductList value)? laodProductList,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(InsuffcientLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsufficientStockStateCopyWith<$Res> {
  factory $InsufficientStockStateCopyWith(InsufficientStockState value,
          $Res Function(InsufficientStockState) then) =
      _$InsufficientStockStateCopyWithImpl<$Res, InsufficientStockState>;
}

/// @nodoc
class _$InsufficientStockStateCopyWithImpl<$Res,
        $Val extends InsufficientStockState>
    implements $InsufficientStockStateCopyWith<$Res> {
  _$InsufficientStockStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessfulImplCopyWith<$Res> {
  factory _$$SuccessfulImplCopyWith(
          _$SuccessfulImpl value, $Res Function(_$SuccessfulImpl) then) =
      __$$SuccessfulImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String success});
}

/// @nodoc
class __$$SuccessfulImplCopyWithImpl<$Res>
    extends _$InsufficientStockStateCopyWithImpl<$Res, _$SuccessfulImpl>
    implements _$$SuccessfulImplCopyWith<$Res> {
  __$$SuccessfulImplCopyWithImpl(
      _$SuccessfulImpl _value, $Res Function(_$SuccessfulImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_$SuccessfulImpl(
      null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessfulImpl implements Successful {
  const _$SuccessfulImpl(this.success);

  @override
  final String success;

  @override
  String toString() {
    return 'InsufficientStockState.success(success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessfulImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessfulImplCopyWith<_$SuccessfulImpl> get copyWith =>
      __$$SuccessfulImplCopyWithImpl<_$SuccessfulImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String success) success,
    required TResult Function(List<Products> productList) laodProductList,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return success(this.success);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String success)? success,
    TResult? Function(List<Products> productList)? laodProductList,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return success?.call(this.success);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String success)? success,
    TResult Function(List<Products> productList)? laodProductList,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this.success);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Successful value) success,
    required TResult Function(ProductList value) laodProductList,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(InsuffcientLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Successful value)? success,
    TResult? Function(ProductList value)? laodProductList,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(InsuffcientLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Successful value)? success,
    TResult Function(ProductList value)? laodProductList,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(InsuffcientLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Successful implements InsufficientStockState {
  const factory Successful(final String success) = _$SuccessfulImpl;

  String get success;
  @JsonKey(ignore: true)
  _$$SuccessfulImplCopyWith<_$SuccessfulImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductListImplCopyWith<$Res> {
  factory _$$ProductListImplCopyWith(
          _$ProductListImpl value, $Res Function(_$ProductListImpl) then) =
      __$$ProductListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Products> productList});
}

/// @nodoc
class __$$ProductListImplCopyWithImpl<$Res>
    extends _$InsufficientStockStateCopyWithImpl<$Res, _$ProductListImpl>
    implements _$$ProductListImplCopyWith<$Res> {
  __$$ProductListImplCopyWithImpl(
      _$ProductListImpl _value, $Res Function(_$ProductListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productList = null,
  }) {
    return _then(_$ProductListImpl(
      null == productList
          ? _value._productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<Products>,
    ));
  }
}

/// @nodoc

class _$ProductListImpl implements ProductList {
  const _$ProductListImpl(final List<Products> productList)
      : _productList = productList;

  final List<Products> _productList;
  @override
  List<Products> get productList {
    if (_productList is EqualUnmodifiableListView) return _productList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productList);
  }

  @override
  String toString() {
    return 'InsufficientStockState.laodProductList(productList: $productList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductListImpl &&
            const DeepCollectionEquality()
                .equals(other._productList, _productList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductListImplCopyWith<_$ProductListImpl> get copyWith =>
      __$$ProductListImplCopyWithImpl<_$ProductListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String success) success,
    required TResult Function(List<Products> productList) laodProductList,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return laodProductList(productList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String success)? success,
    TResult? Function(List<Products> productList)? laodProductList,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return laodProductList?.call(productList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String success)? success,
    TResult Function(List<Products> productList)? laodProductList,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (laodProductList != null) {
      return laodProductList(productList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Successful value) success,
    required TResult Function(ProductList value) laodProductList,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(InsuffcientLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return laodProductList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Successful value)? success,
    TResult? Function(ProductList value)? laodProductList,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(InsuffcientLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return laodProductList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Successful value)? success,
    TResult Function(ProductList value)? laodProductList,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(InsuffcientLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (laodProductList != null) {
      return laodProductList(this);
    }
    return orElse();
  }
}

abstract class ProductList implements InsufficientStockState {
  const factory ProductList(final List<Products> productList) =
      _$ProductListImpl;

  List<Products> get productList;
  @JsonKey(ignore: true)
  _$$ProductListImplCopyWith<_$ProductListImpl> get copyWith =>
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
    extends _$InsufficientStockStateCopyWithImpl<$Res, _$IsDataExitImpl>
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
    return 'InsufficientStockState.isDataExist(isExit: $isExit)';
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
    required TResult Function(String success) success,
    required TResult Function(List<Products> productList) laodProductList,
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
    TResult? Function(String success)? success,
    TResult? Function(List<Products> productList)? laodProductList,
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
    TResult Function(String success)? success,
    TResult Function(List<Products> productList)? laodProductList,
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
    required TResult Function(Successful value) success,
    required TResult Function(ProductList value) laodProductList,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(InsuffcientLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return isDataExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Successful value)? success,
    TResult? Function(ProductList value)? laodProductList,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(InsuffcientLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return isDataExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Successful value)? success,
    TResult Function(ProductList value)? laodProductList,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(InsuffcientLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (isDataExist != null) {
      return isDataExist(this);
    }
    return orElse();
  }
}

abstract class IsDataExit implements InsufficientStockState {
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
    extends _$InsufficientStockStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'InsufficientStockState.initial()';
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
    required TResult Function(String success) success,
    required TResult Function(List<Products> productList) laodProductList,
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
    TResult? Function(String success)? success,
    TResult? Function(List<Products> productList)? laodProductList,
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
    TResult Function(String success)? success,
    TResult Function(List<Products> productList)? laodProductList,
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
    required TResult Function(Successful value) success,
    required TResult Function(ProductList value) laodProductList,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(InsuffcientLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Successful value)? success,
    TResult? Function(ProductList value)? laodProductList,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(InsuffcientLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Successful value)? success,
    TResult Function(ProductList value)? laodProductList,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(InsuffcientLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements InsufficientStockState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$InsuffcientLoadingImplCopyWith<$Res> {
  factory _$$InsuffcientLoadingImplCopyWith(_$InsuffcientLoadingImpl value,
          $Res Function(_$InsuffcientLoadingImpl) then) =
      __$$InsuffcientLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InsuffcientLoadingImplCopyWithImpl<$Res>
    extends _$InsufficientStockStateCopyWithImpl<$Res, _$InsuffcientLoadingImpl>
    implements _$$InsuffcientLoadingImplCopyWith<$Res> {
  __$$InsuffcientLoadingImplCopyWithImpl(_$InsuffcientLoadingImpl _value,
      $Res Function(_$InsuffcientLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InsuffcientLoadingImpl implements InsuffcientLoading {
  const _$InsuffcientLoadingImpl();

  @override
  String toString() {
    return 'InsufficientStockState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InsuffcientLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String success) success,
    required TResult Function(List<Products> productList) laodProductList,
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
    TResult? Function(String success)? success,
    TResult? Function(List<Products> productList)? laodProductList,
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
    TResult Function(String success)? success,
    TResult Function(List<Products> productList)? laodProductList,
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
    required TResult Function(Successful value) success,
    required TResult Function(ProductList value) laodProductList,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(InsuffcientLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Successful value)? success,
    TResult? Function(ProductList value)? laodProductList,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(InsuffcientLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Successful value)? success,
    TResult Function(ProductList value)? laodProductList,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(InsuffcientLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class InsuffcientLoading implements InsufficientStockState {
  const factory InsuffcientLoading() = _$InsuffcientLoadingImpl;
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
    extends _$InsufficientStockStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'InsufficientStockState.error(error: $error)';
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
    required TResult Function(String success) success,
    required TResult Function(List<Products> productList) laodProductList,
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
    TResult? Function(String success)? success,
    TResult? Function(List<Products> productList)? laodProductList,
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
    TResult Function(String success)? success,
    TResult Function(List<Products> productList)? laodProductList,
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
    required TResult Function(Successful value) success,
    required TResult Function(ProductList value) laodProductList,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(InsuffcientLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Successful value)? success,
    TResult? Function(ProductList value)? laodProductList,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(InsuffcientLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Successful value)? success,
    TResult Function(ProductList value)? laodProductList,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(InsuffcientLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements InsufficientStockState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
