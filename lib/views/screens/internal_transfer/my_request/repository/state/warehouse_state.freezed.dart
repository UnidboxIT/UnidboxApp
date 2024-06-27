// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warehouse_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WarehouseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Warehouse> warehouseList) loadWarehouseData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) warehouseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Warehouse> warehouseList)? loadWarehouseData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? warehouseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Warehouse> warehouseList)? loadWarehouseData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? warehouseError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WarehouseList value) loadWarehouseData,
    required TResult Function(Initial value) initial,
    required TResult Function(WarehouseLoading value) loading,
    required TResult Function(WarehouseError value) warehouseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WarehouseList value)? loadWarehouseData,
    TResult? Function(Initial value)? initial,
    TResult? Function(WarehouseLoading value)? loading,
    TResult? Function(WarehouseError value)? warehouseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WarehouseList value)? loadWarehouseData,
    TResult Function(Initial value)? initial,
    TResult Function(WarehouseLoading value)? loading,
    TResult Function(WarehouseError value)? warehouseError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarehouseStateCopyWith<$Res> {
  factory $WarehouseStateCopyWith(
          WarehouseState value, $Res Function(WarehouseState) then) =
      _$WarehouseStateCopyWithImpl<$Res, WarehouseState>;
}

/// @nodoc
class _$WarehouseStateCopyWithImpl<$Res, $Val extends WarehouseState>
    implements $WarehouseStateCopyWith<$Res> {
  _$WarehouseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WarehouseListImplCopyWith<$Res> {
  factory _$$WarehouseListImplCopyWith(
          _$WarehouseListImpl value, $Res Function(_$WarehouseListImpl) then) =
      __$$WarehouseListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Warehouse> warehouseList});
}

/// @nodoc
class __$$WarehouseListImplCopyWithImpl<$Res>
    extends _$WarehouseStateCopyWithImpl<$Res, _$WarehouseListImpl>
    implements _$$WarehouseListImplCopyWith<$Res> {
  __$$WarehouseListImplCopyWithImpl(
      _$WarehouseListImpl _value, $Res Function(_$WarehouseListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouseList = null,
  }) {
    return _then(_$WarehouseListImpl(
      null == warehouseList
          ? _value._warehouseList
          : warehouseList // ignore: cast_nullable_to_non_nullable
              as List<Warehouse>,
    ));
  }
}

/// @nodoc

class _$WarehouseListImpl implements WarehouseList {
  const _$WarehouseListImpl(final List<Warehouse> warehouseList)
      : _warehouseList = warehouseList;

  final List<Warehouse> _warehouseList;
  @override
  List<Warehouse> get warehouseList {
    if (_warehouseList is EqualUnmodifiableListView) return _warehouseList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warehouseList);
  }

  @override
  String toString() {
    return 'WarehouseState.loadWarehouseData(warehouseList: $warehouseList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WarehouseListImpl &&
            const DeepCollectionEquality()
                .equals(other._warehouseList, _warehouseList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_warehouseList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WarehouseListImplCopyWith<_$WarehouseListImpl> get copyWith =>
      __$$WarehouseListImplCopyWithImpl<_$WarehouseListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Warehouse> warehouseList) loadWarehouseData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) warehouseError,
  }) {
    return loadWarehouseData(warehouseList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Warehouse> warehouseList)? loadWarehouseData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? warehouseError,
  }) {
    return loadWarehouseData?.call(warehouseList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Warehouse> warehouseList)? loadWarehouseData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? warehouseError,
    required TResult orElse(),
  }) {
    if (loadWarehouseData != null) {
      return loadWarehouseData(warehouseList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WarehouseList value) loadWarehouseData,
    required TResult Function(Initial value) initial,
    required TResult Function(WarehouseLoading value) loading,
    required TResult Function(WarehouseError value) warehouseError,
  }) {
    return loadWarehouseData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WarehouseList value)? loadWarehouseData,
    TResult? Function(Initial value)? initial,
    TResult? Function(WarehouseLoading value)? loading,
    TResult? Function(WarehouseError value)? warehouseError,
  }) {
    return loadWarehouseData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WarehouseList value)? loadWarehouseData,
    TResult Function(Initial value)? initial,
    TResult Function(WarehouseLoading value)? loading,
    TResult Function(WarehouseError value)? warehouseError,
    required TResult orElse(),
  }) {
    if (loadWarehouseData != null) {
      return loadWarehouseData(this);
    }
    return orElse();
  }
}

abstract class WarehouseList implements WarehouseState {
  const factory WarehouseList(final List<Warehouse> warehouseList) =
      _$WarehouseListImpl;

  List<Warehouse> get warehouseList;
  @JsonKey(ignore: true)
  _$$WarehouseListImplCopyWith<_$WarehouseListImpl> get copyWith =>
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
    extends _$WarehouseStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'WarehouseState.initial()';
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
    required TResult Function(List<Warehouse> warehouseList) loadWarehouseData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) warehouseError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Warehouse> warehouseList)? loadWarehouseData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? warehouseError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Warehouse> warehouseList)? loadWarehouseData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? warehouseError,
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
    required TResult Function(WarehouseList value) loadWarehouseData,
    required TResult Function(Initial value) initial,
    required TResult Function(WarehouseLoading value) loading,
    required TResult Function(WarehouseError value) warehouseError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WarehouseList value)? loadWarehouseData,
    TResult? Function(Initial value)? initial,
    TResult? Function(WarehouseLoading value)? loading,
    TResult? Function(WarehouseError value)? warehouseError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WarehouseList value)? loadWarehouseData,
    TResult Function(Initial value)? initial,
    TResult Function(WarehouseLoading value)? loading,
    TResult Function(WarehouseError value)? warehouseError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements WarehouseState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$WarehouseLoadingImplCopyWith<$Res> {
  factory _$$WarehouseLoadingImplCopyWith(_$WarehouseLoadingImpl value,
          $Res Function(_$WarehouseLoadingImpl) then) =
      __$$WarehouseLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WarehouseLoadingImplCopyWithImpl<$Res>
    extends _$WarehouseStateCopyWithImpl<$Res, _$WarehouseLoadingImpl>
    implements _$$WarehouseLoadingImplCopyWith<$Res> {
  __$$WarehouseLoadingImplCopyWithImpl(_$WarehouseLoadingImpl _value,
      $Res Function(_$WarehouseLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WarehouseLoadingImpl implements WarehouseLoading {
  const _$WarehouseLoadingImpl();

  @override
  String toString() {
    return 'WarehouseState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WarehouseLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Warehouse> warehouseList) loadWarehouseData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) warehouseError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Warehouse> warehouseList)? loadWarehouseData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? warehouseError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Warehouse> warehouseList)? loadWarehouseData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? warehouseError,
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
    required TResult Function(WarehouseList value) loadWarehouseData,
    required TResult Function(Initial value) initial,
    required TResult Function(WarehouseLoading value) loading,
    required TResult Function(WarehouseError value) warehouseError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WarehouseList value)? loadWarehouseData,
    TResult? Function(Initial value)? initial,
    TResult? Function(WarehouseLoading value)? loading,
    TResult? Function(WarehouseError value)? warehouseError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WarehouseList value)? loadWarehouseData,
    TResult Function(Initial value)? initial,
    TResult Function(WarehouseLoading value)? loading,
    TResult Function(WarehouseError value)? warehouseError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class WarehouseLoading implements WarehouseState {
  const factory WarehouseLoading() = _$WarehouseLoadingImpl;
}

/// @nodoc
abstract class _$$WarehouseErrorImplCopyWith<$Res> {
  factory _$$WarehouseErrorImplCopyWith(_$WarehouseErrorImpl value,
          $Res Function(_$WarehouseErrorImpl) then) =
      __$$WarehouseErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$WarehouseErrorImplCopyWithImpl<$Res>
    extends _$WarehouseStateCopyWithImpl<$Res, _$WarehouseErrorImpl>
    implements _$$WarehouseErrorImplCopyWith<$Res> {
  __$$WarehouseErrorImplCopyWithImpl(
      _$WarehouseErrorImpl _value, $Res Function(_$WarehouseErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$WarehouseErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WarehouseErrorImpl implements WarehouseError {
  const _$WarehouseErrorImpl({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'WarehouseState.warehouseError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WarehouseErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WarehouseErrorImplCopyWith<_$WarehouseErrorImpl> get copyWith =>
      __$$WarehouseErrorImplCopyWithImpl<_$WarehouseErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Warehouse> warehouseList) loadWarehouseData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) warehouseError,
  }) {
    return warehouseError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Warehouse> warehouseList)? loadWarehouseData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? warehouseError,
  }) {
    return warehouseError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Warehouse> warehouseList)? loadWarehouseData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? warehouseError,
    required TResult orElse(),
  }) {
    if (warehouseError != null) {
      return warehouseError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WarehouseList value) loadWarehouseData,
    required TResult Function(Initial value) initial,
    required TResult Function(WarehouseLoading value) loading,
    required TResult Function(WarehouseError value) warehouseError,
  }) {
    return warehouseError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WarehouseList value)? loadWarehouseData,
    TResult? Function(Initial value)? initial,
    TResult? Function(WarehouseLoading value)? loading,
    TResult? Function(WarehouseError value)? warehouseError,
  }) {
    return warehouseError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WarehouseList value)? loadWarehouseData,
    TResult Function(Initial value)? initial,
    TResult Function(WarehouseLoading value)? loading,
    TResult Function(WarehouseError value)? warehouseError,
    required TResult orElse(),
  }) {
    if (warehouseError != null) {
      return warehouseError(this);
    }
    return orElse();
  }
}

abstract class WarehouseError implements WarehouseState {
  const factory WarehouseError({final String? error}) = _$WarehouseErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$WarehouseErrorImplCopyWith<_$WarehouseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
