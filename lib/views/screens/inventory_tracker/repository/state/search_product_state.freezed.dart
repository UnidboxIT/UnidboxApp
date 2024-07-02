// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Products> searchProductList)
        loadSearchProduct,
    required TResult Function(bool isExit) isSearchDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Products> searchProductList)? loadSearchProduct,
    TResult? Function(bool isExit)? isSearchDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Products> searchProductList)? loadSearchProduct,
    TResult Function(bool isExit)? isSearchDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchProductList value) loadSearchProduct,
    required TResult Function(IsSearchDataExit value) isSearchDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(SearchProductLoading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchProductList value)? loadSearchProduct,
    TResult? Function(IsSearchDataExit value)? isSearchDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(SearchProductLoading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchProductList value)? loadSearchProduct,
    TResult Function(IsSearchDataExit value)? isSearchDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(SearchProductLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchProductStateCopyWith<$Res> {
  factory $SearchProductStateCopyWith(
          SearchProductState value, $Res Function(SearchProductState) then) =
      _$SearchProductStateCopyWithImpl<$Res, SearchProductState>;
}

/// @nodoc
class _$SearchProductStateCopyWithImpl<$Res, $Val extends SearchProductState>
    implements $SearchProductStateCopyWith<$Res> {
  _$SearchProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchProductListImplCopyWith<$Res> {
  factory _$$SearchProductListImplCopyWith(_$SearchProductListImpl value,
          $Res Function(_$SearchProductListImpl) then) =
      __$$SearchProductListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Products> searchProductList});
}

/// @nodoc
class __$$SearchProductListImplCopyWithImpl<$Res>
    extends _$SearchProductStateCopyWithImpl<$Res, _$SearchProductListImpl>
    implements _$$SearchProductListImplCopyWith<$Res> {
  __$$SearchProductListImplCopyWithImpl(_$SearchProductListImpl _value,
      $Res Function(_$SearchProductListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchProductList = null,
  }) {
    return _then(_$SearchProductListImpl(
      null == searchProductList
          ? _value._searchProductList
          : searchProductList // ignore: cast_nullable_to_non_nullable
              as List<Products>,
    ));
  }
}

/// @nodoc

class _$SearchProductListImpl implements SearchProductList {
  const _$SearchProductListImpl(final List<Products> searchProductList)
      : _searchProductList = searchProductList;

  final List<Products> _searchProductList;
  @override
  List<Products> get searchProductList {
    if (_searchProductList is EqualUnmodifiableListView)
      return _searchProductList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchProductList);
  }

  @override
  String toString() {
    return 'SearchProductState.loadSearchProduct(searchProductList: $searchProductList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchProductListImpl &&
            const DeepCollectionEquality()
                .equals(other._searchProductList, _searchProductList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchProductList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchProductListImplCopyWith<_$SearchProductListImpl> get copyWith =>
      __$$SearchProductListImplCopyWithImpl<_$SearchProductListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Products> searchProductList)
        loadSearchProduct,
    required TResult Function(bool isExit) isSearchDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadSearchProduct(searchProductList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Products> searchProductList)? loadSearchProduct,
    TResult? Function(bool isExit)? isSearchDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadSearchProduct?.call(searchProductList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Products> searchProductList)? loadSearchProduct,
    TResult Function(bool isExit)? isSearchDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadSearchProduct != null) {
      return loadSearchProduct(searchProductList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchProductList value) loadSearchProduct,
    required TResult Function(IsSearchDataExit value) isSearchDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(SearchProductLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadSearchProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchProductList value)? loadSearchProduct,
    TResult? Function(IsSearchDataExit value)? isSearchDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(SearchProductLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadSearchProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchProductList value)? loadSearchProduct,
    TResult Function(IsSearchDataExit value)? isSearchDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(SearchProductLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadSearchProduct != null) {
      return loadSearchProduct(this);
    }
    return orElse();
  }
}

abstract class SearchProductList implements SearchProductState {
  const factory SearchProductList(final List<Products> searchProductList) =
      _$SearchProductListImpl;

  List<Products> get searchProductList;
  @JsonKey(ignore: true)
  _$$SearchProductListImplCopyWith<_$SearchProductListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsSearchDataExitImplCopyWith<$Res> {
  factory _$$IsSearchDataExitImplCopyWith(_$IsSearchDataExitImpl value,
          $Res Function(_$IsSearchDataExitImpl) then) =
      __$$IsSearchDataExitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isExit});
}

/// @nodoc
class __$$IsSearchDataExitImplCopyWithImpl<$Res>
    extends _$SearchProductStateCopyWithImpl<$Res, _$IsSearchDataExitImpl>
    implements _$$IsSearchDataExitImplCopyWith<$Res> {
  __$$IsSearchDataExitImplCopyWithImpl(_$IsSearchDataExitImpl _value,
      $Res Function(_$IsSearchDataExitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExit = null,
  }) {
    return _then(_$IsSearchDataExitImpl(
      null == isExit
          ? _value.isExit
          : isExit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IsSearchDataExitImpl implements IsSearchDataExit {
  const _$IsSearchDataExitImpl(this.isExit);

  @override
  final bool isExit;

  @override
  String toString() {
    return 'SearchProductState.isSearchDataExist(isExit: $isExit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsSearchDataExitImpl &&
            (identical(other.isExit, isExit) || other.isExit == isExit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isExit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsSearchDataExitImplCopyWith<_$IsSearchDataExitImpl> get copyWith =>
      __$$IsSearchDataExitImplCopyWithImpl<_$IsSearchDataExitImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Products> searchProductList)
        loadSearchProduct,
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
    TResult? Function(List<Products> searchProductList)? loadSearchProduct,
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
    TResult Function(List<Products> searchProductList)? loadSearchProduct,
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
    required TResult Function(SearchProductList value) loadSearchProduct,
    required TResult Function(IsSearchDataExit value) isSearchDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(SearchProductLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return isSearchDataExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchProductList value)? loadSearchProduct,
    TResult? Function(IsSearchDataExit value)? isSearchDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(SearchProductLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return isSearchDataExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchProductList value)? loadSearchProduct,
    TResult Function(IsSearchDataExit value)? isSearchDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(SearchProductLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (isSearchDataExist != null) {
      return isSearchDataExist(this);
    }
    return orElse();
  }
}

abstract class IsSearchDataExit implements SearchProductState {
  const factory IsSearchDataExit(final bool isExit) = _$IsSearchDataExitImpl;

  bool get isExit;
  @JsonKey(ignore: true)
  _$$IsSearchDataExitImplCopyWith<_$IsSearchDataExitImpl> get copyWith =>
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
    extends _$SearchProductStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'SearchProductState.initial()';
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
    required TResult Function(List<Products> searchProductList)
        loadSearchProduct,
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
    TResult? Function(List<Products> searchProductList)? loadSearchProduct,
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
    TResult Function(List<Products> searchProductList)? loadSearchProduct,
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
    required TResult Function(SearchProductList value) loadSearchProduct,
    required TResult Function(IsSearchDataExit value) isSearchDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(SearchProductLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchProductList value)? loadSearchProduct,
    TResult? Function(IsSearchDataExit value)? isSearchDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(SearchProductLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchProductList value)? loadSearchProduct,
    TResult Function(IsSearchDataExit value)? isSearchDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(SearchProductLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements SearchProductState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SearchProductLoadingImplCopyWith<$Res> {
  factory _$$SearchProductLoadingImplCopyWith(_$SearchProductLoadingImpl value,
          $Res Function(_$SearchProductLoadingImpl) then) =
      __$$SearchProductLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchProductLoadingImplCopyWithImpl<$Res>
    extends _$SearchProductStateCopyWithImpl<$Res, _$SearchProductLoadingImpl>
    implements _$$SearchProductLoadingImplCopyWith<$Res> {
  __$$SearchProductLoadingImplCopyWithImpl(_$SearchProductLoadingImpl _value,
      $Res Function(_$SearchProductLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchProductLoadingImpl implements SearchProductLoading {
  const _$SearchProductLoadingImpl();

  @override
  String toString() {
    return 'SearchProductState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchProductLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Products> searchProductList)
        loadSearchProduct,
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
    TResult? Function(List<Products> searchProductList)? loadSearchProduct,
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
    TResult Function(List<Products> searchProductList)? loadSearchProduct,
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
    required TResult Function(SearchProductList value) loadSearchProduct,
    required TResult Function(IsSearchDataExit value) isSearchDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(SearchProductLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchProductList value)? loadSearchProduct,
    TResult? Function(IsSearchDataExit value)? isSearchDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(SearchProductLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchProductList value)? loadSearchProduct,
    TResult Function(IsSearchDataExit value)? isSearchDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(SearchProductLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SearchProductLoading implements SearchProductState {
  const factory SearchProductLoading() = _$SearchProductLoadingImpl;
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
    extends _$SearchProductStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'SearchProductState.error(error: $error)';
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
    required TResult Function(List<Products> searchProductList)
        loadSearchProduct,
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
    TResult? Function(List<Products> searchProductList)? loadSearchProduct,
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
    TResult Function(List<Products> searchProductList)? loadSearchProduct,
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
    required TResult Function(SearchProductList value) loadSearchProduct,
    required TResult Function(IsSearchDataExit value) isSearchDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(SearchProductLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchProductList value)? loadSearchProduct,
    TResult? Function(IsSearchDataExit value)? isSearchDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(SearchProductLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchProductList value)? loadSearchProduct,
    TResult Function(IsSearchDataExit value)? isSearchDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(SearchProductLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements SearchProductState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
