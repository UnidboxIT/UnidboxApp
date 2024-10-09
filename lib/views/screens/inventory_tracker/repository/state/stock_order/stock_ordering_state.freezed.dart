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
    required TResult Function(List<OrderReceiving> orderFormDataList)
        loadPendingReceivingData,
    required TResult Function(
            Map<String, List<Map<String, dynamic>>> checkoutMap)
        backupCheckOut,
    required TResult Function(Map<int, int> totalQty) clearTotalQty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult? Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult? Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult? Function(Map<int, int> totalQty)? clearTotalQty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult Function(Map<int, int> totalQty)? clearTotalQty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockOrderingList value) loadStockOrdering,
    required TResult Function(OrderFormDataList value) loadPendingReceivingData,
    required TResult Function(BackupCheckOut value) backupCheckOut,
    required TResult Function(ClearTotalQty value) clearTotalQty,
    required TResult Function(Initial value) initial,
    required TResult Function(StockOrderingLoading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockOrderingList value)? loadStockOrdering,
    TResult? Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult? Function(BackupCheckOut value)? backupCheckOut,
    TResult? Function(ClearTotalQty value)? clearTotalQty,
    TResult? Function(Initial value)? initial,
    TResult? Function(StockOrderingLoading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockOrderingList value)? loadStockOrdering,
    TResult Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult Function(BackupCheckOut value)? backupCheckOut,
    TResult Function(ClearTotalQty value)? clearTotalQty,
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
    required TResult Function(List<OrderReceiving> orderFormDataList)
        loadPendingReceivingData,
    required TResult Function(
            Map<String, List<Map<String, dynamic>>> checkoutMap)
        backupCheckOut,
    required TResult Function(Map<int, int> totalQty) clearTotalQty,
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
    TResult? Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult? Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult? Function(Map<int, int> totalQty)? clearTotalQty,
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
    TResult Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult Function(Map<int, int> totalQty)? clearTotalQty,
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
    required TResult Function(OrderFormDataList value) loadPendingReceivingData,
    required TResult Function(BackupCheckOut value) backupCheckOut,
    required TResult Function(ClearTotalQty value) clearTotalQty,
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
    TResult? Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult? Function(BackupCheckOut value)? backupCheckOut,
    TResult? Function(ClearTotalQty value)? clearTotalQty,
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
    TResult Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult Function(BackupCheckOut value)? backupCheckOut,
    TResult Function(ClearTotalQty value)? clearTotalQty,
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
abstract class _$$OrderFormDataListImplCopyWith<$Res> {
  factory _$$OrderFormDataListImplCopyWith(_$OrderFormDataListImpl value,
          $Res Function(_$OrderFormDataListImpl) then) =
      __$$OrderFormDataListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OrderReceiving> orderFormDataList});
}

/// @nodoc
class __$$OrderFormDataListImplCopyWithImpl<$Res>
    extends _$StockOrderingStateCopyWithImpl<$Res, _$OrderFormDataListImpl>
    implements _$$OrderFormDataListImplCopyWith<$Res> {
  __$$OrderFormDataListImplCopyWithImpl(_$OrderFormDataListImpl _value,
      $Res Function(_$OrderFormDataListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderFormDataList = null,
  }) {
    return _then(_$OrderFormDataListImpl(
      null == orderFormDataList
          ? _value._orderFormDataList
          : orderFormDataList // ignore: cast_nullable_to_non_nullable
              as List<OrderReceiving>,
    ));
  }
}

/// @nodoc

class _$OrderFormDataListImpl implements OrderFormDataList {
  const _$OrderFormDataListImpl(final List<OrderReceiving> orderFormDataList)
      : _orderFormDataList = orderFormDataList;

  final List<OrderReceiving> _orderFormDataList;
  @override
  List<OrderReceiving> get orderFormDataList {
    if (_orderFormDataList is EqualUnmodifiableListView)
      return _orderFormDataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderFormDataList);
  }

  @override
  String toString() {
    return 'StockOrderingState.loadPendingReceivingData(orderFormDataList: $orderFormDataList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderFormDataListImpl &&
            const DeepCollectionEquality()
                .equals(other._orderFormDataList, _orderFormDataList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_orderFormDataList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderFormDataListImplCopyWith<_$OrderFormDataListImpl> get copyWith =>
      __$$OrderFormDataListImplCopyWithImpl<_$OrderFormDataListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StockOrder> stockOrdering) loadStockOrdering,
    required TResult Function(List<OrderReceiving> orderFormDataList)
        loadPendingReceivingData,
    required TResult Function(
            Map<String, List<Map<String, dynamic>>> checkoutMap)
        backupCheckOut,
    required TResult Function(Map<int, int> totalQty) clearTotalQty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadPendingReceivingData(orderFormDataList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult? Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult? Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult? Function(Map<int, int> totalQty)? clearTotalQty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadPendingReceivingData?.call(orderFormDataList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult Function(Map<int, int> totalQty)? clearTotalQty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadPendingReceivingData != null) {
      return loadPendingReceivingData(orderFormDataList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockOrderingList value) loadStockOrdering,
    required TResult Function(OrderFormDataList value) loadPendingReceivingData,
    required TResult Function(BackupCheckOut value) backupCheckOut,
    required TResult Function(ClearTotalQty value) clearTotalQty,
    required TResult Function(Initial value) initial,
    required TResult Function(StockOrderingLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadPendingReceivingData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockOrderingList value)? loadStockOrdering,
    TResult? Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult? Function(BackupCheckOut value)? backupCheckOut,
    TResult? Function(ClearTotalQty value)? clearTotalQty,
    TResult? Function(Initial value)? initial,
    TResult? Function(StockOrderingLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadPendingReceivingData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockOrderingList value)? loadStockOrdering,
    TResult Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult Function(BackupCheckOut value)? backupCheckOut,
    TResult Function(ClearTotalQty value)? clearTotalQty,
    TResult Function(Initial value)? initial,
    TResult Function(StockOrderingLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadPendingReceivingData != null) {
      return loadPendingReceivingData(this);
    }
    return orElse();
  }
}

abstract class OrderFormDataList implements StockOrderingState {
  const factory OrderFormDataList(
      final List<OrderReceiving> orderFormDataList) = _$OrderFormDataListImpl;

  List<OrderReceiving> get orderFormDataList;
  @JsonKey(ignore: true)
  _$$OrderFormDataListImplCopyWith<_$OrderFormDataListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BackupCheckOutImplCopyWith<$Res> {
  factory _$$BackupCheckOutImplCopyWith(_$BackupCheckOutImpl value,
          $Res Function(_$BackupCheckOutImpl) then) =
      __$$BackupCheckOutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, List<Map<String, dynamic>>> checkoutMap});
}

/// @nodoc
class __$$BackupCheckOutImplCopyWithImpl<$Res>
    extends _$StockOrderingStateCopyWithImpl<$Res, _$BackupCheckOutImpl>
    implements _$$BackupCheckOutImplCopyWith<$Res> {
  __$$BackupCheckOutImplCopyWithImpl(
      _$BackupCheckOutImpl _value, $Res Function(_$BackupCheckOutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkoutMap = null,
  }) {
    return _then(_$BackupCheckOutImpl(
      null == checkoutMap
          ? _value._checkoutMap
          : checkoutMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Map<String, dynamic>>>,
    ));
  }
}

/// @nodoc

class _$BackupCheckOutImpl implements BackupCheckOut {
  const _$BackupCheckOutImpl(
      final Map<String, List<Map<String, dynamic>>> checkoutMap)
      : _checkoutMap = checkoutMap;

  final Map<String, List<Map<String, dynamic>>> _checkoutMap;
  @override
  Map<String, List<Map<String, dynamic>>> get checkoutMap {
    if (_checkoutMap is EqualUnmodifiableMapView) return _checkoutMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_checkoutMap);
  }

  @override
  String toString() {
    return 'StockOrderingState.backupCheckOut(checkoutMap: $checkoutMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackupCheckOutImpl &&
            const DeepCollectionEquality()
                .equals(other._checkoutMap, _checkoutMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_checkoutMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BackupCheckOutImplCopyWith<_$BackupCheckOutImpl> get copyWith =>
      __$$BackupCheckOutImplCopyWithImpl<_$BackupCheckOutImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StockOrder> stockOrdering) loadStockOrdering,
    required TResult Function(List<OrderReceiving> orderFormDataList)
        loadPendingReceivingData,
    required TResult Function(
            Map<String, List<Map<String, dynamic>>> checkoutMap)
        backupCheckOut,
    required TResult Function(Map<int, int> totalQty) clearTotalQty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return backupCheckOut(checkoutMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult? Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult? Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult? Function(Map<int, int> totalQty)? clearTotalQty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return backupCheckOut?.call(checkoutMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult Function(Map<int, int> totalQty)? clearTotalQty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (backupCheckOut != null) {
      return backupCheckOut(checkoutMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockOrderingList value) loadStockOrdering,
    required TResult Function(OrderFormDataList value) loadPendingReceivingData,
    required TResult Function(BackupCheckOut value) backupCheckOut,
    required TResult Function(ClearTotalQty value) clearTotalQty,
    required TResult Function(Initial value) initial,
    required TResult Function(StockOrderingLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return backupCheckOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockOrderingList value)? loadStockOrdering,
    TResult? Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult? Function(BackupCheckOut value)? backupCheckOut,
    TResult? Function(ClearTotalQty value)? clearTotalQty,
    TResult? Function(Initial value)? initial,
    TResult? Function(StockOrderingLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return backupCheckOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockOrderingList value)? loadStockOrdering,
    TResult Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult Function(BackupCheckOut value)? backupCheckOut,
    TResult Function(ClearTotalQty value)? clearTotalQty,
    TResult Function(Initial value)? initial,
    TResult Function(StockOrderingLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (backupCheckOut != null) {
      return backupCheckOut(this);
    }
    return orElse();
  }
}

abstract class BackupCheckOut implements StockOrderingState {
  const factory BackupCheckOut(
          final Map<String, List<Map<String, dynamic>>> checkoutMap) =
      _$BackupCheckOutImpl;

  Map<String, List<Map<String, dynamic>>> get checkoutMap;
  @JsonKey(ignore: true)
  _$$BackupCheckOutImplCopyWith<_$BackupCheckOutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearTotalQtyImplCopyWith<$Res> {
  factory _$$ClearTotalQtyImplCopyWith(
          _$ClearTotalQtyImpl value, $Res Function(_$ClearTotalQtyImpl) then) =
      __$$ClearTotalQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<int, int> totalQty});
}

/// @nodoc
class __$$ClearTotalQtyImplCopyWithImpl<$Res>
    extends _$StockOrderingStateCopyWithImpl<$Res, _$ClearTotalQtyImpl>
    implements _$$ClearTotalQtyImplCopyWith<$Res> {
  __$$ClearTotalQtyImplCopyWithImpl(
      _$ClearTotalQtyImpl _value, $Res Function(_$ClearTotalQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQty = null,
  }) {
    return _then(_$ClearTotalQtyImpl(
      null == totalQty
          ? _value._totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ));
  }
}

/// @nodoc

class _$ClearTotalQtyImpl implements ClearTotalQty {
  const _$ClearTotalQtyImpl(final Map<int, int> totalQty)
      : _totalQty = totalQty;

  final Map<int, int> _totalQty;
  @override
  Map<int, int> get totalQty {
    if (_totalQty is EqualUnmodifiableMapView) return _totalQty;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_totalQty);
  }

  @override
  String toString() {
    return 'StockOrderingState.clearTotalQty(totalQty: $totalQty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearTotalQtyImpl &&
            const DeepCollectionEquality().equals(other._totalQty, _totalQty));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_totalQty));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClearTotalQtyImplCopyWith<_$ClearTotalQtyImpl> get copyWith =>
      __$$ClearTotalQtyImplCopyWithImpl<_$ClearTotalQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<StockOrder> stockOrdering) loadStockOrdering,
    required TResult Function(List<OrderReceiving> orderFormDataList)
        loadPendingReceivingData,
    required TResult Function(
            Map<String, List<Map<String, dynamic>>> checkoutMap)
        backupCheckOut,
    required TResult Function(Map<int, int> totalQty) clearTotalQty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return clearTotalQty(totalQty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult? Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult? Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult? Function(Map<int, int> totalQty)? clearTotalQty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return clearTotalQty?.call(totalQty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<StockOrder> stockOrdering)? loadStockOrdering,
    TResult Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult Function(Map<int, int> totalQty)? clearTotalQty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (clearTotalQty != null) {
      return clearTotalQty(totalQty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StockOrderingList value) loadStockOrdering,
    required TResult Function(OrderFormDataList value) loadPendingReceivingData,
    required TResult Function(BackupCheckOut value) backupCheckOut,
    required TResult Function(ClearTotalQty value) clearTotalQty,
    required TResult Function(Initial value) initial,
    required TResult Function(StockOrderingLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return clearTotalQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StockOrderingList value)? loadStockOrdering,
    TResult? Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult? Function(BackupCheckOut value)? backupCheckOut,
    TResult? Function(ClearTotalQty value)? clearTotalQty,
    TResult? Function(Initial value)? initial,
    TResult? Function(StockOrderingLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return clearTotalQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StockOrderingList value)? loadStockOrdering,
    TResult Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult Function(BackupCheckOut value)? backupCheckOut,
    TResult Function(ClearTotalQty value)? clearTotalQty,
    TResult Function(Initial value)? initial,
    TResult Function(StockOrderingLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (clearTotalQty != null) {
      return clearTotalQty(this);
    }
    return orElse();
  }
}

abstract class ClearTotalQty implements StockOrderingState {
  const factory ClearTotalQty(final Map<int, int> totalQty) =
      _$ClearTotalQtyImpl;

  Map<int, int> get totalQty;
  @JsonKey(ignore: true)
  _$$ClearTotalQtyImplCopyWith<_$ClearTotalQtyImpl> get copyWith =>
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
    required TResult Function(List<OrderReceiving> orderFormDataList)
        loadPendingReceivingData,
    required TResult Function(
            Map<String, List<Map<String, dynamic>>> checkoutMap)
        backupCheckOut,
    required TResult Function(Map<int, int> totalQty) clearTotalQty,
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
    TResult? Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult? Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult? Function(Map<int, int> totalQty)? clearTotalQty,
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
    TResult Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult Function(Map<int, int> totalQty)? clearTotalQty,
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
    required TResult Function(OrderFormDataList value) loadPendingReceivingData,
    required TResult Function(BackupCheckOut value) backupCheckOut,
    required TResult Function(ClearTotalQty value) clearTotalQty,
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
    TResult? Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult? Function(BackupCheckOut value)? backupCheckOut,
    TResult? Function(ClearTotalQty value)? clearTotalQty,
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
    TResult Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult Function(BackupCheckOut value)? backupCheckOut,
    TResult Function(ClearTotalQty value)? clearTotalQty,
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
    required TResult Function(List<OrderReceiving> orderFormDataList)
        loadPendingReceivingData,
    required TResult Function(
            Map<String, List<Map<String, dynamic>>> checkoutMap)
        backupCheckOut,
    required TResult Function(Map<int, int> totalQty) clearTotalQty,
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
    TResult? Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult? Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult? Function(Map<int, int> totalQty)? clearTotalQty,
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
    TResult Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult Function(Map<int, int> totalQty)? clearTotalQty,
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
    required TResult Function(OrderFormDataList value) loadPendingReceivingData,
    required TResult Function(BackupCheckOut value) backupCheckOut,
    required TResult Function(ClearTotalQty value) clearTotalQty,
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
    TResult? Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult? Function(BackupCheckOut value)? backupCheckOut,
    TResult? Function(ClearTotalQty value)? clearTotalQty,
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
    TResult Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult Function(BackupCheckOut value)? backupCheckOut,
    TResult Function(ClearTotalQty value)? clearTotalQty,
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
    required TResult Function(List<OrderReceiving> orderFormDataList)
        loadPendingReceivingData,
    required TResult Function(
            Map<String, List<Map<String, dynamic>>> checkoutMap)
        backupCheckOut,
    required TResult Function(Map<int, int> totalQty) clearTotalQty,
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
    TResult? Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult? Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult? Function(Map<int, int> totalQty)? clearTotalQty,
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
    TResult Function(List<OrderReceiving> orderFormDataList)?
        loadPendingReceivingData,
    TResult Function(Map<String, List<Map<String, dynamic>>> checkoutMap)?
        backupCheckOut,
    TResult Function(Map<int, int> totalQty)? clearTotalQty,
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
    required TResult Function(OrderFormDataList value) loadPendingReceivingData,
    required TResult Function(BackupCheckOut value) backupCheckOut,
    required TResult Function(ClearTotalQty value) clearTotalQty,
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
    TResult? Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult? Function(BackupCheckOut value)? backupCheckOut,
    TResult? Function(ClearTotalQty value)? clearTotalQty,
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
    TResult Function(OrderFormDataList value)? loadPendingReceivingData,
    TResult Function(BackupCheckOut value)? backupCheckOut,
    TResult Function(ClearTotalQty value)? clearTotalQty,
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
