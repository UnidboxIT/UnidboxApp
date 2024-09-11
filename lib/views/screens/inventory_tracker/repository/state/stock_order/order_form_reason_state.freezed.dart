// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_form_reason_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderFormReasonState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReturnRequestReason> orderFormReasonList)
        loadOrderFormReason,
    required TResult Function(Map<String, int> qty) incrementOrderFormQty,
    required TResult Function(Map<String, int> qty) decrementOrderFormQty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReturnRequestReason> orderFormReasonList)?
        loadOrderFormReason,
    TResult? Function(Map<String, int> qty)? incrementOrderFormQty,
    TResult? Function(Map<String, int> qty)? decrementOrderFormQty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReturnRequestReason> orderFormReasonList)?
        loadOrderFormReason,
    TResult Function(Map<String, int> qty)? incrementOrderFormQty,
    TResult Function(Map<String, int> qty)? decrementOrderFormQty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderFormReasonList value) loadOrderFormReason,
    required TResult Function(IncrementOrderFormReason value)
        incrementOrderFormQty,
    required TResult Function(DecrementOrderFormReason value)
        decrementOrderFormQty,
    required TResult Function(Initial value) initial,
    required TResult Function(OrderFormReasonLoading value) loading,
    required TResult Function(OrderFormReasonError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderFormReasonList value)? loadOrderFormReason,
    TResult? Function(IncrementOrderFormReason value)? incrementOrderFormQty,
    TResult? Function(DecrementOrderFormReason value)? decrementOrderFormQty,
    TResult? Function(Initial value)? initial,
    TResult? Function(OrderFormReasonLoading value)? loading,
    TResult? Function(OrderFormReasonError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderFormReasonList value)? loadOrderFormReason,
    TResult Function(IncrementOrderFormReason value)? incrementOrderFormQty,
    TResult Function(DecrementOrderFormReason value)? decrementOrderFormQty,
    TResult Function(Initial value)? initial,
    TResult Function(OrderFormReasonLoading value)? loading,
    TResult Function(OrderFormReasonError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderFormReasonStateCopyWith<$Res> {
  factory $OrderFormReasonStateCopyWith(OrderFormReasonState value,
          $Res Function(OrderFormReasonState) then) =
      _$OrderFormReasonStateCopyWithImpl<$Res, OrderFormReasonState>;
}

/// @nodoc
class _$OrderFormReasonStateCopyWithImpl<$Res,
        $Val extends OrderFormReasonState>
    implements $OrderFormReasonStateCopyWith<$Res> {
  _$OrderFormReasonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OrderFormReasonListImplCopyWith<$Res> {
  factory _$$OrderFormReasonListImplCopyWith(_$OrderFormReasonListImpl value,
          $Res Function(_$OrderFormReasonListImpl) then) =
      __$$OrderFormReasonListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ReturnRequestReason> orderFormReasonList});
}

/// @nodoc
class __$$OrderFormReasonListImplCopyWithImpl<$Res>
    extends _$OrderFormReasonStateCopyWithImpl<$Res, _$OrderFormReasonListImpl>
    implements _$$OrderFormReasonListImplCopyWith<$Res> {
  __$$OrderFormReasonListImplCopyWithImpl(_$OrderFormReasonListImpl _value,
      $Res Function(_$OrderFormReasonListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderFormReasonList = null,
  }) {
    return _then(_$OrderFormReasonListImpl(
      null == orderFormReasonList
          ? _value._orderFormReasonList
          : orderFormReasonList // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestReason>,
    ));
  }
}

/// @nodoc

class _$OrderFormReasonListImpl implements OrderFormReasonList {
  const _$OrderFormReasonListImpl(
      final List<ReturnRequestReason> orderFormReasonList)
      : _orderFormReasonList = orderFormReasonList;

  final List<ReturnRequestReason> _orderFormReasonList;
  @override
  List<ReturnRequestReason> get orderFormReasonList {
    if (_orderFormReasonList is EqualUnmodifiableListView)
      return _orderFormReasonList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderFormReasonList);
  }

  @override
  String toString() {
    return 'OrderFormReasonState.loadOrderFormReason(orderFormReasonList: $orderFormReasonList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderFormReasonListImpl &&
            const DeepCollectionEquality()
                .equals(other._orderFormReasonList, _orderFormReasonList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_orderFormReasonList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderFormReasonListImplCopyWith<_$OrderFormReasonListImpl> get copyWith =>
      __$$OrderFormReasonListImplCopyWithImpl<_$OrderFormReasonListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReturnRequestReason> orderFormReasonList)
        loadOrderFormReason,
    required TResult Function(Map<String, int> qty) incrementOrderFormQty,
    required TResult Function(Map<String, int> qty) decrementOrderFormQty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadOrderFormReason(orderFormReasonList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReturnRequestReason> orderFormReasonList)?
        loadOrderFormReason,
    TResult? Function(Map<String, int> qty)? incrementOrderFormQty,
    TResult? Function(Map<String, int> qty)? decrementOrderFormQty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadOrderFormReason?.call(orderFormReasonList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReturnRequestReason> orderFormReasonList)?
        loadOrderFormReason,
    TResult Function(Map<String, int> qty)? incrementOrderFormQty,
    TResult Function(Map<String, int> qty)? decrementOrderFormQty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadOrderFormReason != null) {
      return loadOrderFormReason(orderFormReasonList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderFormReasonList value) loadOrderFormReason,
    required TResult Function(IncrementOrderFormReason value)
        incrementOrderFormQty,
    required TResult Function(DecrementOrderFormReason value)
        decrementOrderFormQty,
    required TResult Function(Initial value) initial,
    required TResult Function(OrderFormReasonLoading value) loading,
    required TResult Function(OrderFormReasonError value) error,
  }) {
    return loadOrderFormReason(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderFormReasonList value)? loadOrderFormReason,
    TResult? Function(IncrementOrderFormReason value)? incrementOrderFormQty,
    TResult? Function(DecrementOrderFormReason value)? decrementOrderFormQty,
    TResult? Function(Initial value)? initial,
    TResult? Function(OrderFormReasonLoading value)? loading,
    TResult? Function(OrderFormReasonError value)? error,
  }) {
    return loadOrderFormReason?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderFormReasonList value)? loadOrderFormReason,
    TResult Function(IncrementOrderFormReason value)? incrementOrderFormQty,
    TResult Function(DecrementOrderFormReason value)? decrementOrderFormQty,
    TResult Function(Initial value)? initial,
    TResult Function(OrderFormReasonLoading value)? loading,
    TResult Function(OrderFormReasonError value)? error,
    required TResult orElse(),
  }) {
    if (loadOrderFormReason != null) {
      return loadOrderFormReason(this);
    }
    return orElse();
  }
}

abstract class OrderFormReasonList implements OrderFormReasonState {
  const factory OrderFormReasonList(
          final List<ReturnRequestReason> orderFormReasonList) =
      _$OrderFormReasonListImpl;

  List<ReturnRequestReason> get orderFormReasonList;
  @JsonKey(ignore: true)
  _$$OrderFormReasonListImplCopyWith<_$OrderFormReasonListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncrementOrderFormReasonImplCopyWith<$Res> {
  factory _$$IncrementOrderFormReasonImplCopyWith(
          _$IncrementOrderFormReasonImpl value,
          $Res Function(_$IncrementOrderFormReasonImpl) then) =
      __$$IncrementOrderFormReasonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, int> qty});
}

/// @nodoc
class __$$IncrementOrderFormReasonImplCopyWithImpl<$Res>
    extends _$OrderFormReasonStateCopyWithImpl<$Res,
        _$IncrementOrderFormReasonImpl>
    implements _$$IncrementOrderFormReasonImplCopyWith<$Res> {
  __$$IncrementOrderFormReasonImplCopyWithImpl(
      _$IncrementOrderFormReasonImpl _value,
      $Res Function(_$IncrementOrderFormReasonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
  }) {
    return _then(_$IncrementOrderFormReasonImpl(
      null == qty
          ? _value._qty
          : qty // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc

class _$IncrementOrderFormReasonImpl implements IncrementOrderFormReason {
  const _$IncrementOrderFormReasonImpl(final Map<String, int> qty) : _qty = qty;

  final Map<String, int> _qty;
  @override
  Map<String, int> get qty {
    if (_qty is EqualUnmodifiableMapView) return _qty;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_qty);
  }

  @override
  String toString() {
    return 'OrderFormReasonState.incrementOrderFormQty(qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncrementOrderFormReasonImpl &&
            const DeepCollectionEquality().equals(other._qty, _qty));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_qty));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncrementOrderFormReasonImplCopyWith<_$IncrementOrderFormReasonImpl>
      get copyWith => __$$IncrementOrderFormReasonImplCopyWithImpl<
          _$IncrementOrderFormReasonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReturnRequestReason> orderFormReasonList)
        loadOrderFormReason,
    required TResult Function(Map<String, int> qty) incrementOrderFormQty,
    required TResult Function(Map<String, int> qty) decrementOrderFormQty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return incrementOrderFormQty(qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReturnRequestReason> orderFormReasonList)?
        loadOrderFormReason,
    TResult? Function(Map<String, int> qty)? incrementOrderFormQty,
    TResult? Function(Map<String, int> qty)? decrementOrderFormQty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return incrementOrderFormQty?.call(qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReturnRequestReason> orderFormReasonList)?
        loadOrderFormReason,
    TResult Function(Map<String, int> qty)? incrementOrderFormQty,
    TResult Function(Map<String, int> qty)? decrementOrderFormQty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (incrementOrderFormQty != null) {
      return incrementOrderFormQty(qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderFormReasonList value) loadOrderFormReason,
    required TResult Function(IncrementOrderFormReason value)
        incrementOrderFormQty,
    required TResult Function(DecrementOrderFormReason value)
        decrementOrderFormQty,
    required TResult Function(Initial value) initial,
    required TResult Function(OrderFormReasonLoading value) loading,
    required TResult Function(OrderFormReasonError value) error,
  }) {
    return incrementOrderFormQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderFormReasonList value)? loadOrderFormReason,
    TResult? Function(IncrementOrderFormReason value)? incrementOrderFormQty,
    TResult? Function(DecrementOrderFormReason value)? decrementOrderFormQty,
    TResult? Function(Initial value)? initial,
    TResult? Function(OrderFormReasonLoading value)? loading,
    TResult? Function(OrderFormReasonError value)? error,
  }) {
    return incrementOrderFormQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderFormReasonList value)? loadOrderFormReason,
    TResult Function(IncrementOrderFormReason value)? incrementOrderFormQty,
    TResult Function(DecrementOrderFormReason value)? decrementOrderFormQty,
    TResult Function(Initial value)? initial,
    TResult Function(OrderFormReasonLoading value)? loading,
    TResult Function(OrderFormReasonError value)? error,
    required TResult orElse(),
  }) {
    if (incrementOrderFormQty != null) {
      return incrementOrderFormQty(this);
    }
    return orElse();
  }
}

abstract class IncrementOrderFormReason implements OrderFormReasonState {
  const factory IncrementOrderFormReason(final Map<String, int> qty) =
      _$IncrementOrderFormReasonImpl;

  Map<String, int> get qty;
  @JsonKey(ignore: true)
  _$$IncrementOrderFormReasonImplCopyWith<_$IncrementOrderFormReasonImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecrementOrderFormReasonImplCopyWith<$Res> {
  factory _$$DecrementOrderFormReasonImplCopyWith(
          _$DecrementOrderFormReasonImpl value,
          $Res Function(_$DecrementOrderFormReasonImpl) then) =
      __$$DecrementOrderFormReasonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, int> qty});
}

/// @nodoc
class __$$DecrementOrderFormReasonImplCopyWithImpl<$Res>
    extends _$OrderFormReasonStateCopyWithImpl<$Res,
        _$DecrementOrderFormReasonImpl>
    implements _$$DecrementOrderFormReasonImplCopyWith<$Res> {
  __$$DecrementOrderFormReasonImplCopyWithImpl(
      _$DecrementOrderFormReasonImpl _value,
      $Res Function(_$DecrementOrderFormReasonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
  }) {
    return _then(_$DecrementOrderFormReasonImpl(
      null == qty
          ? _value._qty
          : qty // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc

class _$DecrementOrderFormReasonImpl implements DecrementOrderFormReason {
  const _$DecrementOrderFormReasonImpl(final Map<String, int> qty) : _qty = qty;

  final Map<String, int> _qty;
  @override
  Map<String, int> get qty {
    if (_qty is EqualUnmodifiableMapView) return _qty;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_qty);
  }

  @override
  String toString() {
    return 'OrderFormReasonState.decrementOrderFormQty(qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecrementOrderFormReasonImpl &&
            const DeepCollectionEquality().equals(other._qty, _qty));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_qty));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecrementOrderFormReasonImplCopyWith<_$DecrementOrderFormReasonImpl>
      get copyWith => __$$DecrementOrderFormReasonImplCopyWithImpl<
          _$DecrementOrderFormReasonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReturnRequestReason> orderFormReasonList)
        loadOrderFormReason,
    required TResult Function(Map<String, int> qty) incrementOrderFormQty,
    required TResult Function(Map<String, int> qty) decrementOrderFormQty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return decrementOrderFormQty(qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReturnRequestReason> orderFormReasonList)?
        loadOrderFormReason,
    TResult? Function(Map<String, int> qty)? incrementOrderFormQty,
    TResult? Function(Map<String, int> qty)? decrementOrderFormQty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return decrementOrderFormQty?.call(qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReturnRequestReason> orderFormReasonList)?
        loadOrderFormReason,
    TResult Function(Map<String, int> qty)? incrementOrderFormQty,
    TResult Function(Map<String, int> qty)? decrementOrderFormQty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (decrementOrderFormQty != null) {
      return decrementOrderFormQty(qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderFormReasonList value) loadOrderFormReason,
    required TResult Function(IncrementOrderFormReason value)
        incrementOrderFormQty,
    required TResult Function(DecrementOrderFormReason value)
        decrementOrderFormQty,
    required TResult Function(Initial value) initial,
    required TResult Function(OrderFormReasonLoading value) loading,
    required TResult Function(OrderFormReasonError value) error,
  }) {
    return decrementOrderFormQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderFormReasonList value)? loadOrderFormReason,
    TResult? Function(IncrementOrderFormReason value)? incrementOrderFormQty,
    TResult? Function(DecrementOrderFormReason value)? decrementOrderFormQty,
    TResult? Function(Initial value)? initial,
    TResult? Function(OrderFormReasonLoading value)? loading,
    TResult? Function(OrderFormReasonError value)? error,
  }) {
    return decrementOrderFormQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderFormReasonList value)? loadOrderFormReason,
    TResult Function(IncrementOrderFormReason value)? incrementOrderFormQty,
    TResult Function(DecrementOrderFormReason value)? decrementOrderFormQty,
    TResult Function(Initial value)? initial,
    TResult Function(OrderFormReasonLoading value)? loading,
    TResult Function(OrderFormReasonError value)? error,
    required TResult orElse(),
  }) {
    if (decrementOrderFormQty != null) {
      return decrementOrderFormQty(this);
    }
    return orElse();
  }
}

abstract class DecrementOrderFormReason implements OrderFormReasonState {
  const factory DecrementOrderFormReason(final Map<String, int> qty) =
      _$DecrementOrderFormReasonImpl;

  Map<String, int> get qty;
  @JsonKey(ignore: true)
  _$$DecrementOrderFormReasonImplCopyWith<_$DecrementOrderFormReasonImpl>
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
    extends _$OrderFormReasonStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'OrderFormReasonState.initial()';
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
    required TResult Function(List<ReturnRequestReason> orderFormReasonList)
        loadOrderFormReason,
    required TResult Function(Map<String, int> qty) incrementOrderFormQty,
    required TResult Function(Map<String, int> qty) decrementOrderFormQty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReturnRequestReason> orderFormReasonList)?
        loadOrderFormReason,
    TResult? Function(Map<String, int> qty)? incrementOrderFormQty,
    TResult? Function(Map<String, int> qty)? decrementOrderFormQty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReturnRequestReason> orderFormReasonList)?
        loadOrderFormReason,
    TResult Function(Map<String, int> qty)? incrementOrderFormQty,
    TResult Function(Map<String, int> qty)? decrementOrderFormQty,
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
    required TResult Function(OrderFormReasonList value) loadOrderFormReason,
    required TResult Function(IncrementOrderFormReason value)
        incrementOrderFormQty,
    required TResult Function(DecrementOrderFormReason value)
        decrementOrderFormQty,
    required TResult Function(Initial value) initial,
    required TResult Function(OrderFormReasonLoading value) loading,
    required TResult Function(OrderFormReasonError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderFormReasonList value)? loadOrderFormReason,
    TResult? Function(IncrementOrderFormReason value)? incrementOrderFormQty,
    TResult? Function(DecrementOrderFormReason value)? decrementOrderFormQty,
    TResult? Function(Initial value)? initial,
    TResult? Function(OrderFormReasonLoading value)? loading,
    TResult? Function(OrderFormReasonError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderFormReasonList value)? loadOrderFormReason,
    TResult Function(IncrementOrderFormReason value)? incrementOrderFormQty,
    TResult Function(DecrementOrderFormReason value)? decrementOrderFormQty,
    TResult Function(Initial value)? initial,
    TResult Function(OrderFormReasonLoading value)? loading,
    TResult Function(OrderFormReasonError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements OrderFormReasonState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$OrderFormReasonLoadingImplCopyWith<$Res> {
  factory _$$OrderFormReasonLoadingImplCopyWith(
          _$OrderFormReasonLoadingImpl value,
          $Res Function(_$OrderFormReasonLoadingImpl) then) =
      __$$OrderFormReasonLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderFormReasonLoadingImplCopyWithImpl<$Res>
    extends _$OrderFormReasonStateCopyWithImpl<$Res,
        _$OrderFormReasonLoadingImpl>
    implements _$$OrderFormReasonLoadingImplCopyWith<$Res> {
  __$$OrderFormReasonLoadingImplCopyWithImpl(
      _$OrderFormReasonLoadingImpl _value,
      $Res Function(_$OrderFormReasonLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderFormReasonLoadingImpl implements OrderFormReasonLoading {
  const _$OrderFormReasonLoadingImpl();

  @override
  String toString() {
    return 'OrderFormReasonState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderFormReasonLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReturnRequestReason> orderFormReasonList)
        loadOrderFormReason,
    required TResult Function(Map<String, int> qty) incrementOrderFormQty,
    required TResult Function(Map<String, int> qty) decrementOrderFormQty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReturnRequestReason> orderFormReasonList)?
        loadOrderFormReason,
    TResult? Function(Map<String, int> qty)? incrementOrderFormQty,
    TResult? Function(Map<String, int> qty)? decrementOrderFormQty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReturnRequestReason> orderFormReasonList)?
        loadOrderFormReason,
    TResult Function(Map<String, int> qty)? incrementOrderFormQty,
    TResult Function(Map<String, int> qty)? decrementOrderFormQty,
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
    required TResult Function(OrderFormReasonList value) loadOrderFormReason,
    required TResult Function(IncrementOrderFormReason value)
        incrementOrderFormQty,
    required TResult Function(DecrementOrderFormReason value)
        decrementOrderFormQty,
    required TResult Function(Initial value) initial,
    required TResult Function(OrderFormReasonLoading value) loading,
    required TResult Function(OrderFormReasonError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderFormReasonList value)? loadOrderFormReason,
    TResult? Function(IncrementOrderFormReason value)? incrementOrderFormQty,
    TResult? Function(DecrementOrderFormReason value)? decrementOrderFormQty,
    TResult? Function(Initial value)? initial,
    TResult? Function(OrderFormReasonLoading value)? loading,
    TResult? Function(OrderFormReasonError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderFormReasonList value)? loadOrderFormReason,
    TResult Function(IncrementOrderFormReason value)? incrementOrderFormQty,
    TResult Function(DecrementOrderFormReason value)? decrementOrderFormQty,
    TResult Function(Initial value)? initial,
    TResult Function(OrderFormReasonLoading value)? loading,
    TResult Function(OrderFormReasonError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OrderFormReasonLoading implements OrderFormReasonState {
  const factory OrderFormReasonLoading() = _$OrderFormReasonLoadingImpl;
}

/// @nodoc
abstract class _$$OrderFormReasonErrorImplCopyWith<$Res> {
  factory _$$OrderFormReasonErrorImplCopyWith(_$OrderFormReasonErrorImpl value,
          $Res Function(_$OrderFormReasonErrorImpl) then) =
      __$$OrderFormReasonErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$OrderFormReasonErrorImplCopyWithImpl<$Res>
    extends _$OrderFormReasonStateCopyWithImpl<$Res, _$OrderFormReasonErrorImpl>
    implements _$$OrderFormReasonErrorImplCopyWith<$Res> {
  __$$OrderFormReasonErrorImplCopyWithImpl(_$OrderFormReasonErrorImpl _value,
      $Res Function(_$OrderFormReasonErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$OrderFormReasonErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OrderFormReasonErrorImpl implements OrderFormReasonError {
  const _$OrderFormReasonErrorImpl({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'OrderFormReasonState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderFormReasonErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderFormReasonErrorImplCopyWith<_$OrderFormReasonErrorImpl>
      get copyWith =>
          __$$OrderFormReasonErrorImplCopyWithImpl<_$OrderFormReasonErrorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReturnRequestReason> orderFormReasonList)
        loadOrderFormReason,
    required TResult Function(Map<String, int> qty) incrementOrderFormQty,
    required TResult Function(Map<String, int> qty) decrementOrderFormQty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReturnRequestReason> orderFormReasonList)?
        loadOrderFormReason,
    TResult? Function(Map<String, int> qty)? incrementOrderFormQty,
    TResult? Function(Map<String, int> qty)? decrementOrderFormQty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReturnRequestReason> orderFormReasonList)?
        loadOrderFormReason,
    TResult Function(Map<String, int> qty)? incrementOrderFormQty,
    TResult Function(Map<String, int> qty)? decrementOrderFormQty,
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
    required TResult Function(OrderFormReasonList value) loadOrderFormReason,
    required TResult Function(IncrementOrderFormReason value)
        incrementOrderFormQty,
    required TResult Function(DecrementOrderFormReason value)
        decrementOrderFormQty,
    required TResult Function(Initial value) initial,
    required TResult Function(OrderFormReasonLoading value) loading,
    required TResult Function(OrderFormReasonError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderFormReasonList value)? loadOrderFormReason,
    TResult? Function(IncrementOrderFormReason value)? incrementOrderFormQty,
    TResult? Function(DecrementOrderFormReason value)? decrementOrderFormQty,
    TResult? Function(Initial value)? initial,
    TResult? Function(OrderFormReasonLoading value)? loading,
    TResult? Function(OrderFormReasonError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderFormReasonList value)? loadOrderFormReason,
    TResult Function(IncrementOrderFormReason value)? incrementOrderFormQty,
    TResult Function(DecrementOrderFormReason value)? decrementOrderFormQty,
    TResult Function(Initial value)? initial,
    TResult Function(OrderFormReasonLoading value)? loading,
    TResult Function(OrderFormReasonError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OrderFormReasonError implements OrderFormReasonState {
  const factory OrderFormReasonError({final String? error}) =
      _$OrderFormReasonErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$OrderFormReasonErrorImplCopyWith<_$OrderFormReasonErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
