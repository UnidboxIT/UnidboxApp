// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restock_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RestockOrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int qty) incrementRestockOrder,
    required TResult Function(int qty) decremenRestockOrder,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(String? success) success,
    required TResult Function(int qty) setResotckTextFieldValue,
    required TResult Function(double minQty, double maxQty) minMaxRestockQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int qty)? incrementRestockOrder,
    TResult? Function(int qty)? decremenRestockOrder,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(String? success)? success,
    TResult? Function(int qty)? setResotckTextFieldValue,
    TResult? Function(double minQty, double maxQty)? minMaxRestockQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int qty)? incrementRestockOrder,
    TResult Function(int qty)? decremenRestockOrder,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(String? success)? success,
    TResult Function(int qty)? setResotckTextFieldValue,
    TResult Function(double minQty, double maxQty)? minMaxRestockQty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncrementRestockOrderQty value)
        incrementRestockOrder,
    required TResult Function(DecrementRestockOrderQty value)
        decremenRestockOrder,
    required TResult Function(Initial value) initial,
    required TResult Function(RestockOrderLoading value) loading,
    required TResult Function(RestockOrderError value) error,
    required TResult Function(RestockOrderSuccess value) success,
    required TResult Function(SetRestockTextFieldValue value)
        setResotckTextFieldValue,
    required TResult Function(MinMaxRestockQty value) minMaxRestockQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult? Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult? Function(Initial value)? initial,
    TResult? Function(RestockOrderLoading value)? loading,
    TResult? Function(RestockOrderError value)? error,
    TResult? Function(RestockOrderSuccess value)? success,
    TResult? Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult? Function(MinMaxRestockQty value)? minMaxRestockQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult Function(Initial value)? initial,
    TResult Function(RestockOrderLoading value)? loading,
    TResult Function(RestockOrderError value)? error,
    TResult Function(RestockOrderSuccess value)? success,
    TResult Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult Function(MinMaxRestockQty value)? minMaxRestockQty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestockOrderStateCopyWith<$Res> {
  factory $RestockOrderStateCopyWith(
          RestockOrderState value, $Res Function(RestockOrderState) then) =
      _$RestockOrderStateCopyWithImpl<$Res, RestockOrderState>;
}

/// @nodoc
class _$RestockOrderStateCopyWithImpl<$Res, $Val extends RestockOrderState>
    implements $RestockOrderStateCopyWith<$Res> {
  _$RestockOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IncrementRestockOrderQtyImplCopyWith<$Res> {
  factory _$$IncrementRestockOrderQtyImplCopyWith(
          _$IncrementRestockOrderQtyImpl value,
          $Res Function(_$IncrementRestockOrderQtyImpl) then) =
      __$$IncrementRestockOrderQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int qty});
}

/// @nodoc
class __$$IncrementRestockOrderQtyImplCopyWithImpl<$Res>
    extends _$RestockOrderStateCopyWithImpl<$Res,
        _$IncrementRestockOrderQtyImpl>
    implements _$$IncrementRestockOrderQtyImplCopyWith<$Res> {
  __$$IncrementRestockOrderQtyImplCopyWithImpl(
      _$IncrementRestockOrderQtyImpl _value,
      $Res Function(_$IncrementRestockOrderQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
  }) {
    return _then(_$IncrementRestockOrderQtyImpl(
      null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IncrementRestockOrderQtyImpl implements IncrementRestockOrderQty {
  const _$IncrementRestockOrderQtyImpl(this.qty);

  @override
  final int qty;

  @override
  String toString() {
    return 'RestockOrderState.incrementRestockOrder(qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncrementRestockOrderQtyImpl &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncrementRestockOrderQtyImplCopyWith<_$IncrementRestockOrderQtyImpl>
      get copyWith => __$$IncrementRestockOrderQtyImplCopyWithImpl<
          _$IncrementRestockOrderQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int qty) incrementRestockOrder,
    required TResult Function(int qty) decremenRestockOrder,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(String? success) success,
    required TResult Function(int qty) setResotckTextFieldValue,
    required TResult Function(double minQty, double maxQty) minMaxRestockQty,
  }) {
    return incrementRestockOrder(qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int qty)? incrementRestockOrder,
    TResult? Function(int qty)? decremenRestockOrder,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(String? success)? success,
    TResult? Function(int qty)? setResotckTextFieldValue,
    TResult? Function(double minQty, double maxQty)? minMaxRestockQty,
  }) {
    return incrementRestockOrder?.call(qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int qty)? incrementRestockOrder,
    TResult Function(int qty)? decremenRestockOrder,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(String? success)? success,
    TResult Function(int qty)? setResotckTextFieldValue,
    TResult Function(double minQty, double maxQty)? minMaxRestockQty,
    required TResult orElse(),
  }) {
    if (incrementRestockOrder != null) {
      return incrementRestockOrder(qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncrementRestockOrderQty value)
        incrementRestockOrder,
    required TResult Function(DecrementRestockOrderQty value)
        decremenRestockOrder,
    required TResult Function(Initial value) initial,
    required TResult Function(RestockOrderLoading value) loading,
    required TResult Function(RestockOrderError value) error,
    required TResult Function(RestockOrderSuccess value) success,
    required TResult Function(SetRestockTextFieldValue value)
        setResotckTextFieldValue,
    required TResult Function(MinMaxRestockQty value) minMaxRestockQty,
  }) {
    return incrementRestockOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult? Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult? Function(Initial value)? initial,
    TResult? Function(RestockOrderLoading value)? loading,
    TResult? Function(RestockOrderError value)? error,
    TResult? Function(RestockOrderSuccess value)? success,
    TResult? Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult? Function(MinMaxRestockQty value)? minMaxRestockQty,
  }) {
    return incrementRestockOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult Function(Initial value)? initial,
    TResult Function(RestockOrderLoading value)? loading,
    TResult Function(RestockOrderError value)? error,
    TResult Function(RestockOrderSuccess value)? success,
    TResult Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult Function(MinMaxRestockQty value)? minMaxRestockQty,
    required TResult orElse(),
  }) {
    if (incrementRestockOrder != null) {
      return incrementRestockOrder(this);
    }
    return orElse();
  }
}

abstract class IncrementRestockOrderQty implements RestockOrderState {
  const factory IncrementRestockOrderQty(final int qty) =
      _$IncrementRestockOrderQtyImpl;

  int get qty;
  @JsonKey(ignore: true)
  _$$IncrementRestockOrderQtyImplCopyWith<_$IncrementRestockOrderQtyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecrementRestockOrderQtyImplCopyWith<$Res> {
  factory _$$DecrementRestockOrderQtyImplCopyWith(
          _$DecrementRestockOrderQtyImpl value,
          $Res Function(_$DecrementRestockOrderQtyImpl) then) =
      __$$DecrementRestockOrderQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int qty});
}

/// @nodoc
class __$$DecrementRestockOrderQtyImplCopyWithImpl<$Res>
    extends _$RestockOrderStateCopyWithImpl<$Res,
        _$DecrementRestockOrderQtyImpl>
    implements _$$DecrementRestockOrderQtyImplCopyWith<$Res> {
  __$$DecrementRestockOrderQtyImplCopyWithImpl(
      _$DecrementRestockOrderQtyImpl _value,
      $Res Function(_$DecrementRestockOrderQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
  }) {
    return _then(_$DecrementRestockOrderQtyImpl(
      null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DecrementRestockOrderQtyImpl implements DecrementRestockOrderQty {
  const _$DecrementRestockOrderQtyImpl(this.qty);

  @override
  final int qty;

  @override
  String toString() {
    return 'RestockOrderState.decremenRestockOrder(qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecrementRestockOrderQtyImpl &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecrementRestockOrderQtyImplCopyWith<_$DecrementRestockOrderQtyImpl>
      get copyWith => __$$DecrementRestockOrderQtyImplCopyWithImpl<
          _$DecrementRestockOrderQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int qty) incrementRestockOrder,
    required TResult Function(int qty) decremenRestockOrder,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(String? success) success,
    required TResult Function(int qty) setResotckTextFieldValue,
    required TResult Function(double minQty, double maxQty) minMaxRestockQty,
  }) {
    return decremenRestockOrder(qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int qty)? incrementRestockOrder,
    TResult? Function(int qty)? decremenRestockOrder,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(String? success)? success,
    TResult? Function(int qty)? setResotckTextFieldValue,
    TResult? Function(double minQty, double maxQty)? minMaxRestockQty,
  }) {
    return decremenRestockOrder?.call(qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int qty)? incrementRestockOrder,
    TResult Function(int qty)? decremenRestockOrder,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(String? success)? success,
    TResult Function(int qty)? setResotckTextFieldValue,
    TResult Function(double minQty, double maxQty)? minMaxRestockQty,
    required TResult orElse(),
  }) {
    if (decremenRestockOrder != null) {
      return decremenRestockOrder(qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncrementRestockOrderQty value)
        incrementRestockOrder,
    required TResult Function(DecrementRestockOrderQty value)
        decremenRestockOrder,
    required TResult Function(Initial value) initial,
    required TResult Function(RestockOrderLoading value) loading,
    required TResult Function(RestockOrderError value) error,
    required TResult Function(RestockOrderSuccess value) success,
    required TResult Function(SetRestockTextFieldValue value)
        setResotckTextFieldValue,
    required TResult Function(MinMaxRestockQty value) minMaxRestockQty,
  }) {
    return decremenRestockOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult? Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult? Function(Initial value)? initial,
    TResult? Function(RestockOrderLoading value)? loading,
    TResult? Function(RestockOrderError value)? error,
    TResult? Function(RestockOrderSuccess value)? success,
    TResult? Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult? Function(MinMaxRestockQty value)? minMaxRestockQty,
  }) {
    return decremenRestockOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult Function(Initial value)? initial,
    TResult Function(RestockOrderLoading value)? loading,
    TResult Function(RestockOrderError value)? error,
    TResult Function(RestockOrderSuccess value)? success,
    TResult Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult Function(MinMaxRestockQty value)? minMaxRestockQty,
    required TResult orElse(),
  }) {
    if (decremenRestockOrder != null) {
      return decremenRestockOrder(this);
    }
    return orElse();
  }
}

abstract class DecrementRestockOrderQty implements RestockOrderState {
  const factory DecrementRestockOrderQty(final int qty) =
      _$DecrementRestockOrderQtyImpl;

  int get qty;
  @JsonKey(ignore: true)
  _$$DecrementRestockOrderQtyImplCopyWith<_$DecrementRestockOrderQtyImpl>
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
    extends _$RestockOrderStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'RestockOrderState.initial()';
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
    required TResult Function(int qty) incrementRestockOrder,
    required TResult Function(int qty) decremenRestockOrder,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(String? success) success,
    required TResult Function(int qty) setResotckTextFieldValue,
    required TResult Function(double minQty, double maxQty) minMaxRestockQty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int qty)? incrementRestockOrder,
    TResult? Function(int qty)? decremenRestockOrder,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(String? success)? success,
    TResult? Function(int qty)? setResotckTextFieldValue,
    TResult? Function(double minQty, double maxQty)? minMaxRestockQty,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int qty)? incrementRestockOrder,
    TResult Function(int qty)? decremenRestockOrder,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(String? success)? success,
    TResult Function(int qty)? setResotckTextFieldValue,
    TResult Function(double minQty, double maxQty)? minMaxRestockQty,
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
    required TResult Function(IncrementRestockOrderQty value)
        incrementRestockOrder,
    required TResult Function(DecrementRestockOrderQty value)
        decremenRestockOrder,
    required TResult Function(Initial value) initial,
    required TResult Function(RestockOrderLoading value) loading,
    required TResult Function(RestockOrderError value) error,
    required TResult Function(RestockOrderSuccess value) success,
    required TResult Function(SetRestockTextFieldValue value)
        setResotckTextFieldValue,
    required TResult Function(MinMaxRestockQty value) minMaxRestockQty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult? Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult? Function(Initial value)? initial,
    TResult? Function(RestockOrderLoading value)? loading,
    TResult? Function(RestockOrderError value)? error,
    TResult? Function(RestockOrderSuccess value)? success,
    TResult? Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult? Function(MinMaxRestockQty value)? minMaxRestockQty,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult Function(Initial value)? initial,
    TResult Function(RestockOrderLoading value)? loading,
    TResult Function(RestockOrderError value)? error,
    TResult Function(RestockOrderSuccess value)? success,
    TResult Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult Function(MinMaxRestockQty value)? minMaxRestockQty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements RestockOrderState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$RestockOrderLoadingImplCopyWith<$Res> {
  factory _$$RestockOrderLoadingImplCopyWith(_$RestockOrderLoadingImpl value,
          $Res Function(_$RestockOrderLoadingImpl) then) =
      __$$RestockOrderLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RestockOrderLoadingImplCopyWithImpl<$Res>
    extends _$RestockOrderStateCopyWithImpl<$Res, _$RestockOrderLoadingImpl>
    implements _$$RestockOrderLoadingImplCopyWith<$Res> {
  __$$RestockOrderLoadingImplCopyWithImpl(_$RestockOrderLoadingImpl _value,
      $Res Function(_$RestockOrderLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RestockOrderLoadingImpl implements RestockOrderLoading {
  const _$RestockOrderLoadingImpl();

  @override
  String toString() {
    return 'RestockOrderState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestockOrderLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int qty) incrementRestockOrder,
    required TResult Function(int qty) decremenRestockOrder,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(String? success) success,
    required TResult Function(int qty) setResotckTextFieldValue,
    required TResult Function(double minQty, double maxQty) minMaxRestockQty,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int qty)? incrementRestockOrder,
    TResult? Function(int qty)? decremenRestockOrder,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(String? success)? success,
    TResult? Function(int qty)? setResotckTextFieldValue,
    TResult? Function(double minQty, double maxQty)? minMaxRestockQty,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int qty)? incrementRestockOrder,
    TResult Function(int qty)? decremenRestockOrder,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(String? success)? success,
    TResult Function(int qty)? setResotckTextFieldValue,
    TResult Function(double minQty, double maxQty)? minMaxRestockQty,
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
    required TResult Function(IncrementRestockOrderQty value)
        incrementRestockOrder,
    required TResult Function(DecrementRestockOrderQty value)
        decremenRestockOrder,
    required TResult Function(Initial value) initial,
    required TResult Function(RestockOrderLoading value) loading,
    required TResult Function(RestockOrderError value) error,
    required TResult Function(RestockOrderSuccess value) success,
    required TResult Function(SetRestockTextFieldValue value)
        setResotckTextFieldValue,
    required TResult Function(MinMaxRestockQty value) minMaxRestockQty,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult? Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult? Function(Initial value)? initial,
    TResult? Function(RestockOrderLoading value)? loading,
    TResult? Function(RestockOrderError value)? error,
    TResult? Function(RestockOrderSuccess value)? success,
    TResult? Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult? Function(MinMaxRestockQty value)? minMaxRestockQty,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult Function(Initial value)? initial,
    TResult Function(RestockOrderLoading value)? loading,
    TResult Function(RestockOrderError value)? error,
    TResult Function(RestockOrderSuccess value)? success,
    TResult Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult Function(MinMaxRestockQty value)? minMaxRestockQty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RestockOrderLoading implements RestockOrderState {
  const factory RestockOrderLoading() = _$RestockOrderLoadingImpl;
}

/// @nodoc
abstract class _$$RestockOrderErrorImplCopyWith<$Res> {
  factory _$$RestockOrderErrorImplCopyWith(_$RestockOrderErrorImpl value,
          $Res Function(_$RestockOrderErrorImpl) then) =
      __$$RestockOrderErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$RestockOrderErrorImplCopyWithImpl<$Res>
    extends _$RestockOrderStateCopyWithImpl<$Res, _$RestockOrderErrorImpl>
    implements _$$RestockOrderErrorImplCopyWith<$Res> {
  __$$RestockOrderErrorImplCopyWithImpl(_$RestockOrderErrorImpl _value,
      $Res Function(_$RestockOrderErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$RestockOrderErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RestockOrderErrorImpl implements RestockOrderError {
  const _$RestockOrderErrorImpl({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'RestockOrderState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestockOrderErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestockOrderErrorImplCopyWith<_$RestockOrderErrorImpl> get copyWith =>
      __$$RestockOrderErrorImplCopyWithImpl<_$RestockOrderErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int qty) incrementRestockOrder,
    required TResult Function(int qty) decremenRestockOrder,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(String? success) success,
    required TResult Function(int qty) setResotckTextFieldValue,
    required TResult Function(double minQty, double maxQty) minMaxRestockQty,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int qty)? incrementRestockOrder,
    TResult? Function(int qty)? decremenRestockOrder,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(String? success)? success,
    TResult? Function(int qty)? setResotckTextFieldValue,
    TResult? Function(double minQty, double maxQty)? minMaxRestockQty,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int qty)? incrementRestockOrder,
    TResult Function(int qty)? decremenRestockOrder,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(String? success)? success,
    TResult Function(int qty)? setResotckTextFieldValue,
    TResult Function(double minQty, double maxQty)? minMaxRestockQty,
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
    required TResult Function(IncrementRestockOrderQty value)
        incrementRestockOrder,
    required TResult Function(DecrementRestockOrderQty value)
        decremenRestockOrder,
    required TResult Function(Initial value) initial,
    required TResult Function(RestockOrderLoading value) loading,
    required TResult Function(RestockOrderError value) error,
    required TResult Function(RestockOrderSuccess value) success,
    required TResult Function(SetRestockTextFieldValue value)
        setResotckTextFieldValue,
    required TResult Function(MinMaxRestockQty value) minMaxRestockQty,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult? Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult? Function(Initial value)? initial,
    TResult? Function(RestockOrderLoading value)? loading,
    TResult? Function(RestockOrderError value)? error,
    TResult? Function(RestockOrderSuccess value)? success,
    TResult? Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult? Function(MinMaxRestockQty value)? minMaxRestockQty,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult Function(Initial value)? initial,
    TResult Function(RestockOrderLoading value)? loading,
    TResult Function(RestockOrderError value)? error,
    TResult Function(RestockOrderSuccess value)? success,
    TResult Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult Function(MinMaxRestockQty value)? minMaxRestockQty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RestockOrderError implements RestockOrderState {
  const factory RestockOrderError({final String? error}) =
      _$RestockOrderErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$RestockOrderErrorImplCopyWith<_$RestockOrderErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RestockOrderSuccessImplCopyWith<$Res> {
  factory _$$RestockOrderSuccessImplCopyWith(_$RestockOrderSuccessImpl value,
          $Res Function(_$RestockOrderSuccessImpl) then) =
      __$$RestockOrderSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? success});
}

/// @nodoc
class __$$RestockOrderSuccessImplCopyWithImpl<$Res>
    extends _$RestockOrderStateCopyWithImpl<$Res, _$RestockOrderSuccessImpl>
    implements _$$RestockOrderSuccessImplCopyWith<$Res> {
  __$$RestockOrderSuccessImplCopyWithImpl(_$RestockOrderSuccessImpl _value,
      $Res Function(_$RestockOrderSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_$RestockOrderSuccessImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RestockOrderSuccessImpl implements RestockOrderSuccess {
  const _$RestockOrderSuccessImpl({this.success});

  @override
  final String? success;

  @override
  String toString() {
    return 'RestockOrderState.success(success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestockOrderSuccessImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestockOrderSuccessImplCopyWith<_$RestockOrderSuccessImpl> get copyWith =>
      __$$RestockOrderSuccessImplCopyWithImpl<_$RestockOrderSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int qty) incrementRestockOrder,
    required TResult Function(int qty) decremenRestockOrder,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(String? success) success,
    required TResult Function(int qty) setResotckTextFieldValue,
    required TResult Function(double minQty, double maxQty) minMaxRestockQty,
  }) {
    return success(this.success);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int qty)? incrementRestockOrder,
    TResult? Function(int qty)? decremenRestockOrder,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(String? success)? success,
    TResult? Function(int qty)? setResotckTextFieldValue,
    TResult? Function(double minQty, double maxQty)? minMaxRestockQty,
  }) {
    return success?.call(this.success);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int qty)? incrementRestockOrder,
    TResult Function(int qty)? decremenRestockOrder,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(String? success)? success,
    TResult Function(int qty)? setResotckTextFieldValue,
    TResult Function(double minQty, double maxQty)? minMaxRestockQty,
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
    required TResult Function(IncrementRestockOrderQty value)
        incrementRestockOrder,
    required TResult Function(DecrementRestockOrderQty value)
        decremenRestockOrder,
    required TResult Function(Initial value) initial,
    required TResult Function(RestockOrderLoading value) loading,
    required TResult Function(RestockOrderError value) error,
    required TResult Function(RestockOrderSuccess value) success,
    required TResult Function(SetRestockTextFieldValue value)
        setResotckTextFieldValue,
    required TResult Function(MinMaxRestockQty value) minMaxRestockQty,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult? Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult? Function(Initial value)? initial,
    TResult? Function(RestockOrderLoading value)? loading,
    TResult? Function(RestockOrderError value)? error,
    TResult? Function(RestockOrderSuccess value)? success,
    TResult? Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult? Function(MinMaxRestockQty value)? minMaxRestockQty,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult Function(Initial value)? initial,
    TResult Function(RestockOrderLoading value)? loading,
    TResult Function(RestockOrderError value)? error,
    TResult Function(RestockOrderSuccess value)? success,
    TResult Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult Function(MinMaxRestockQty value)? minMaxRestockQty,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RestockOrderSuccess implements RestockOrderState {
  const factory RestockOrderSuccess({final String? success}) =
      _$RestockOrderSuccessImpl;

  String? get success;
  @JsonKey(ignore: true)
  _$$RestockOrderSuccessImplCopyWith<_$RestockOrderSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetRestockTextFieldValueImplCopyWith<$Res> {
  factory _$$SetRestockTextFieldValueImplCopyWith(
          _$SetRestockTextFieldValueImpl value,
          $Res Function(_$SetRestockTextFieldValueImpl) then) =
      __$$SetRestockTextFieldValueImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int qty});
}

/// @nodoc
class __$$SetRestockTextFieldValueImplCopyWithImpl<$Res>
    extends _$RestockOrderStateCopyWithImpl<$Res,
        _$SetRestockTextFieldValueImpl>
    implements _$$SetRestockTextFieldValueImplCopyWith<$Res> {
  __$$SetRestockTextFieldValueImplCopyWithImpl(
      _$SetRestockTextFieldValueImpl _value,
      $Res Function(_$SetRestockTextFieldValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
  }) {
    return _then(_$SetRestockTextFieldValueImpl(
      null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SetRestockTextFieldValueImpl implements SetRestockTextFieldValue {
  const _$SetRestockTextFieldValueImpl(this.qty);

  @override
  final int qty;

  @override
  String toString() {
    return 'RestockOrderState.setResotckTextFieldValue(qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetRestockTextFieldValueImpl &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetRestockTextFieldValueImplCopyWith<_$SetRestockTextFieldValueImpl>
      get copyWith => __$$SetRestockTextFieldValueImplCopyWithImpl<
          _$SetRestockTextFieldValueImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int qty) incrementRestockOrder,
    required TResult Function(int qty) decremenRestockOrder,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(String? success) success,
    required TResult Function(int qty) setResotckTextFieldValue,
    required TResult Function(double minQty, double maxQty) minMaxRestockQty,
  }) {
    return setResotckTextFieldValue(qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int qty)? incrementRestockOrder,
    TResult? Function(int qty)? decremenRestockOrder,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(String? success)? success,
    TResult? Function(int qty)? setResotckTextFieldValue,
    TResult? Function(double minQty, double maxQty)? minMaxRestockQty,
  }) {
    return setResotckTextFieldValue?.call(qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int qty)? incrementRestockOrder,
    TResult Function(int qty)? decremenRestockOrder,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(String? success)? success,
    TResult Function(int qty)? setResotckTextFieldValue,
    TResult Function(double minQty, double maxQty)? minMaxRestockQty,
    required TResult orElse(),
  }) {
    if (setResotckTextFieldValue != null) {
      return setResotckTextFieldValue(qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncrementRestockOrderQty value)
        incrementRestockOrder,
    required TResult Function(DecrementRestockOrderQty value)
        decremenRestockOrder,
    required TResult Function(Initial value) initial,
    required TResult Function(RestockOrderLoading value) loading,
    required TResult Function(RestockOrderError value) error,
    required TResult Function(RestockOrderSuccess value) success,
    required TResult Function(SetRestockTextFieldValue value)
        setResotckTextFieldValue,
    required TResult Function(MinMaxRestockQty value) minMaxRestockQty,
  }) {
    return setResotckTextFieldValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult? Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult? Function(Initial value)? initial,
    TResult? Function(RestockOrderLoading value)? loading,
    TResult? Function(RestockOrderError value)? error,
    TResult? Function(RestockOrderSuccess value)? success,
    TResult? Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult? Function(MinMaxRestockQty value)? minMaxRestockQty,
  }) {
    return setResotckTextFieldValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult Function(Initial value)? initial,
    TResult Function(RestockOrderLoading value)? loading,
    TResult Function(RestockOrderError value)? error,
    TResult Function(RestockOrderSuccess value)? success,
    TResult Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult Function(MinMaxRestockQty value)? minMaxRestockQty,
    required TResult orElse(),
  }) {
    if (setResotckTextFieldValue != null) {
      return setResotckTextFieldValue(this);
    }
    return orElse();
  }
}

abstract class SetRestockTextFieldValue implements RestockOrderState {
  const factory SetRestockTextFieldValue(final int qty) =
      _$SetRestockTextFieldValueImpl;

  int get qty;
  @JsonKey(ignore: true)
  _$$SetRestockTextFieldValueImplCopyWith<_$SetRestockTextFieldValueImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MinMaxRestockQtyImplCopyWith<$Res> {
  factory _$$MinMaxRestockQtyImplCopyWith(_$MinMaxRestockQtyImpl value,
          $Res Function(_$MinMaxRestockQtyImpl) then) =
      __$$MinMaxRestockQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double minQty, double maxQty});
}

/// @nodoc
class __$$MinMaxRestockQtyImplCopyWithImpl<$Res>
    extends _$RestockOrderStateCopyWithImpl<$Res, _$MinMaxRestockQtyImpl>
    implements _$$MinMaxRestockQtyImplCopyWith<$Res> {
  __$$MinMaxRestockQtyImplCopyWithImpl(_$MinMaxRestockQtyImpl _value,
      $Res Function(_$MinMaxRestockQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minQty = null,
    Object? maxQty = null,
  }) {
    return _then(_$MinMaxRestockQtyImpl(
      null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as double,
      null == maxQty
          ? _value.maxQty
          : maxQty // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$MinMaxRestockQtyImpl implements MinMaxRestockQty {
  const _$MinMaxRestockQtyImpl(this.minQty, this.maxQty);

  @override
  final double minQty;
  @override
  final double maxQty;

  @override
  String toString() {
    return 'RestockOrderState.minMaxRestockQty(minQty: $minQty, maxQty: $maxQty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MinMaxRestockQtyImpl &&
            (identical(other.minQty, minQty) || other.minQty == minQty) &&
            (identical(other.maxQty, maxQty) || other.maxQty == maxQty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, minQty, maxQty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MinMaxRestockQtyImplCopyWith<_$MinMaxRestockQtyImpl> get copyWith =>
      __$$MinMaxRestockQtyImplCopyWithImpl<_$MinMaxRestockQtyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int qty) incrementRestockOrder,
    required TResult Function(int qty) decremenRestockOrder,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(String? success) success,
    required TResult Function(int qty) setResotckTextFieldValue,
    required TResult Function(double minQty, double maxQty) minMaxRestockQty,
  }) {
    return minMaxRestockQty(minQty, maxQty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int qty)? incrementRestockOrder,
    TResult? Function(int qty)? decremenRestockOrder,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(String? success)? success,
    TResult? Function(int qty)? setResotckTextFieldValue,
    TResult? Function(double minQty, double maxQty)? minMaxRestockQty,
  }) {
    return minMaxRestockQty?.call(minQty, maxQty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int qty)? incrementRestockOrder,
    TResult Function(int qty)? decremenRestockOrder,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(String? success)? success,
    TResult Function(int qty)? setResotckTextFieldValue,
    TResult Function(double minQty, double maxQty)? minMaxRestockQty,
    required TResult orElse(),
  }) {
    if (minMaxRestockQty != null) {
      return minMaxRestockQty(minQty, maxQty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncrementRestockOrderQty value)
        incrementRestockOrder,
    required TResult Function(DecrementRestockOrderQty value)
        decremenRestockOrder,
    required TResult Function(Initial value) initial,
    required TResult Function(RestockOrderLoading value) loading,
    required TResult Function(RestockOrderError value) error,
    required TResult Function(RestockOrderSuccess value) success,
    required TResult Function(SetRestockTextFieldValue value)
        setResotckTextFieldValue,
    required TResult Function(MinMaxRestockQty value) minMaxRestockQty,
  }) {
    return minMaxRestockQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult? Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult? Function(Initial value)? initial,
    TResult? Function(RestockOrderLoading value)? loading,
    TResult? Function(RestockOrderError value)? error,
    TResult? Function(RestockOrderSuccess value)? success,
    TResult? Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult? Function(MinMaxRestockQty value)? minMaxRestockQty,
  }) {
    return minMaxRestockQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementRestockOrderQty value)? incrementRestockOrder,
    TResult Function(DecrementRestockOrderQty value)? decremenRestockOrder,
    TResult Function(Initial value)? initial,
    TResult Function(RestockOrderLoading value)? loading,
    TResult Function(RestockOrderError value)? error,
    TResult Function(RestockOrderSuccess value)? success,
    TResult Function(SetRestockTextFieldValue value)? setResotckTextFieldValue,
    TResult Function(MinMaxRestockQty value)? minMaxRestockQty,
    required TResult orElse(),
  }) {
    if (minMaxRestockQty != null) {
      return minMaxRestockQty(this);
    }
    return orElse();
  }
}

abstract class MinMaxRestockQty implements RestockOrderState {
  const factory MinMaxRestockQty(final double minQty, final double maxQty) =
      _$MinMaxRestockQtyImpl;

  double get minQty;
  double get maxQty;
  @JsonKey(ignore: true)
  _$$MinMaxRestockQtyImplCopyWith<_$MinMaxRestockQtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
