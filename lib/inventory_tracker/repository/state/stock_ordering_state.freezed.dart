// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_ordering_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StockOrderingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StockOrder> stockOrdering) loadStockOrdering,
    required TResult Function(Map<int, int> qty) incrementStockOrderQty,
    required TResult Function(Map<int, int> qty) decremenStockOrderQty,
    required TResult Function(List<Map<String, dynamic>> orderLine) addOrder,
    required TResult Function(Map<String, Map<String, dynamic>> checkoutMap)
        checkOut,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult? Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult? Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult? Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult? Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockOrderingList value) loadStockOrdering,
    required TResult Function(IncrementStockOrderQty value)
        incrementStockOrderQty,
    required TResult Function(DecrementStockOrderQty value)
        decremenStockOrderQty,
    required TResult Function(OrderLines value) addOrder,
    required TResult Function(CheckOutMap value) checkOut,
    required TResult Function(Initial value) initial,
    required TResult Function(StockOrderingLoading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockOrderingList value)? loadStockOrdering,
    TResult? Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult? Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult? Function(OrderLines value)? addOrder,
    TResult? Function(CheckOutMap value)? checkOut,
    TResult? Function(Initial value)? initial,
    TResult? Function(StockOrderingLoading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockOrderingList value)? loadStockOrdering,
    TResult Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult Function(OrderLines value)? addOrder,
    TResult Function(CheckOutMap value)? checkOut,
    TResult Function(Initial value)? initial,
    TResult Function(StockOrderingLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockOrderingStateCopyWith<$Res> {
  factory $StockOrderingStateCopyWith(
          StockOrderingState value, $Res Function(StockOrderingState) then) =
      _$StockOrderingStateCopyWithImpl<$Res, StockOrderingState>;
}

/// @nodoc
class _$StockOrderingStateCopyWithImpl<$Res, $Val extends StockOrderingState>
    implements $StockOrderingStateCopyWith<$Res> {
  _$StockOrderingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StockOrderingListImplCopyWith<$Res> {
  factory _$$StockOrderingListImplCopyWith(_$StockOrderingListImpl value,
          $Res Function(_$StockOrderingListImpl) then) =
      __$$StockOrderingListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<StockOrder> stockOrdering});
}

/// @nodoc
class __$$StockOrderingListImplCopyWithImpl<$Res>
    extends _$StockOrderingStateCopyWithImpl<$Res, _$StockOrderingListImpl>
    implements _$$StockOrderingListImplCopyWith<$Res> {
  __$$StockOrderingListImplCopyWithImpl(_$StockOrderingListImpl _value,
      $Res Function(_$StockOrderingListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stockOrdering = null,
  }) {
    return _then(_$StockOrderingListImpl(
      null == stockOrdering
          ? _value._stockOrdering
          : stockOrdering // ignore: cast_nullable_to_non_nullable
              as List<StockOrder>,
    ));
  }
}

/// @nodoc

class _$StockOrderingListImpl implements StockOrderingList {
  const _$StockOrderingListImpl(final List<StockOrder> stockOrdering)
      : _stockOrdering = stockOrdering;

  final List<StockOrder> _stockOrdering;
  @override
  List<StockOrder> get stockOrdering {
    if (_stockOrdering is EqualUnmodifiableListView) return _stockOrdering;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stockOrdering);
  }

  @override
  String toString() {
    return 'StockOrderingState.loadStockOrdering(stockOrdering: $stockOrdering)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockOrderingListImpl &&
            const DeepCollectionEquality()
                .equals(other._stockOrdering, _stockOrdering));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_stockOrdering));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockOrderingListImplCopyWith<_$StockOrderingListImpl> get copyWith =>
      __$$StockOrderingListImplCopyWithImpl<_$StockOrderingListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StockOrder> stockOrdering) loadStockOrdering,
    required TResult Function(Map<int, int> qty) incrementStockOrderQty,
    required TResult Function(Map<int, int> qty) decremenStockOrderQty,
    required TResult Function(List<Map<String, dynamic>> orderLine) addOrder,
    required TResult Function(Map<String, Map<String, dynamic>> checkoutMap)
        checkOut,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadStockOrdering(stockOrdering);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult? Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult? Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult? Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult? Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadStockOrdering?.call(stockOrdering);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadStockOrdering != null) {
      return loadStockOrdering(stockOrdering);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockOrderingList value) loadStockOrdering,
    required TResult Function(IncrementStockOrderQty value)
        incrementStockOrderQty,
    required TResult Function(DecrementStockOrderQty value)
        decremenStockOrderQty,
    required TResult Function(OrderLines value) addOrder,
    required TResult Function(CheckOutMap value) checkOut,
    required TResult Function(Initial value) initial,
    required TResult Function(StockOrderingLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadStockOrdering(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockOrderingList value)? loadStockOrdering,
    TResult? Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult? Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult? Function(OrderLines value)? addOrder,
    TResult? Function(CheckOutMap value)? checkOut,
    TResult? Function(Initial value)? initial,
    TResult? Function(StockOrderingLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadStockOrdering?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockOrderingList value)? loadStockOrdering,
    TResult Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult Function(OrderLines value)? addOrder,
    TResult Function(CheckOutMap value)? checkOut,
    TResult Function(Initial value)? initial,
    TResult Function(StockOrderingLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadStockOrdering != null) {
      return loadStockOrdering(this);
    }
    return orElse();
  }
}

abstract class StockOrderingList implements StockOrderingState {
  const factory StockOrderingList(final List<StockOrder> stockOrdering) =
      _$StockOrderingListImpl;

  List<StockOrder> get stockOrdering;
  @JsonKey(ignore: true)
  _$$StockOrderingListImplCopyWith<_$StockOrderingListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncrementStockOrderQtyImplCopyWith<$Res> {
  factory _$$IncrementStockOrderQtyImplCopyWith(
          _$IncrementStockOrderQtyImpl value,
          $Res Function(_$IncrementStockOrderQtyImpl) then) =
      __$$IncrementStockOrderQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<int, int> qty});
}

/// @nodoc
class __$$IncrementStockOrderQtyImplCopyWithImpl<$Res>
    extends _$StockOrderingStateCopyWithImpl<$Res, _$IncrementStockOrderQtyImpl>
    implements _$$IncrementStockOrderQtyImplCopyWith<$Res> {
  __$$IncrementStockOrderQtyImplCopyWithImpl(
      _$IncrementStockOrderQtyImpl _value,
      $Res Function(_$IncrementStockOrderQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
  }) {
    return _then(_$IncrementStockOrderQtyImpl(
      null == qty
          ? _value._qty
          : qty // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ));
  }
}

/// @nodoc

class _$IncrementStockOrderQtyImpl implements IncrementStockOrderQty {
  const _$IncrementStockOrderQtyImpl(final Map<int, int> qty) : _qty = qty;

  final Map<int, int> _qty;
  @override
  Map<int, int> get qty {
    if (_qty is EqualUnmodifiableMapView) return _qty;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_qty);
  }

  @override
  String toString() {
    return 'StockOrderingState.incrementStockOrderQty(qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncrementStockOrderQtyImpl &&
            const DeepCollectionEquality().equals(other._qty, _qty));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_qty));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncrementStockOrderQtyImplCopyWith<_$IncrementStockOrderQtyImpl>
      get copyWith => __$$IncrementStockOrderQtyImplCopyWithImpl<
          _$IncrementStockOrderQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StockOrder> stockOrdering) loadStockOrdering,
    required TResult Function(Map<int, int> qty) incrementStockOrderQty,
    required TResult Function(Map<int, int> qty) decremenStockOrderQty,
    required TResult Function(List<Map<String, dynamic>> orderLine) addOrder,
    required TResult Function(Map<String, Map<String, dynamic>> checkoutMap)
        checkOut,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return incrementStockOrderQty(qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult? Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult? Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult? Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult? Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return incrementStockOrderQty?.call(qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (incrementStockOrderQty != null) {
      return incrementStockOrderQty(qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockOrderingList value) loadStockOrdering,
    required TResult Function(IncrementStockOrderQty value)
        incrementStockOrderQty,
    required TResult Function(DecrementStockOrderQty value)
        decremenStockOrderQty,
    required TResult Function(OrderLines value) addOrder,
    required TResult Function(CheckOutMap value) checkOut,
    required TResult Function(Initial value) initial,
    required TResult Function(StockOrderingLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return incrementStockOrderQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockOrderingList value)? loadStockOrdering,
    TResult? Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult? Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult? Function(OrderLines value)? addOrder,
    TResult? Function(CheckOutMap value)? checkOut,
    TResult? Function(Initial value)? initial,
    TResult? Function(StockOrderingLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return incrementStockOrderQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockOrderingList value)? loadStockOrdering,
    TResult Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult Function(OrderLines value)? addOrder,
    TResult Function(CheckOutMap value)? checkOut,
    TResult Function(Initial value)? initial,
    TResult Function(StockOrderingLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (incrementStockOrderQty != null) {
      return incrementStockOrderQty(this);
    }
    return orElse();
  }
}

abstract class IncrementStockOrderQty implements StockOrderingState {
  const factory IncrementStockOrderQty(final Map<int, int> qty) =
      _$IncrementStockOrderQtyImpl;

  Map<int, int> get qty;
  @JsonKey(ignore: true)
  _$$IncrementStockOrderQtyImplCopyWith<_$IncrementStockOrderQtyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecrementStockOrderQtyImplCopyWith<$Res> {
  factory _$$DecrementStockOrderQtyImplCopyWith(
          _$DecrementStockOrderQtyImpl value,
          $Res Function(_$DecrementStockOrderQtyImpl) then) =
      __$$DecrementStockOrderQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<int, int> qty});
}

/// @nodoc
class __$$DecrementStockOrderQtyImplCopyWithImpl<$Res>
    extends _$StockOrderingStateCopyWithImpl<$Res, _$DecrementStockOrderQtyImpl>
    implements _$$DecrementStockOrderQtyImplCopyWith<$Res> {
  __$$DecrementStockOrderQtyImplCopyWithImpl(
      _$DecrementStockOrderQtyImpl _value,
      $Res Function(_$DecrementStockOrderQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
  }) {
    return _then(_$DecrementStockOrderQtyImpl(
      null == qty
          ? _value._qty
          : qty // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ));
  }
}

/// @nodoc

class _$DecrementStockOrderQtyImpl implements DecrementStockOrderQty {
  const _$DecrementStockOrderQtyImpl(final Map<int, int> qty) : _qty = qty;

  final Map<int, int> _qty;
  @override
  Map<int, int> get qty {
    if (_qty is EqualUnmodifiableMapView) return _qty;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_qty);
  }

  @override
  String toString() {
    return 'StockOrderingState.decremenStockOrderQty(qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecrementStockOrderQtyImpl &&
            const DeepCollectionEquality().equals(other._qty, _qty));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_qty));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecrementStockOrderQtyImplCopyWith<_$DecrementStockOrderQtyImpl>
      get copyWith => __$$DecrementStockOrderQtyImplCopyWithImpl<
          _$DecrementStockOrderQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StockOrder> stockOrdering) loadStockOrdering,
    required TResult Function(Map<int, int> qty) incrementStockOrderQty,
    required TResult Function(Map<int, int> qty) decremenStockOrderQty,
    required TResult Function(List<Map<String, dynamic>> orderLine) addOrder,
    required TResult Function(Map<String, Map<String, dynamic>> checkoutMap)
        checkOut,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return decremenStockOrderQty(qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult? Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult? Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult? Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult? Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return decremenStockOrderQty?.call(qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (decremenStockOrderQty != null) {
      return decremenStockOrderQty(qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockOrderingList value) loadStockOrdering,
    required TResult Function(IncrementStockOrderQty value)
        incrementStockOrderQty,
    required TResult Function(DecrementStockOrderQty value)
        decremenStockOrderQty,
    required TResult Function(OrderLines value) addOrder,
    required TResult Function(CheckOutMap value) checkOut,
    required TResult Function(Initial value) initial,
    required TResult Function(StockOrderingLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return decremenStockOrderQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockOrderingList value)? loadStockOrdering,
    TResult? Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult? Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult? Function(OrderLines value)? addOrder,
    TResult? Function(CheckOutMap value)? checkOut,
    TResult? Function(Initial value)? initial,
    TResult? Function(StockOrderingLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return decremenStockOrderQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockOrderingList value)? loadStockOrdering,
    TResult Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult Function(OrderLines value)? addOrder,
    TResult Function(CheckOutMap value)? checkOut,
    TResult Function(Initial value)? initial,
    TResult Function(StockOrderingLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (decremenStockOrderQty != null) {
      return decremenStockOrderQty(this);
    }
    return orElse();
  }
}

abstract class DecrementStockOrderQty implements StockOrderingState {
  const factory DecrementStockOrderQty(final Map<int, int> qty) =
      _$DecrementStockOrderQtyImpl;

  Map<int, int> get qty;
  @JsonKey(ignore: true)
  _$$DecrementStockOrderQtyImplCopyWith<_$DecrementStockOrderQtyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderLinesImplCopyWith<$Res> {
  factory _$$OrderLinesImplCopyWith(
          _$OrderLinesImpl value, $Res Function(_$OrderLinesImpl) then) =
      __$$OrderLinesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> orderLine});
}

/// @nodoc
class __$$OrderLinesImplCopyWithImpl<$Res>
    extends _$StockOrderingStateCopyWithImpl<$Res, _$OrderLinesImpl>
    implements _$$OrderLinesImplCopyWith<$Res> {
  __$$OrderLinesImplCopyWithImpl(
      _$OrderLinesImpl _value, $Res Function(_$OrderLinesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderLine = null,
  }) {
    return _then(_$OrderLinesImpl(
      null == orderLine
          ? _value._orderLine
          : orderLine // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$OrderLinesImpl implements OrderLines {
  const _$OrderLinesImpl(final List<Map<String, dynamic>> orderLine)
      : _orderLine = orderLine;

  final List<Map<String, dynamic>> _orderLine;
  @override
  List<Map<String, dynamic>> get orderLine {
    if (_orderLine is EqualUnmodifiableListView) return _orderLine;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderLine);
  }

  @override
  String toString() {
    return 'StockOrderingState.addOrder(orderLine: $orderLine)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderLinesImpl &&
            const DeepCollectionEquality()
                .equals(other._orderLine, _orderLine));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orderLine));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderLinesImplCopyWith<_$OrderLinesImpl> get copyWith =>
      __$$OrderLinesImplCopyWithImpl<_$OrderLinesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StockOrder> stockOrdering) loadStockOrdering,
    required TResult Function(Map<int, int> qty) incrementStockOrderQty,
    required TResult Function(Map<int, int> qty) decremenStockOrderQty,
    required TResult Function(List<Map<String, dynamic>> orderLine) addOrder,
    required TResult Function(Map<String, Map<String, dynamic>> checkoutMap)
        checkOut,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return addOrder(orderLine);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult? Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult? Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult? Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult? Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return addOrder?.call(orderLine);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (addOrder != null) {
      return addOrder(orderLine);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockOrderingList value) loadStockOrdering,
    required TResult Function(IncrementStockOrderQty value)
        incrementStockOrderQty,
    required TResult Function(DecrementStockOrderQty value)
        decremenStockOrderQty,
    required TResult Function(OrderLines value) addOrder,
    required TResult Function(CheckOutMap value) checkOut,
    required TResult Function(Initial value) initial,
    required TResult Function(StockOrderingLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return addOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockOrderingList value)? loadStockOrdering,
    TResult? Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult? Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult? Function(OrderLines value)? addOrder,
    TResult? Function(CheckOutMap value)? checkOut,
    TResult? Function(Initial value)? initial,
    TResult? Function(StockOrderingLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return addOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockOrderingList value)? loadStockOrdering,
    TResult Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult Function(OrderLines value)? addOrder,
    TResult Function(CheckOutMap value)? checkOut,
    TResult Function(Initial value)? initial,
    TResult Function(StockOrderingLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (addOrder != null) {
      return addOrder(this);
    }
    return orElse();
  }
}

abstract class OrderLines implements StockOrderingState {
  const factory OrderLines(final List<Map<String, dynamic>> orderLine) =
      _$OrderLinesImpl;

  List<Map<String, dynamic>> get orderLine;
  @JsonKey(ignore: true)
  _$$OrderLinesImplCopyWith<_$OrderLinesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckOutMapImplCopyWith<$Res> {
  factory _$$CheckOutMapImplCopyWith(
          _$CheckOutMapImpl value, $Res Function(_$CheckOutMapImpl) then) =
      __$$CheckOutMapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, Map<String, dynamic>> checkoutMap});
}

/// @nodoc
class __$$CheckOutMapImplCopyWithImpl<$Res>
    extends _$StockOrderingStateCopyWithImpl<$Res, _$CheckOutMapImpl>
    implements _$$CheckOutMapImplCopyWith<$Res> {
  __$$CheckOutMapImplCopyWithImpl(
      _$CheckOutMapImpl _value, $Res Function(_$CheckOutMapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkoutMap = null,
  }) {
    return _then(_$CheckOutMapImpl(
      null == checkoutMap
          ? _value._checkoutMap
          : checkoutMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$CheckOutMapImpl implements CheckOutMap {
  const _$CheckOutMapImpl(final Map<String, Map<String, dynamic>> checkoutMap)
      : _checkoutMap = checkoutMap;

  final Map<String, Map<String, dynamic>> _checkoutMap;
  @override
  Map<String, Map<String, dynamic>> get checkoutMap {
    if (_checkoutMap is EqualUnmodifiableMapView) return _checkoutMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_checkoutMap);
  }

  @override
  String toString() {
    return 'StockOrderingState.checkOut(checkoutMap: $checkoutMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckOutMapImpl &&
            const DeepCollectionEquality()
                .equals(other._checkoutMap, _checkoutMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_checkoutMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckOutMapImplCopyWith<_$CheckOutMapImpl> get copyWith =>
      __$$CheckOutMapImplCopyWithImpl<_$CheckOutMapImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StockOrder> stockOrdering) loadStockOrdering,
    required TResult Function(Map<int, int> qty) incrementStockOrderQty,
    required TResult Function(Map<int, int> qty) decremenStockOrderQty,
    required TResult Function(List<Map<String, dynamic>> orderLine) addOrder,
    required TResult Function(Map<String, Map<String, dynamic>> checkoutMap)
        checkOut,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return checkOut(checkoutMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult? Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult? Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult? Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult? Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return checkOut?.call(checkoutMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (checkOut != null) {
      return checkOut(checkoutMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockOrderingList value) loadStockOrdering,
    required TResult Function(IncrementStockOrderQty value)
        incrementStockOrderQty,
    required TResult Function(DecrementStockOrderQty value)
        decremenStockOrderQty,
    required TResult Function(OrderLines value) addOrder,
    required TResult Function(CheckOutMap value) checkOut,
    required TResult Function(Initial value) initial,
    required TResult Function(StockOrderingLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return checkOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockOrderingList value)? loadStockOrdering,
    TResult? Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult? Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult? Function(OrderLines value)? addOrder,
    TResult? Function(CheckOutMap value)? checkOut,
    TResult? Function(Initial value)? initial,
    TResult? Function(StockOrderingLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return checkOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockOrderingList value)? loadStockOrdering,
    TResult Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult Function(OrderLines value)? addOrder,
    TResult Function(CheckOutMap value)? checkOut,
    TResult Function(Initial value)? initial,
    TResult Function(StockOrderingLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (checkOut != null) {
      return checkOut(this);
    }
    return orElse();
  }
}

abstract class CheckOutMap implements StockOrderingState {
  const factory CheckOutMap(
      final Map<String, Map<String, dynamic>> checkoutMap) = _$CheckOutMapImpl;

  Map<String, Map<String, dynamic>> get checkoutMap;
  @JsonKey(ignore: true)
  _$$CheckOutMapImplCopyWith<_$CheckOutMapImpl> get copyWith =>
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
    extends _$StockOrderingStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'StockOrderingState.initial()';
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
    required TResult Function(List<StockOrder> stockOrdering) loadStockOrdering,
    required TResult Function(Map<int, int> qty) incrementStockOrderQty,
    required TResult Function(Map<int, int> qty) decremenStockOrderQty,
    required TResult Function(List<Map<String, dynamic>> orderLine) addOrder,
    required TResult Function(Map<String, Map<String, dynamic>> checkoutMap)
        checkOut,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult? Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult? Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult? Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult? Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
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
    required TResult Function(StockOrderingList value) loadStockOrdering,
    required TResult Function(IncrementStockOrderQty value)
        incrementStockOrderQty,
    required TResult Function(DecrementStockOrderQty value)
        decremenStockOrderQty,
    required TResult Function(OrderLines value) addOrder,
    required TResult Function(CheckOutMap value) checkOut,
    required TResult Function(Initial value) initial,
    required TResult Function(StockOrderingLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockOrderingList value)? loadStockOrdering,
    TResult? Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult? Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult? Function(OrderLines value)? addOrder,
    TResult? Function(CheckOutMap value)? checkOut,
    TResult? Function(Initial value)? initial,
    TResult? Function(StockOrderingLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockOrderingList value)? loadStockOrdering,
    TResult Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult Function(OrderLines value)? addOrder,
    TResult Function(CheckOutMap value)? checkOut,
    TResult Function(Initial value)? initial,
    TResult Function(StockOrderingLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements StockOrderingState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$StockOrderingLoadingImplCopyWith<$Res> {
  factory _$$StockOrderingLoadingImplCopyWith(_$StockOrderingLoadingImpl value,
          $Res Function(_$StockOrderingLoadingImpl) then) =
      __$$StockOrderingLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StockOrderingLoadingImplCopyWithImpl<$Res>
    extends _$StockOrderingStateCopyWithImpl<$Res, _$StockOrderingLoadingImpl>
    implements _$$StockOrderingLoadingImplCopyWith<$Res> {
  __$$StockOrderingLoadingImplCopyWithImpl(_$StockOrderingLoadingImpl _value,
      $Res Function(_$StockOrderingLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StockOrderingLoadingImpl implements StockOrderingLoading {
  const _$StockOrderingLoadingImpl();

  @override
  String toString() {
    return 'StockOrderingState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockOrderingLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StockOrder> stockOrdering) loadStockOrdering,
    required TResult Function(Map<int, int> qty) incrementStockOrderQty,
    required TResult Function(Map<int, int> qty) decremenStockOrderQty,
    required TResult Function(List<Map<String, dynamic>> orderLine) addOrder,
    required TResult Function(Map<String, Map<String, dynamic>> checkoutMap)
        checkOut,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult? Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult? Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult? Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult? Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
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
    required TResult Function(StockOrderingList value) loadStockOrdering,
    required TResult Function(IncrementStockOrderQty value)
        incrementStockOrderQty,
    required TResult Function(DecrementStockOrderQty value)
        decremenStockOrderQty,
    required TResult Function(OrderLines value) addOrder,
    required TResult Function(CheckOutMap value) checkOut,
    required TResult Function(Initial value) initial,
    required TResult Function(StockOrderingLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockOrderingList value)? loadStockOrdering,
    TResult? Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult? Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult? Function(OrderLines value)? addOrder,
    TResult? Function(CheckOutMap value)? checkOut,
    TResult? Function(Initial value)? initial,
    TResult? Function(StockOrderingLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockOrderingList value)? loadStockOrdering,
    TResult Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult Function(OrderLines value)? addOrder,
    TResult Function(CheckOutMap value)? checkOut,
    TResult Function(Initial value)? initial,
    TResult Function(StockOrderingLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class StockOrderingLoading implements StockOrderingState {
  const factory StockOrderingLoading() = _$StockOrderingLoadingImpl;
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
    extends _$StockOrderingStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'StockOrderingState.error(error: $error)';
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
    required TResult Function(List<StockOrder> stockOrdering) loadStockOrdering,
    required TResult Function(Map<int, int> qty) incrementStockOrderQty,
    required TResult Function(Map<int, int> qty) decremenStockOrderQty,
    required TResult Function(List<Map<String, dynamic>> orderLine) addOrder,
    required TResult Function(Map<String, Map<String, dynamic>> checkoutMap)
        checkOut,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult? Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult? Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult? Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult? Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult Function(Map<int, int> qty)? incrementStockOrderQty,
    TResult Function(Map<int, int> qty)? decremenStockOrderQty,
    TResult Function(List<Map<String, dynamic>> orderLine)? addOrder,
    TResult Function(Map<String, Map<String, dynamic>> checkoutMap)? checkOut,
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
    required TResult Function(StockOrderingList value) loadStockOrdering,
    required TResult Function(IncrementStockOrderQty value)
        incrementStockOrderQty,
    required TResult Function(DecrementStockOrderQty value)
        decremenStockOrderQty,
    required TResult Function(OrderLines value) addOrder,
    required TResult Function(CheckOutMap value) checkOut,
    required TResult Function(Initial value) initial,
    required TResult Function(StockOrderingLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockOrderingList value)? loadStockOrdering,
    TResult? Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult? Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult? Function(OrderLines value)? addOrder,
    TResult? Function(CheckOutMap value)? checkOut,
    TResult? Function(Initial value)? initial,
    TResult? Function(StockOrderingLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockOrderingList value)? loadStockOrdering,
    TResult Function(IncrementStockOrderQty value)? incrementStockOrderQty,
    TResult Function(DecrementStockOrderQty value)? decremenStockOrderQty,
    TResult Function(OrderLines value)? addOrder,
    TResult Function(CheckOutMap value)? checkOut,
    TResult Function(Initial value)? initial,
    TResult Function(StockOrderingLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements StockOrderingState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}