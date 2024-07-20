// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_return_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyReturnState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myReturnDataList)
        loadMyReturnData,
    required TResult Function(List<Products> scanProductList) loadScanProduct,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() successUpdateSuccess,
    required TResult Function(String? error) myReturnError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult? Function(List<Products> scanProductList)? loadScanProduct,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? successUpdateSuccess,
    TResult? Function(String? error)? myReturnError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult Function(List<Products> scanProductList)? loadScanProduct,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
    TResult Function()? successUpdateSuccess,
    TResult Function(String? error)? myReturnError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyReturnDataList value) loadMyReturnData,
    required TResult Function(MyReturnScanProductList value) loadScanProduct,
    required TResult Function(Initial value) initial,
    required TResult Function(MyReturnLoading value) loading,
    required TResult Function(MyReturnUpdateLoading value) updateLoading,
    required TResult Function(MyReturnUpdateSuccess value) successUpdateSuccess,
    required TResult Function(MyReturnError value) myReturnError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyReturnDataList value)? loadMyReturnData,
    TResult? Function(MyReturnScanProductList value)? loadScanProduct,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyReturnLoading value)? loading,
    TResult? Function(MyReturnUpdateLoading value)? updateLoading,
    TResult? Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult? Function(MyReturnError value)? myReturnError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyReturnDataList value)? loadMyReturnData,
    TResult Function(MyReturnScanProductList value)? loadScanProduct,
    TResult Function(Initial value)? initial,
    TResult Function(MyReturnLoading value)? loading,
    TResult Function(MyReturnUpdateLoading value)? updateLoading,
    TResult Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult Function(MyReturnError value)? myReturnError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyReturnStateCopyWith<$Res> {
  factory $MyReturnStateCopyWith(
          MyReturnState value, $Res Function(MyReturnState) then) =
      _$MyReturnStateCopyWithImpl<$Res, MyReturnState>;
}

/// @nodoc
class _$MyReturnStateCopyWithImpl<$Res, $Val extends MyReturnState>
    implements $MyReturnStateCopyWith<$Res> {
  _$MyReturnStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MyReturnDataListImplCopyWith<$Res> {
  factory _$$MyReturnDataListImplCopyWith(_$MyReturnDataListImpl value,
          $Res Function(_$MyReturnDataListImpl) then) =
      __$$MyReturnDataListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MyRequest> myReturnDataList});
}

/// @nodoc
class __$$MyReturnDataListImplCopyWithImpl<$Res>
    extends _$MyReturnStateCopyWithImpl<$Res, _$MyReturnDataListImpl>
    implements _$$MyReturnDataListImplCopyWith<$Res> {
  __$$MyReturnDataListImplCopyWithImpl(_$MyReturnDataListImpl _value,
      $Res Function(_$MyReturnDataListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myReturnDataList = null,
  }) {
    return _then(_$MyReturnDataListImpl(
      null == myReturnDataList
          ? _value._myReturnDataList
          : myReturnDataList // ignore: cast_nullable_to_non_nullable
              as List<MyRequest>,
    ));
  }
}

/// @nodoc

class _$MyReturnDataListImpl implements MyReturnDataList {
  const _$MyReturnDataListImpl(final List<MyRequest> myReturnDataList)
      : _myReturnDataList = myReturnDataList;

  final List<MyRequest> _myReturnDataList;
  @override
  List<MyRequest> get myReturnDataList {
    if (_myReturnDataList is EqualUnmodifiableListView)
      return _myReturnDataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myReturnDataList);
  }

  @override
  String toString() {
    return 'MyReturnState.loadMyReturnData(myReturnDataList: $myReturnDataList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyReturnDataListImpl &&
            const DeepCollectionEquality()
                .equals(other._myReturnDataList, _myReturnDataList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_myReturnDataList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyReturnDataListImplCopyWith<_$MyReturnDataListImpl> get copyWith =>
      __$$MyReturnDataListImplCopyWithImpl<_$MyReturnDataListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myReturnDataList)
        loadMyReturnData,
    required TResult Function(List<Products> scanProductList) loadScanProduct,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() successUpdateSuccess,
    required TResult Function(String? error) myReturnError,
  }) {
    return loadMyReturnData(myReturnDataList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult? Function(List<Products> scanProductList)? loadScanProduct,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? successUpdateSuccess,
    TResult? Function(String? error)? myReturnError,
  }) {
    return loadMyReturnData?.call(myReturnDataList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult Function(List<Products> scanProductList)? loadScanProduct,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
    TResult Function()? successUpdateSuccess,
    TResult Function(String? error)? myReturnError,
    required TResult orElse(),
  }) {
    if (loadMyReturnData != null) {
      return loadMyReturnData(myReturnDataList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyReturnDataList value) loadMyReturnData,
    required TResult Function(MyReturnScanProductList value) loadScanProduct,
    required TResult Function(Initial value) initial,
    required TResult Function(MyReturnLoading value) loading,
    required TResult Function(MyReturnUpdateLoading value) updateLoading,
    required TResult Function(MyReturnUpdateSuccess value) successUpdateSuccess,
    required TResult Function(MyReturnError value) myReturnError,
  }) {
    return loadMyReturnData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyReturnDataList value)? loadMyReturnData,
    TResult? Function(MyReturnScanProductList value)? loadScanProduct,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyReturnLoading value)? loading,
    TResult? Function(MyReturnUpdateLoading value)? updateLoading,
    TResult? Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult? Function(MyReturnError value)? myReturnError,
  }) {
    return loadMyReturnData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyReturnDataList value)? loadMyReturnData,
    TResult Function(MyReturnScanProductList value)? loadScanProduct,
    TResult Function(Initial value)? initial,
    TResult Function(MyReturnLoading value)? loading,
    TResult Function(MyReturnUpdateLoading value)? updateLoading,
    TResult Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult Function(MyReturnError value)? myReturnError,
    required TResult orElse(),
  }) {
    if (loadMyReturnData != null) {
      return loadMyReturnData(this);
    }
    return orElse();
  }
}

abstract class MyReturnDataList implements MyReturnState {
  const factory MyReturnDataList(final List<MyRequest> myReturnDataList) =
      _$MyReturnDataListImpl;

  List<MyRequest> get myReturnDataList;
  @JsonKey(ignore: true)
  _$$MyReturnDataListImplCopyWith<_$MyReturnDataListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MyReturnScanProductListImplCopyWith<$Res> {
  factory _$$MyReturnScanProductListImplCopyWith(
          _$MyReturnScanProductListImpl value,
          $Res Function(_$MyReturnScanProductListImpl) then) =
      __$$MyReturnScanProductListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Products> scanProductList});
}

/// @nodoc
class __$$MyReturnScanProductListImplCopyWithImpl<$Res>
    extends _$MyReturnStateCopyWithImpl<$Res, _$MyReturnScanProductListImpl>
    implements _$$MyReturnScanProductListImplCopyWith<$Res> {
  __$$MyReturnScanProductListImplCopyWithImpl(
      _$MyReturnScanProductListImpl _value,
      $Res Function(_$MyReturnScanProductListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanProductList = null,
  }) {
    return _then(_$MyReturnScanProductListImpl(
      null == scanProductList
          ? _value._scanProductList
          : scanProductList // ignore: cast_nullable_to_non_nullable
              as List<Products>,
    ));
  }
}

/// @nodoc

class _$MyReturnScanProductListImpl implements MyReturnScanProductList {
  const _$MyReturnScanProductListImpl(final List<Products> scanProductList)
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
    return 'MyReturnState.loadScanProduct(scanProductList: $scanProductList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyReturnScanProductListImpl &&
            const DeepCollectionEquality()
                .equals(other._scanProductList, _scanProductList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_scanProductList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyReturnScanProductListImplCopyWith<_$MyReturnScanProductListImpl>
      get copyWith => __$$MyReturnScanProductListImplCopyWithImpl<
          _$MyReturnScanProductListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myReturnDataList)
        loadMyReturnData,
    required TResult Function(List<Products> scanProductList) loadScanProduct,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() successUpdateSuccess,
    required TResult Function(String? error) myReturnError,
  }) {
    return loadScanProduct(scanProductList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult? Function(List<Products> scanProductList)? loadScanProduct,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? successUpdateSuccess,
    TResult? Function(String? error)? myReturnError,
  }) {
    return loadScanProduct?.call(scanProductList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult Function(List<Products> scanProductList)? loadScanProduct,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
    TResult Function()? successUpdateSuccess,
    TResult Function(String? error)? myReturnError,
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
    required TResult Function(MyReturnDataList value) loadMyReturnData,
    required TResult Function(MyReturnScanProductList value) loadScanProduct,
    required TResult Function(Initial value) initial,
    required TResult Function(MyReturnLoading value) loading,
    required TResult Function(MyReturnUpdateLoading value) updateLoading,
    required TResult Function(MyReturnUpdateSuccess value) successUpdateSuccess,
    required TResult Function(MyReturnError value) myReturnError,
  }) {
    return loadScanProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyReturnDataList value)? loadMyReturnData,
    TResult? Function(MyReturnScanProductList value)? loadScanProduct,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyReturnLoading value)? loading,
    TResult? Function(MyReturnUpdateLoading value)? updateLoading,
    TResult? Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult? Function(MyReturnError value)? myReturnError,
  }) {
    return loadScanProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyReturnDataList value)? loadMyReturnData,
    TResult Function(MyReturnScanProductList value)? loadScanProduct,
    TResult Function(Initial value)? initial,
    TResult Function(MyReturnLoading value)? loading,
    TResult Function(MyReturnUpdateLoading value)? updateLoading,
    TResult Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult Function(MyReturnError value)? myReturnError,
    required TResult orElse(),
  }) {
    if (loadScanProduct != null) {
      return loadScanProduct(this);
    }
    return orElse();
  }
}

abstract class MyReturnScanProductList implements MyReturnState {
  const factory MyReturnScanProductList(final List<Products> scanProductList) =
      _$MyReturnScanProductListImpl;

  List<Products> get scanProductList;
  @JsonKey(ignore: true)
  _$$MyReturnScanProductListImplCopyWith<_$MyReturnScanProductListImpl>
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
    extends _$MyReturnStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'MyReturnState.initial()';
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
    required TResult Function(List<MyRequest> myReturnDataList)
        loadMyReturnData,
    required TResult Function(List<Products> scanProductList) loadScanProduct,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() successUpdateSuccess,
    required TResult Function(String? error) myReturnError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult? Function(List<Products> scanProductList)? loadScanProduct,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? successUpdateSuccess,
    TResult? Function(String? error)? myReturnError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult Function(List<Products> scanProductList)? loadScanProduct,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
    TResult Function()? successUpdateSuccess,
    TResult Function(String? error)? myReturnError,
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
    required TResult Function(MyReturnDataList value) loadMyReturnData,
    required TResult Function(MyReturnScanProductList value) loadScanProduct,
    required TResult Function(Initial value) initial,
    required TResult Function(MyReturnLoading value) loading,
    required TResult Function(MyReturnUpdateLoading value) updateLoading,
    required TResult Function(MyReturnUpdateSuccess value) successUpdateSuccess,
    required TResult Function(MyReturnError value) myReturnError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyReturnDataList value)? loadMyReturnData,
    TResult? Function(MyReturnScanProductList value)? loadScanProduct,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyReturnLoading value)? loading,
    TResult? Function(MyReturnUpdateLoading value)? updateLoading,
    TResult? Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult? Function(MyReturnError value)? myReturnError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyReturnDataList value)? loadMyReturnData,
    TResult Function(MyReturnScanProductList value)? loadScanProduct,
    TResult Function(Initial value)? initial,
    TResult Function(MyReturnLoading value)? loading,
    TResult Function(MyReturnUpdateLoading value)? updateLoading,
    TResult Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult Function(MyReturnError value)? myReturnError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements MyReturnState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$MyReturnLoadingImplCopyWith<$Res> {
  factory _$$MyReturnLoadingImplCopyWith(_$MyReturnLoadingImpl value,
          $Res Function(_$MyReturnLoadingImpl) then) =
      __$$MyReturnLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyReturnLoadingImplCopyWithImpl<$Res>
    extends _$MyReturnStateCopyWithImpl<$Res, _$MyReturnLoadingImpl>
    implements _$$MyReturnLoadingImplCopyWith<$Res> {
  __$$MyReturnLoadingImplCopyWithImpl(
      _$MyReturnLoadingImpl _value, $Res Function(_$MyReturnLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyReturnLoadingImpl implements MyReturnLoading {
  const _$MyReturnLoadingImpl();

  @override
  String toString() {
    return 'MyReturnState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MyReturnLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myReturnDataList)
        loadMyReturnData,
    required TResult Function(List<Products> scanProductList) loadScanProduct,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() successUpdateSuccess,
    required TResult Function(String? error) myReturnError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult? Function(List<Products> scanProductList)? loadScanProduct,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? successUpdateSuccess,
    TResult? Function(String? error)? myReturnError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult Function(List<Products> scanProductList)? loadScanProduct,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
    TResult Function()? successUpdateSuccess,
    TResult Function(String? error)? myReturnError,
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
    required TResult Function(MyReturnDataList value) loadMyReturnData,
    required TResult Function(MyReturnScanProductList value) loadScanProduct,
    required TResult Function(Initial value) initial,
    required TResult Function(MyReturnLoading value) loading,
    required TResult Function(MyReturnUpdateLoading value) updateLoading,
    required TResult Function(MyReturnUpdateSuccess value) successUpdateSuccess,
    required TResult Function(MyReturnError value) myReturnError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyReturnDataList value)? loadMyReturnData,
    TResult? Function(MyReturnScanProductList value)? loadScanProduct,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyReturnLoading value)? loading,
    TResult? Function(MyReturnUpdateLoading value)? updateLoading,
    TResult? Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult? Function(MyReturnError value)? myReturnError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyReturnDataList value)? loadMyReturnData,
    TResult Function(MyReturnScanProductList value)? loadScanProduct,
    TResult Function(Initial value)? initial,
    TResult Function(MyReturnLoading value)? loading,
    TResult Function(MyReturnUpdateLoading value)? updateLoading,
    TResult Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult Function(MyReturnError value)? myReturnError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MyReturnLoading implements MyReturnState {
  const factory MyReturnLoading() = _$MyReturnLoadingImpl;
}

/// @nodoc
abstract class _$$MyReturnUpdateLoadingImplCopyWith<$Res> {
  factory _$$MyReturnUpdateLoadingImplCopyWith(
          _$MyReturnUpdateLoadingImpl value,
          $Res Function(_$MyReturnUpdateLoadingImpl) then) =
      __$$MyReturnUpdateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyReturnUpdateLoadingImplCopyWithImpl<$Res>
    extends _$MyReturnStateCopyWithImpl<$Res, _$MyReturnUpdateLoadingImpl>
    implements _$$MyReturnUpdateLoadingImplCopyWith<$Res> {
  __$$MyReturnUpdateLoadingImplCopyWithImpl(_$MyReturnUpdateLoadingImpl _value,
      $Res Function(_$MyReturnUpdateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyReturnUpdateLoadingImpl implements MyReturnUpdateLoading {
  const _$MyReturnUpdateLoadingImpl();

  @override
  String toString() {
    return 'MyReturnState.updateLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyReturnUpdateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myReturnDataList)
        loadMyReturnData,
    required TResult Function(List<Products> scanProductList) loadScanProduct,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() successUpdateSuccess,
    required TResult Function(String? error) myReturnError,
  }) {
    return updateLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult? Function(List<Products> scanProductList)? loadScanProduct,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? successUpdateSuccess,
    TResult? Function(String? error)? myReturnError,
  }) {
    return updateLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult Function(List<Products> scanProductList)? loadScanProduct,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
    TResult Function()? successUpdateSuccess,
    TResult Function(String? error)? myReturnError,
    required TResult orElse(),
  }) {
    if (updateLoading != null) {
      return updateLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyReturnDataList value) loadMyReturnData,
    required TResult Function(MyReturnScanProductList value) loadScanProduct,
    required TResult Function(Initial value) initial,
    required TResult Function(MyReturnLoading value) loading,
    required TResult Function(MyReturnUpdateLoading value) updateLoading,
    required TResult Function(MyReturnUpdateSuccess value) successUpdateSuccess,
    required TResult Function(MyReturnError value) myReturnError,
  }) {
    return updateLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyReturnDataList value)? loadMyReturnData,
    TResult? Function(MyReturnScanProductList value)? loadScanProduct,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyReturnLoading value)? loading,
    TResult? Function(MyReturnUpdateLoading value)? updateLoading,
    TResult? Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult? Function(MyReturnError value)? myReturnError,
  }) {
    return updateLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyReturnDataList value)? loadMyReturnData,
    TResult Function(MyReturnScanProductList value)? loadScanProduct,
    TResult Function(Initial value)? initial,
    TResult Function(MyReturnLoading value)? loading,
    TResult Function(MyReturnUpdateLoading value)? updateLoading,
    TResult Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult Function(MyReturnError value)? myReturnError,
    required TResult orElse(),
  }) {
    if (updateLoading != null) {
      return updateLoading(this);
    }
    return orElse();
  }
}

abstract class MyReturnUpdateLoading implements MyReturnState {
  const factory MyReturnUpdateLoading() = _$MyReturnUpdateLoadingImpl;
}

/// @nodoc
abstract class _$$MyReturnUpdateSuccessImplCopyWith<$Res> {
  factory _$$MyReturnUpdateSuccessImplCopyWith(
          _$MyReturnUpdateSuccessImpl value,
          $Res Function(_$MyReturnUpdateSuccessImpl) then) =
      __$$MyReturnUpdateSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyReturnUpdateSuccessImplCopyWithImpl<$Res>
    extends _$MyReturnStateCopyWithImpl<$Res, _$MyReturnUpdateSuccessImpl>
    implements _$$MyReturnUpdateSuccessImplCopyWith<$Res> {
  __$$MyReturnUpdateSuccessImplCopyWithImpl(_$MyReturnUpdateSuccessImpl _value,
      $Res Function(_$MyReturnUpdateSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyReturnUpdateSuccessImpl implements MyReturnUpdateSuccess {
  const _$MyReturnUpdateSuccessImpl();

  @override
  String toString() {
    return 'MyReturnState.successUpdateSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyReturnUpdateSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myReturnDataList)
        loadMyReturnData,
    required TResult Function(List<Products> scanProductList) loadScanProduct,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() successUpdateSuccess,
    required TResult Function(String? error) myReturnError,
  }) {
    return successUpdateSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult? Function(List<Products> scanProductList)? loadScanProduct,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? successUpdateSuccess,
    TResult? Function(String? error)? myReturnError,
  }) {
    return successUpdateSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult Function(List<Products> scanProductList)? loadScanProduct,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
    TResult Function()? successUpdateSuccess,
    TResult Function(String? error)? myReturnError,
    required TResult orElse(),
  }) {
    if (successUpdateSuccess != null) {
      return successUpdateSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyReturnDataList value) loadMyReturnData,
    required TResult Function(MyReturnScanProductList value) loadScanProduct,
    required TResult Function(Initial value) initial,
    required TResult Function(MyReturnLoading value) loading,
    required TResult Function(MyReturnUpdateLoading value) updateLoading,
    required TResult Function(MyReturnUpdateSuccess value) successUpdateSuccess,
    required TResult Function(MyReturnError value) myReturnError,
  }) {
    return successUpdateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyReturnDataList value)? loadMyReturnData,
    TResult? Function(MyReturnScanProductList value)? loadScanProduct,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyReturnLoading value)? loading,
    TResult? Function(MyReturnUpdateLoading value)? updateLoading,
    TResult? Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult? Function(MyReturnError value)? myReturnError,
  }) {
    return successUpdateSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyReturnDataList value)? loadMyReturnData,
    TResult Function(MyReturnScanProductList value)? loadScanProduct,
    TResult Function(Initial value)? initial,
    TResult Function(MyReturnLoading value)? loading,
    TResult Function(MyReturnUpdateLoading value)? updateLoading,
    TResult Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult Function(MyReturnError value)? myReturnError,
    required TResult orElse(),
  }) {
    if (successUpdateSuccess != null) {
      return successUpdateSuccess(this);
    }
    return orElse();
  }
}

abstract class MyReturnUpdateSuccess implements MyReturnState {
  const factory MyReturnUpdateSuccess() = _$MyReturnUpdateSuccessImpl;
}

/// @nodoc
abstract class _$$MyReturnErrorImplCopyWith<$Res> {
  factory _$$MyReturnErrorImplCopyWith(
          _$MyReturnErrorImpl value, $Res Function(_$MyReturnErrorImpl) then) =
      __$$MyReturnErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$MyReturnErrorImplCopyWithImpl<$Res>
    extends _$MyReturnStateCopyWithImpl<$Res, _$MyReturnErrorImpl>
    implements _$$MyReturnErrorImplCopyWith<$Res> {
  __$$MyReturnErrorImplCopyWithImpl(
      _$MyReturnErrorImpl _value, $Res Function(_$MyReturnErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$MyReturnErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MyReturnErrorImpl implements MyReturnError {
  const _$MyReturnErrorImpl({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'MyReturnState.myReturnError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyReturnErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyReturnErrorImplCopyWith<_$MyReturnErrorImpl> get copyWith =>
      __$$MyReturnErrorImplCopyWithImpl<_$MyReturnErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myReturnDataList)
        loadMyReturnData,
    required TResult Function(List<Products> scanProductList) loadScanProduct,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() successUpdateSuccess,
    required TResult Function(String? error) myReturnError,
  }) {
    return myReturnError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult? Function(List<Products> scanProductList)? loadScanProduct,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? successUpdateSuccess,
    TResult? Function(String? error)? myReturnError,
  }) {
    return myReturnError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myReturnDataList)? loadMyReturnData,
    TResult Function(List<Products> scanProductList)? loadScanProduct,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
    TResult Function()? successUpdateSuccess,
    TResult Function(String? error)? myReturnError,
    required TResult orElse(),
  }) {
    if (myReturnError != null) {
      return myReturnError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyReturnDataList value) loadMyReturnData,
    required TResult Function(MyReturnScanProductList value) loadScanProduct,
    required TResult Function(Initial value) initial,
    required TResult Function(MyReturnLoading value) loading,
    required TResult Function(MyReturnUpdateLoading value) updateLoading,
    required TResult Function(MyReturnUpdateSuccess value) successUpdateSuccess,
    required TResult Function(MyReturnError value) myReturnError,
  }) {
    return myReturnError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyReturnDataList value)? loadMyReturnData,
    TResult? Function(MyReturnScanProductList value)? loadScanProduct,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyReturnLoading value)? loading,
    TResult? Function(MyReturnUpdateLoading value)? updateLoading,
    TResult? Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult? Function(MyReturnError value)? myReturnError,
  }) {
    return myReturnError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyReturnDataList value)? loadMyReturnData,
    TResult Function(MyReturnScanProductList value)? loadScanProduct,
    TResult Function(Initial value)? initial,
    TResult Function(MyReturnLoading value)? loading,
    TResult Function(MyReturnUpdateLoading value)? updateLoading,
    TResult Function(MyReturnUpdateSuccess value)? successUpdateSuccess,
    TResult Function(MyReturnError value)? myReturnError,
    required TResult orElse(),
  }) {
    if (myReturnError != null) {
      return myReturnError(this);
    }
    return orElse();
  }
}

abstract class MyReturnError implements MyReturnState {
  const factory MyReturnError({final String? error}) = _$MyReturnErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$MyReturnErrorImplCopyWith<_$MyReturnErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
