// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inhouse_stock_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InhouseStockState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InhouseStock> inhouseStock) loadInHouseStock,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InhouseStockList value) loadInHouseStock,
    required TResult Function(Initial value) initial,
    required TResult Function(InHouseLoading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InhouseStockList value)? loadInHouseStock,
    TResult? Function(Initial value)? initial,
    TResult? Function(InHouseLoading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InhouseStockList value)? loadInHouseStock,
    TResult Function(Initial value)? initial,
    TResult Function(InHouseLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InhouseStockStateCopyWith<$Res> {
  factory $InhouseStockStateCopyWith(
          InhouseStockState value, $Res Function(InhouseStockState) then) =
      _$InhouseStockStateCopyWithImpl<$Res, InhouseStockState>;
}

/// @nodoc
class _$InhouseStockStateCopyWithImpl<$Res, $Val extends InhouseStockState>
    implements $InhouseStockStateCopyWith<$Res> {
  _$InhouseStockStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InhouseStockListImplCopyWith<$Res> {
  factory _$$InhouseStockListImplCopyWith(_$InhouseStockListImpl value,
          $Res Function(_$InhouseStockListImpl) then) =
      __$$InhouseStockListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<InhouseStock> inhouseStock});
}

/// @nodoc
class __$$InhouseStockListImplCopyWithImpl<$Res>
    extends _$InhouseStockStateCopyWithImpl<$Res, _$InhouseStockListImpl>
    implements _$$InhouseStockListImplCopyWith<$Res> {
  __$$InhouseStockListImplCopyWithImpl(_$InhouseStockListImpl _value,
      $Res Function(_$InhouseStockListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inhouseStock = null,
  }) {
    return _then(_$InhouseStockListImpl(
      null == inhouseStock
          ? _value._inhouseStock
          : inhouseStock // ignore: cast_nullable_to_non_nullable
              as List<InhouseStock>,
    ));
  }
}

/// @nodoc

class _$InhouseStockListImpl implements InhouseStockList {
  const _$InhouseStockListImpl(final List<InhouseStock> inhouseStock)
      : _inhouseStock = inhouseStock;

  final List<InhouseStock> _inhouseStock;
  @override
  List<InhouseStock> get inhouseStock {
    if (_inhouseStock is EqualUnmodifiableListView) return _inhouseStock;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inhouseStock);
  }

  @override
  String toString() {
    return 'InhouseStockState.loadInHouseStock(inhouseStock: $inhouseStock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InhouseStockListImpl &&
            const DeepCollectionEquality()
                .equals(other._inhouseStock, _inhouseStock));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_inhouseStock));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InhouseStockListImplCopyWith<_$InhouseStockListImpl> get copyWith =>
      __$$InhouseStockListImplCopyWithImpl<_$InhouseStockListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InhouseStock> inhouseStock) loadInHouseStock,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadInHouseStock(inhouseStock);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadInHouseStock?.call(inhouseStock);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadInHouseStock != null) {
      return loadInHouseStock(inhouseStock);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InhouseStockList value) loadInHouseStock,
    required TResult Function(Initial value) initial,
    required TResult Function(InHouseLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadInHouseStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InhouseStockList value)? loadInHouseStock,
    TResult? Function(Initial value)? initial,
    TResult? Function(InHouseLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadInHouseStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InhouseStockList value)? loadInHouseStock,
    TResult Function(Initial value)? initial,
    TResult Function(InHouseLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadInHouseStock != null) {
      return loadInHouseStock(this);
    }
    return orElse();
  }
}

abstract class InhouseStockList implements InhouseStockState {
  const factory InhouseStockList(final List<InhouseStock> inhouseStock) =
      _$InhouseStockListImpl;

  List<InhouseStock> get inhouseStock;
  @JsonKey(ignore: true)
  _$$InhouseStockListImplCopyWith<_$InhouseStockListImpl> get copyWith =>
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
    extends _$InhouseStockStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'InhouseStockState.initial()';
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
    required TResult Function(List<InhouseStock> inhouseStock) loadInHouseStock,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
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
    required TResult Function(InhouseStockList value) loadInHouseStock,
    required TResult Function(Initial value) initial,
    required TResult Function(InHouseLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InhouseStockList value)? loadInHouseStock,
    TResult? Function(Initial value)? initial,
    TResult? Function(InHouseLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InhouseStockList value)? loadInHouseStock,
    TResult Function(Initial value)? initial,
    TResult Function(InHouseLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements InhouseStockState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$InHouseLoadingImplCopyWith<$Res> {
  factory _$$InHouseLoadingImplCopyWith(_$InHouseLoadingImpl value,
          $Res Function(_$InHouseLoadingImpl) then) =
      __$$InHouseLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InHouseLoadingImplCopyWithImpl<$Res>
    extends _$InhouseStockStateCopyWithImpl<$Res, _$InHouseLoadingImpl>
    implements _$$InHouseLoadingImplCopyWith<$Res> {
  __$$InHouseLoadingImplCopyWithImpl(
      _$InHouseLoadingImpl _value, $Res Function(_$InHouseLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InHouseLoadingImpl implements InHouseLoading {
  const _$InHouseLoadingImpl();

  @override
  String toString() {
    return 'InhouseStockState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InHouseLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InhouseStock> inhouseStock) loadInHouseStock,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
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
    required TResult Function(InhouseStockList value) loadInHouseStock,
    required TResult Function(Initial value) initial,
    required TResult Function(InHouseLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InhouseStockList value)? loadInHouseStock,
    TResult? Function(Initial value)? initial,
    TResult? Function(InHouseLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InhouseStockList value)? loadInHouseStock,
    TResult Function(Initial value)? initial,
    TResult Function(InHouseLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class InHouseLoading implements InhouseStockState {
  const factory InHouseLoading() = _$InHouseLoadingImpl;
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
    extends _$InhouseStockStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'InhouseStockState.error(error: $error)';
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
    required TResult Function(List<InhouseStock> inhouseStock) loadInHouseStock,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
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
    required TResult Function(InhouseStockList value) loadInHouseStock,
    required TResult Function(Initial value) initial,
    required TResult Function(InHouseLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InhouseStockList value)? loadInHouseStock,
    TResult? Function(Initial value)? initial,
    TResult? Function(InHouseLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InhouseStockList value)? loadInHouseStock,
    TResult Function(Initial value)? initial,
    TResult Function(InHouseLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements InhouseStockState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
