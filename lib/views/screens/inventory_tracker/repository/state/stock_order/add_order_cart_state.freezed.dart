// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_order_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddOrderCartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Map<String, dynamic>> addOrderCartList)
        addOrderCarList,
    required TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)
        checkOutMap,
    required TResult Function(Map<int, int> qty) incrementOrderCart,
    required TResult Function(Map<int, int> qty) decremenOrderCart,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult? Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult? Function(Map<int, int> qty)? incrementOrderCart,
    TResult? Function(Map<int, int> qty)? decremenOrderCart,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult Function(Map<int, int> qty)? incrementOrderCart,
    TResult Function(Map<int, int> qty)? decremenOrderCart,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddOrderCartList value) addOrderCarList,
    required TResult Function(CheckOutMap value) checkOutMap,
    required TResult Function(IncrementOrderCartQty value) incrementOrderCart,
    required TResult Function(DecrementOrderCartQty value) decremenOrderCart,
    required TResult Function(Initial value) initial,
    required TResult Function(AddOrderCartLoading value) loading,
    required TResult Function(AddOrderCartError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrderCartList value)? addOrderCarList,
    TResult? Function(CheckOutMap value)? checkOutMap,
    TResult? Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult? Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult? Function(Initial value)? initial,
    TResult? Function(AddOrderCartLoading value)? loading,
    TResult? Function(AddOrderCartError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrderCartList value)? addOrderCarList,
    TResult Function(CheckOutMap value)? checkOutMap,
    TResult Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult Function(Initial value)? initial,
    TResult Function(AddOrderCartLoading value)? loading,
    TResult Function(AddOrderCartError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOrderCartStateCopyWith<$Res> {
  factory $AddOrderCartStateCopyWith(
          AddOrderCartState value, $Res Function(AddOrderCartState) then) =
      _$AddOrderCartStateCopyWithImpl<$Res, AddOrderCartState>;
}

/// @nodoc
class _$AddOrderCartStateCopyWithImpl<$Res, $Val extends AddOrderCartState>
    implements $AddOrderCartStateCopyWith<$Res> {
  _$AddOrderCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddOrderCartListImplCopyWith<$Res> {
  factory _$$AddOrderCartListImplCopyWith(_$AddOrderCartListImpl value,
          $Res Function(_$AddOrderCartListImpl) then) =
      __$$AddOrderCartListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> addOrderCartList});
}

/// @nodoc
class __$$AddOrderCartListImplCopyWithImpl<$Res>
    extends _$AddOrderCartStateCopyWithImpl<$Res, _$AddOrderCartListImpl>
    implements _$$AddOrderCartListImplCopyWith<$Res> {
  __$$AddOrderCartListImplCopyWithImpl(_$AddOrderCartListImpl _value,
      $Res Function(_$AddOrderCartListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addOrderCartList = null,
  }) {
    return _then(_$AddOrderCartListImpl(
      null == addOrderCartList
          ? _value._addOrderCartList
          : addOrderCartList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$AddOrderCartListImpl implements AddOrderCartList {
  const _$AddOrderCartListImpl(
      final List<Map<String, dynamic>> addOrderCartList)
      : _addOrderCartList = addOrderCartList;

  final List<Map<String, dynamic>> _addOrderCartList;
  @override
  List<Map<String, dynamic>> get addOrderCartList {
    if (_addOrderCartList is EqualUnmodifiableListView)
      return _addOrderCartList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addOrderCartList);
  }

  @override
  String toString() {
    return 'AddOrderCartState.addOrderCarList(addOrderCartList: $addOrderCartList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrderCartListImpl &&
            const DeepCollectionEquality()
                .equals(other._addOrderCartList, _addOrderCartList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_addOrderCartList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOrderCartListImplCopyWith<_$AddOrderCartListImpl> get copyWith =>
      __$$AddOrderCartListImplCopyWithImpl<_$AddOrderCartListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Map<String, dynamic>> addOrderCartList)
        addOrderCarList,
    required TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)
        checkOutMap,
    required TResult Function(Map<int, int> qty) incrementOrderCart,
    required TResult Function(Map<int, int> qty) decremenOrderCart,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return addOrderCarList(addOrderCartList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult? Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult? Function(Map<int, int> qty)? incrementOrderCart,
    TResult? Function(Map<int, int> qty)? decremenOrderCart,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return addOrderCarList?.call(addOrderCartList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult Function(Map<int, int> qty)? incrementOrderCart,
    TResult Function(Map<int, int> qty)? decremenOrderCart,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (addOrderCarList != null) {
      return addOrderCarList(addOrderCartList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddOrderCartList value) addOrderCarList,
    required TResult Function(CheckOutMap value) checkOutMap,
    required TResult Function(IncrementOrderCartQty value) incrementOrderCart,
    required TResult Function(DecrementOrderCartQty value) decremenOrderCart,
    required TResult Function(Initial value) initial,
    required TResult Function(AddOrderCartLoading value) loading,
    required TResult Function(AddOrderCartError value) error,
  }) {
    return addOrderCarList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrderCartList value)? addOrderCarList,
    TResult? Function(CheckOutMap value)? checkOutMap,
    TResult? Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult? Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult? Function(Initial value)? initial,
    TResult? Function(AddOrderCartLoading value)? loading,
    TResult? Function(AddOrderCartError value)? error,
  }) {
    return addOrderCarList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrderCartList value)? addOrderCarList,
    TResult Function(CheckOutMap value)? checkOutMap,
    TResult Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult Function(Initial value)? initial,
    TResult Function(AddOrderCartLoading value)? loading,
    TResult Function(AddOrderCartError value)? error,
    required TResult orElse(),
  }) {
    if (addOrderCarList != null) {
      return addOrderCarList(this);
    }
    return orElse();
  }
}

abstract class AddOrderCartList implements AddOrderCartState {
  const factory AddOrderCartList(
          final List<Map<String, dynamic>> addOrderCartList) =
      _$AddOrderCartListImpl;

  List<Map<String, dynamic>> get addOrderCartList;
  @JsonKey(ignore: true)
  _$$AddOrderCartListImplCopyWith<_$AddOrderCartListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckOutMapImplCopyWith<$Res> {
  factory _$$CheckOutMapImplCopyWith(
          _$CheckOutMapImpl value, $Res Function(_$CheckOutMapImpl) then) =
      __$$CheckOutMapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<int, List<Map<String, dynamic>>> checkoutMap});
}

/// @nodoc
class __$$CheckOutMapImplCopyWithImpl<$Res>
    extends _$AddOrderCartStateCopyWithImpl<$Res, _$CheckOutMapImpl>
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
              as Map<int, List<Map<String, dynamic>>>,
    ));
  }
}

/// @nodoc

class _$CheckOutMapImpl implements CheckOutMap {
  const _$CheckOutMapImpl(
      final Map<int, List<Map<String, dynamic>>> checkoutMap)
      : _checkoutMap = checkoutMap;

  final Map<int, List<Map<String, dynamic>>> _checkoutMap;
  @override
  Map<int, List<Map<String, dynamic>>> get checkoutMap {
    if (_checkoutMap is EqualUnmodifiableMapView) return _checkoutMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_checkoutMap);
  }

  @override
  String toString() {
    return 'AddOrderCartState.checkOutMap(checkoutMap: $checkoutMap)';
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
    required TResult Function(List<Map<String, dynamic>> addOrderCartList)
        addOrderCarList,
    required TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)
        checkOutMap,
    required TResult Function(Map<int, int> qty) incrementOrderCart,
    required TResult Function(Map<int, int> qty) decremenOrderCart,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return checkOutMap(checkoutMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult? Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult? Function(Map<int, int> qty)? incrementOrderCart,
    TResult? Function(Map<int, int> qty)? decremenOrderCart,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return checkOutMap?.call(checkoutMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult Function(Map<int, int> qty)? incrementOrderCart,
    TResult Function(Map<int, int> qty)? decremenOrderCart,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (checkOutMap != null) {
      return checkOutMap(checkoutMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddOrderCartList value) addOrderCarList,
    required TResult Function(CheckOutMap value) checkOutMap,
    required TResult Function(IncrementOrderCartQty value) incrementOrderCart,
    required TResult Function(DecrementOrderCartQty value) decremenOrderCart,
    required TResult Function(Initial value) initial,
    required TResult Function(AddOrderCartLoading value) loading,
    required TResult Function(AddOrderCartError value) error,
  }) {
    return checkOutMap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrderCartList value)? addOrderCarList,
    TResult? Function(CheckOutMap value)? checkOutMap,
    TResult? Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult? Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult? Function(Initial value)? initial,
    TResult? Function(AddOrderCartLoading value)? loading,
    TResult? Function(AddOrderCartError value)? error,
  }) {
    return checkOutMap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrderCartList value)? addOrderCarList,
    TResult Function(CheckOutMap value)? checkOutMap,
    TResult Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult Function(Initial value)? initial,
    TResult Function(AddOrderCartLoading value)? loading,
    TResult Function(AddOrderCartError value)? error,
    required TResult orElse(),
  }) {
    if (checkOutMap != null) {
      return checkOutMap(this);
    }
    return orElse();
  }
}

abstract class CheckOutMap implements AddOrderCartState {
  const factory CheckOutMap(
          final Map<int, List<Map<String, dynamic>>> checkoutMap) =
      _$CheckOutMapImpl;

  Map<int, List<Map<String, dynamic>>> get checkoutMap;
  @JsonKey(ignore: true)
  _$$CheckOutMapImplCopyWith<_$CheckOutMapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncrementOrderCartQtyImplCopyWith<$Res> {
  factory _$$IncrementOrderCartQtyImplCopyWith(
          _$IncrementOrderCartQtyImpl value,
          $Res Function(_$IncrementOrderCartQtyImpl) then) =
      __$$IncrementOrderCartQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<int, int> qty});
}

/// @nodoc
class __$$IncrementOrderCartQtyImplCopyWithImpl<$Res>
    extends _$AddOrderCartStateCopyWithImpl<$Res, _$IncrementOrderCartQtyImpl>
    implements _$$IncrementOrderCartQtyImplCopyWith<$Res> {
  __$$IncrementOrderCartQtyImplCopyWithImpl(_$IncrementOrderCartQtyImpl _value,
      $Res Function(_$IncrementOrderCartQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
  }) {
    return _then(_$IncrementOrderCartQtyImpl(
      null == qty
          ? _value._qty
          : qty // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ));
  }
}

/// @nodoc

class _$IncrementOrderCartQtyImpl implements IncrementOrderCartQty {
  const _$IncrementOrderCartQtyImpl(final Map<int, int> qty) : _qty = qty;

  final Map<int, int> _qty;
  @override
  Map<int, int> get qty {
    if (_qty is EqualUnmodifiableMapView) return _qty;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_qty);
  }

  @override
  String toString() {
    return 'AddOrderCartState.incrementOrderCart(qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncrementOrderCartQtyImpl &&
            const DeepCollectionEquality().equals(other._qty, _qty));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_qty));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncrementOrderCartQtyImplCopyWith<_$IncrementOrderCartQtyImpl>
      get copyWith => __$$IncrementOrderCartQtyImplCopyWithImpl<
          _$IncrementOrderCartQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Map<String, dynamic>> addOrderCartList)
        addOrderCarList,
    required TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)
        checkOutMap,
    required TResult Function(Map<int, int> qty) incrementOrderCart,
    required TResult Function(Map<int, int> qty) decremenOrderCart,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return incrementOrderCart(qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult? Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult? Function(Map<int, int> qty)? incrementOrderCart,
    TResult? Function(Map<int, int> qty)? decremenOrderCart,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return incrementOrderCart?.call(qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult Function(Map<int, int> qty)? incrementOrderCart,
    TResult Function(Map<int, int> qty)? decremenOrderCart,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (incrementOrderCart != null) {
      return incrementOrderCart(qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddOrderCartList value) addOrderCarList,
    required TResult Function(CheckOutMap value) checkOutMap,
    required TResult Function(IncrementOrderCartQty value) incrementOrderCart,
    required TResult Function(DecrementOrderCartQty value) decremenOrderCart,
    required TResult Function(Initial value) initial,
    required TResult Function(AddOrderCartLoading value) loading,
    required TResult Function(AddOrderCartError value) error,
  }) {
    return incrementOrderCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrderCartList value)? addOrderCarList,
    TResult? Function(CheckOutMap value)? checkOutMap,
    TResult? Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult? Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult? Function(Initial value)? initial,
    TResult? Function(AddOrderCartLoading value)? loading,
    TResult? Function(AddOrderCartError value)? error,
  }) {
    return incrementOrderCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrderCartList value)? addOrderCarList,
    TResult Function(CheckOutMap value)? checkOutMap,
    TResult Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult Function(Initial value)? initial,
    TResult Function(AddOrderCartLoading value)? loading,
    TResult Function(AddOrderCartError value)? error,
    required TResult orElse(),
  }) {
    if (incrementOrderCart != null) {
      return incrementOrderCart(this);
    }
    return orElse();
  }
}

abstract class IncrementOrderCartQty implements AddOrderCartState {
  const factory IncrementOrderCartQty(final Map<int, int> qty) =
      _$IncrementOrderCartQtyImpl;

  Map<int, int> get qty;
  @JsonKey(ignore: true)
  _$$IncrementOrderCartQtyImplCopyWith<_$IncrementOrderCartQtyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecrementOrderCartQtyImplCopyWith<$Res> {
  factory _$$DecrementOrderCartQtyImplCopyWith(
          _$DecrementOrderCartQtyImpl value,
          $Res Function(_$DecrementOrderCartQtyImpl) then) =
      __$$DecrementOrderCartQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<int, int> qty});
}

/// @nodoc
class __$$DecrementOrderCartQtyImplCopyWithImpl<$Res>
    extends _$AddOrderCartStateCopyWithImpl<$Res, _$DecrementOrderCartQtyImpl>
    implements _$$DecrementOrderCartQtyImplCopyWith<$Res> {
  __$$DecrementOrderCartQtyImplCopyWithImpl(_$DecrementOrderCartQtyImpl _value,
      $Res Function(_$DecrementOrderCartQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
  }) {
    return _then(_$DecrementOrderCartQtyImpl(
      null == qty
          ? _value._qty
          : qty // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ));
  }
}

/// @nodoc

class _$DecrementOrderCartQtyImpl implements DecrementOrderCartQty {
  const _$DecrementOrderCartQtyImpl(final Map<int, int> qty) : _qty = qty;

  final Map<int, int> _qty;
  @override
  Map<int, int> get qty {
    if (_qty is EqualUnmodifiableMapView) return _qty;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_qty);
  }

  @override
  String toString() {
    return 'AddOrderCartState.decremenOrderCart(qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecrementOrderCartQtyImpl &&
            const DeepCollectionEquality().equals(other._qty, _qty));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_qty));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecrementOrderCartQtyImplCopyWith<_$DecrementOrderCartQtyImpl>
      get copyWith => __$$DecrementOrderCartQtyImplCopyWithImpl<
          _$DecrementOrderCartQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Map<String, dynamic>> addOrderCartList)
        addOrderCarList,
    required TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)
        checkOutMap,
    required TResult Function(Map<int, int> qty) incrementOrderCart,
    required TResult Function(Map<int, int> qty) decremenOrderCart,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return decremenOrderCart(qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult? Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult? Function(Map<int, int> qty)? incrementOrderCart,
    TResult? Function(Map<int, int> qty)? decremenOrderCart,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return decremenOrderCart?.call(qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult Function(Map<int, int> qty)? incrementOrderCart,
    TResult Function(Map<int, int> qty)? decremenOrderCart,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (decremenOrderCart != null) {
      return decremenOrderCart(qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddOrderCartList value) addOrderCarList,
    required TResult Function(CheckOutMap value) checkOutMap,
    required TResult Function(IncrementOrderCartQty value) incrementOrderCart,
    required TResult Function(DecrementOrderCartQty value) decremenOrderCart,
    required TResult Function(Initial value) initial,
    required TResult Function(AddOrderCartLoading value) loading,
    required TResult Function(AddOrderCartError value) error,
  }) {
    return decremenOrderCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrderCartList value)? addOrderCarList,
    TResult? Function(CheckOutMap value)? checkOutMap,
    TResult? Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult? Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult? Function(Initial value)? initial,
    TResult? Function(AddOrderCartLoading value)? loading,
    TResult? Function(AddOrderCartError value)? error,
  }) {
    return decremenOrderCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrderCartList value)? addOrderCarList,
    TResult Function(CheckOutMap value)? checkOutMap,
    TResult Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult Function(Initial value)? initial,
    TResult Function(AddOrderCartLoading value)? loading,
    TResult Function(AddOrderCartError value)? error,
    required TResult orElse(),
  }) {
    if (decremenOrderCart != null) {
      return decremenOrderCart(this);
    }
    return orElse();
  }
}

abstract class DecrementOrderCartQty implements AddOrderCartState {
  const factory DecrementOrderCartQty(final Map<int, int> qty) =
      _$DecrementOrderCartQtyImpl;

  Map<int, int> get qty;
  @JsonKey(ignore: true)
  _$$DecrementOrderCartQtyImplCopyWith<_$DecrementOrderCartQtyImpl>
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
    extends _$AddOrderCartStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'AddOrderCartState.initial()';
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
    required TResult Function(List<Map<String, dynamic>> addOrderCartList)
        addOrderCarList,
    required TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)
        checkOutMap,
    required TResult Function(Map<int, int> qty) incrementOrderCart,
    required TResult Function(Map<int, int> qty) decremenOrderCart,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult? Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult? Function(Map<int, int> qty)? incrementOrderCart,
    TResult? Function(Map<int, int> qty)? decremenOrderCart,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult Function(Map<int, int> qty)? incrementOrderCart,
    TResult Function(Map<int, int> qty)? decremenOrderCart,
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
    required TResult Function(AddOrderCartList value) addOrderCarList,
    required TResult Function(CheckOutMap value) checkOutMap,
    required TResult Function(IncrementOrderCartQty value) incrementOrderCart,
    required TResult Function(DecrementOrderCartQty value) decremenOrderCart,
    required TResult Function(Initial value) initial,
    required TResult Function(AddOrderCartLoading value) loading,
    required TResult Function(AddOrderCartError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrderCartList value)? addOrderCarList,
    TResult? Function(CheckOutMap value)? checkOutMap,
    TResult? Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult? Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult? Function(Initial value)? initial,
    TResult? Function(AddOrderCartLoading value)? loading,
    TResult? Function(AddOrderCartError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrderCartList value)? addOrderCarList,
    TResult Function(CheckOutMap value)? checkOutMap,
    TResult Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult Function(Initial value)? initial,
    TResult Function(AddOrderCartLoading value)? loading,
    TResult Function(AddOrderCartError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AddOrderCartState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AddOrderCartLoadingImplCopyWith<$Res> {
  factory _$$AddOrderCartLoadingImplCopyWith(_$AddOrderCartLoadingImpl value,
          $Res Function(_$AddOrderCartLoadingImpl) then) =
      __$$AddOrderCartLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddOrderCartLoadingImplCopyWithImpl<$Res>
    extends _$AddOrderCartStateCopyWithImpl<$Res, _$AddOrderCartLoadingImpl>
    implements _$$AddOrderCartLoadingImplCopyWith<$Res> {
  __$$AddOrderCartLoadingImplCopyWithImpl(_$AddOrderCartLoadingImpl _value,
      $Res Function(_$AddOrderCartLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddOrderCartLoadingImpl implements AddOrderCartLoading {
  const _$AddOrderCartLoadingImpl();

  @override
  String toString() {
    return 'AddOrderCartState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrderCartLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Map<String, dynamic>> addOrderCartList)
        addOrderCarList,
    required TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)
        checkOutMap,
    required TResult Function(Map<int, int> qty) incrementOrderCart,
    required TResult Function(Map<int, int> qty) decremenOrderCart,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult? Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult? Function(Map<int, int> qty)? incrementOrderCart,
    TResult? Function(Map<int, int> qty)? decremenOrderCart,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult Function(Map<int, int> qty)? incrementOrderCart,
    TResult Function(Map<int, int> qty)? decremenOrderCart,
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
    required TResult Function(AddOrderCartList value) addOrderCarList,
    required TResult Function(CheckOutMap value) checkOutMap,
    required TResult Function(IncrementOrderCartQty value) incrementOrderCart,
    required TResult Function(DecrementOrderCartQty value) decremenOrderCart,
    required TResult Function(Initial value) initial,
    required TResult Function(AddOrderCartLoading value) loading,
    required TResult Function(AddOrderCartError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrderCartList value)? addOrderCarList,
    TResult? Function(CheckOutMap value)? checkOutMap,
    TResult? Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult? Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult? Function(Initial value)? initial,
    TResult? Function(AddOrderCartLoading value)? loading,
    TResult? Function(AddOrderCartError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrderCartList value)? addOrderCarList,
    TResult Function(CheckOutMap value)? checkOutMap,
    TResult Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult Function(Initial value)? initial,
    TResult Function(AddOrderCartLoading value)? loading,
    TResult Function(AddOrderCartError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AddOrderCartLoading implements AddOrderCartState {
  const factory AddOrderCartLoading() = _$AddOrderCartLoadingImpl;
}

/// @nodoc
abstract class _$$AddOrderCartErrorImplCopyWith<$Res> {
  factory _$$AddOrderCartErrorImplCopyWith(_$AddOrderCartErrorImpl value,
          $Res Function(_$AddOrderCartErrorImpl) then) =
      __$$AddOrderCartErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$AddOrderCartErrorImplCopyWithImpl<$Res>
    extends _$AddOrderCartStateCopyWithImpl<$Res, _$AddOrderCartErrorImpl>
    implements _$$AddOrderCartErrorImplCopyWith<$Res> {
  __$$AddOrderCartErrorImplCopyWithImpl(_$AddOrderCartErrorImpl _value,
      $Res Function(_$AddOrderCartErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$AddOrderCartErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddOrderCartErrorImpl implements AddOrderCartError {
  const _$AddOrderCartErrorImpl({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'AddOrderCartState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrderCartErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOrderCartErrorImplCopyWith<_$AddOrderCartErrorImpl> get copyWith =>
      __$$AddOrderCartErrorImplCopyWithImpl<_$AddOrderCartErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Map<String, dynamic>> addOrderCartList)
        addOrderCarList,
    required TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)
        checkOutMap,
    required TResult Function(Map<int, int> qty) incrementOrderCart,
    required TResult Function(Map<int, int> qty) decremenOrderCart,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult? Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult? Function(Map<int, int> qty)? incrementOrderCart,
    TResult? Function(Map<int, int> qty)? decremenOrderCart,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> addOrderCartList)?
        addOrderCarList,
    TResult Function(Map<int, List<Map<String, dynamic>>> checkoutMap)?
        checkOutMap,
    TResult Function(Map<int, int> qty)? incrementOrderCart,
    TResult Function(Map<int, int> qty)? decremenOrderCart,
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
    required TResult Function(AddOrderCartList value) addOrderCarList,
    required TResult Function(CheckOutMap value) checkOutMap,
    required TResult Function(IncrementOrderCartQty value) incrementOrderCart,
    required TResult Function(DecrementOrderCartQty value) decremenOrderCart,
    required TResult Function(Initial value) initial,
    required TResult Function(AddOrderCartLoading value) loading,
    required TResult Function(AddOrderCartError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrderCartList value)? addOrderCarList,
    TResult? Function(CheckOutMap value)? checkOutMap,
    TResult? Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult? Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult? Function(Initial value)? initial,
    TResult? Function(AddOrderCartLoading value)? loading,
    TResult? Function(AddOrderCartError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrderCartList value)? addOrderCarList,
    TResult Function(CheckOutMap value)? checkOutMap,
    TResult Function(IncrementOrderCartQty value)? incrementOrderCart,
    TResult Function(DecrementOrderCartQty value)? decremenOrderCart,
    TResult Function(Initial value)? initial,
    TResult Function(AddOrderCartLoading value)? loading,
    TResult Function(AddOrderCartError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AddOrderCartError implements AddOrderCartState {
  const factory AddOrderCartError({final String? error}) =
      _$AddOrderCartErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$AddOrderCartErrorImplCopyWith<_$AddOrderCartErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
