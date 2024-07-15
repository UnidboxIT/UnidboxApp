// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_warehouse_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserWarehouseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserWarehouse warehouse) loadWarehouseData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserWarehouse warehouse)? loadWarehouseData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserWarehouse warehouse)? loadWarehouseData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserWarehouseData value) loadWarehouseData,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UserWarehouseError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserWarehouseData value)? loadWarehouseData,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UserWarehouseError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserWarehouseData value)? loadWarehouseData,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UserWarehouseError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWarehouseStateCopyWith<$Res> {
  factory $UserWarehouseStateCopyWith(
          UserWarehouseState value, $Res Function(UserWarehouseState) then) =
      _$UserWarehouseStateCopyWithImpl<$Res, UserWarehouseState>;
}

/// @nodoc
class _$UserWarehouseStateCopyWithImpl<$Res, $Val extends UserWarehouseState>
    implements $UserWarehouseStateCopyWith<$Res> {
  _$UserWarehouseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserWarehouseDataImplCopyWith<$Res> {
  factory _$$UserWarehouseDataImplCopyWith(_$UserWarehouseDataImpl value,
          $Res Function(_$UserWarehouseDataImpl) then) =
      __$$UserWarehouseDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserWarehouse warehouse});
}

/// @nodoc
class __$$UserWarehouseDataImplCopyWithImpl<$Res>
    extends _$UserWarehouseStateCopyWithImpl<$Res, _$UserWarehouseDataImpl>
    implements _$$UserWarehouseDataImplCopyWith<$Res> {
  __$$UserWarehouseDataImplCopyWithImpl(_$UserWarehouseDataImpl _value,
      $Res Function(_$UserWarehouseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warehouse = null,
  }) {
    return _then(_$UserWarehouseDataImpl(
      null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as UserWarehouse,
    ));
  }
}

/// @nodoc

class _$UserWarehouseDataImpl implements UserWarehouseData {
  const _$UserWarehouseDataImpl(this.warehouse);

  @override
  final UserWarehouse warehouse;

  @override
  String toString() {
    return 'UserWarehouseState.loadWarehouseData(warehouse: $warehouse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserWarehouseDataImpl &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, warehouse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserWarehouseDataImplCopyWith<_$UserWarehouseDataImpl> get copyWith =>
      __$$UserWarehouseDataImplCopyWithImpl<_$UserWarehouseDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserWarehouse warehouse) loadWarehouseData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadWarehouseData(warehouse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserWarehouse warehouse)? loadWarehouseData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadWarehouseData?.call(warehouse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserWarehouse warehouse)? loadWarehouseData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadWarehouseData != null) {
      return loadWarehouseData(warehouse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserWarehouseData value) loadWarehouseData,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UserWarehouseError value) error,
  }) {
    return loadWarehouseData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserWarehouseData value)? loadWarehouseData,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UserWarehouseError value)? error,
  }) {
    return loadWarehouseData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserWarehouseData value)? loadWarehouseData,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UserWarehouseError value)? error,
    required TResult orElse(),
  }) {
    if (loadWarehouseData != null) {
      return loadWarehouseData(this);
    }
    return orElse();
  }
}

abstract class UserWarehouseData implements UserWarehouseState {
  const factory UserWarehouseData(final UserWarehouse warehouse) =
      _$UserWarehouseDataImpl;

  UserWarehouse get warehouse;
  @JsonKey(ignore: true)
  _$$UserWarehouseDataImplCopyWith<_$UserWarehouseDataImpl> get copyWith =>
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
    extends _$UserWarehouseStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'UserWarehouseState.initial()';
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
    required TResult Function(UserWarehouse warehouse) loadWarehouseData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserWarehouse warehouse)? loadWarehouseData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserWarehouse warehouse)? loadWarehouseData,
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
    required TResult Function(UserWarehouseData value) loadWarehouseData,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UserWarehouseError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserWarehouseData value)? loadWarehouseData,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UserWarehouseError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserWarehouseData value)? loadWarehouseData,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UserWarehouseError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements UserWarehouseState {
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
    extends _$UserWarehouseStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'UserWarehouseState.loading()';
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
    required TResult Function(UserWarehouse warehouse) loadWarehouseData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserWarehouse warehouse)? loadWarehouseData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserWarehouse warehouse)? loadWarehouseData,
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
    required TResult Function(UserWarehouseData value) loadWarehouseData,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UserWarehouseError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserWarehouseData value)? loadWarehouseData,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UserWarehouseError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserWarehouseData value)? loadWarehouseData,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UserWarehouseError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements UserWarehouseState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$UserWarehouseErrorImplCopyWith<$Res> {
  factory _$$UserWarehouseErrorImplCopyWith(_$UserWarehouseErrorImpl value,
          $Res Function(_$UserWarehouseErrorImpl) then) =
      __$$UserWarehouseErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$UserWarehouseErrorImplCopyWithImpl<$Res>
    extends _$UserWarehouseStateCopyWithImpl<$Res, _$UserWarehouseErrorImpl>
    implements _$$UserWarehouseErrorImplCopyWith<$Res> {
  __$$UserWarehouseErrorImplCopyWithImpl(_$UserWarehouseErrorImpl _value,
      $Res Function(_$UserWarehouseErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$UserWarehouseErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserWarehouseErrorImpl implements UserWarehouseError {
  const _$UserWarehouseErrorImpl({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'UserWarehouseState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserWarehouseErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserWarehouseErrorImplCopyWith<_$UserWarehouseErrorImpl> get copyWith =>
      __$$UserWarehouseErrorImplCopyWithImpl<_$UserWarehouseErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserWarehouse warehouse) loadWarehouseData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserWarehouse warehouse)? loadWarehouseData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserWarehouse warehouse)? loadWarehouseData,
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
    required TResult Function(UserWarehouseData value) loadWarehouseData,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UserWarehouseError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserWarehouseData value)? loadWarehouseData,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UserWarehouseError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserWarehouseData value)? loadWarehouseData,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UserWarehouseError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UserWarehouseError implements UserWarehouseState {
  const factory UserWarehouseError({final String? error}) =
      _$UserWarehouseErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$UserWarehouseErrorImplCopyWith<_$UserWarehouseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
