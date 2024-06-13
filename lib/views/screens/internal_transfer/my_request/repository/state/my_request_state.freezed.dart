// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyRequestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(int index, double qty) incrementQty,
    required TResult Function(int index, double qty) decrementQty,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(int productID) receivedProductID,
    required TResult Function() receiveLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(int index, double qty)? incrementQty,
    TResult? Function(int index, double qty)? decrementQty,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(int productID)? receivedProductID,
    TResult? Function()? receiveLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(int index, double qty)? incrementQty,
    TResult Function(int index, double qty)? decrementQty,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(int productID)? receivedProductID,
    TResult Function()? receiveLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(ReceivedProductID value) receivedProductID,
    required TResult Function(ReceiveLoading value) receiveLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(ReceivedProductID value)? receivedProductID,
    TResult? Function(ReceiveLoading value)? receiveLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(ReceivedProductID value)? receivedProductID,
    TResult Function(ReceiveLoading value)? receiveLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyRequestStateCopyWith<$Res> {
  factory $MyRequestStateCopyWith(
          MyRequestState value, $Res Function(MyRequestState) then) =
      _$MyRequestStateCopyWithImpl<$Res, MyRequestState>;
}

/// @nodoc
class _$MyRequestStateCopyWithImpl<$Res, $Val extends MyRequestState>
    implements $MyRequestStateCopyWith<$Res> {
  _$MyRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MyRequestListImplCopyWith<$Res> {
  factory _$$MyRequestListImplCopyWith(
          _$MyRequestListImpl value, $Res Function(_$MyRequestListImpl) then) =
      __$$MyRequestListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MyRequest> myRequestList});
}

/// @nodoc
class __$$MyRequestListImplCopyWithImpl<$Res>
    extends _$MyRequestStateCopyWithImpl<$Res, _$MyRequestListImpl>
    implements _$$MyRequestListImplCopyWith<$Res> {
  __$$MyRequestListImplCopyWithImpl(
      _$MyRequestListImpl _value, $Res Function(_$MyRequestListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myRequestList = null,
  }) {
    return _then(_$MyRequestListImpl(
      null == myRequestList
          ? _value._myRequestList
          : myRequestList // ignore: cast_nullable_to_non_nullable
              as List<MyRequest>,
    ));
  }
}

/// @nodoc

class _$MyRequestListImpl implements MyRequestList {
  const _$MyRequestListImpl(final List<MyRequest> myRequestList)
      : _myRequestList = myRequestList;

  final List<MyRequest> _myRequestList;
  @override
  List<MyRequest> get myRequestList {
    if (_myRequestList is EqualUnmodifiableListView) return _myRequestList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myRequestList);
  }

  @override
  String toString() {
    return 'MyRequestState.loadMyRequestData(myRequestList: $myRequestList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyRequestListImpl &&
            const DeepCollectionEquality()
                .equals(other._myRequestList, _myRequestList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_myRequestList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyRequestListImplCopyWith<_$MyRequestListImpl> get copyWith =>
      __$$MyRequestListImplCopyWithImpl<_$MyRequestListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(int index, double qty) incrementQty,
    required TResult Function(int index, double qty) decrementQty,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(int productID) receivedProductID,
    required TResult Function() receiveLoading,
  }) {
    return loadMyRequestData(myRequestList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(int index, double qty)? incrementQty,
    TResult? Function(int index, double qty)? decrementQty,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(int productID)? receivedProductID,
    TResult? Function()? receiveLoading,
  }) {
    return loadMyRequestData?.call(myRequestList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(int index, double qty)? incrementQty,
    TResult Function(int index, double qty)? decrementQty,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(int productID)? receivedProductID,
    TResult Function()? receiveLoading,
    required TResult orElse(),
  }) {
    if (loadMyRequestData != null) {
      return loadMyRequestData(myRequestList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(ReceivedProductID value) receivedProductID,
    required TResult Function(ReceiveLoading value) receiveLoading,
  }) {
    return loadMyRequestData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(ReceivedProductID value)? receivedProductID,
    TResult? Function(ReceiveLoading value)? receiveLoading,
  }) {
    return loadMyRequestData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(ReceivedProductID value)? receivedProductID,
    TResult Function(ReceiveLoading value)? receiveLoading,
    required TResult orElse(),
  }) {
    if (loadMyRequestData != null) {
      return loadMyRequestData(this);
    }
    return orElse();
  }
}

abstract class MyRequestList implements MyRequestState {
  const factory MyRequestList(final List<MyRequest> myRequestList) =
      _$MyRequestListImpl;

  List<MyRequest> get myRequestList;
  @JsonKey(ignore: true)
  _$$MyRequestListImplCopyWith<_$MyRequestListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncrementQtyImplCopyWith<$Res> {
  factory _$$IncrementQtyImplCopyWith(
          _$IncrementQtyImpl value, $Res Function(_$IncrementQtyImpl) then) =
      __$$IncrementQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, double qty});
}

/// @nodoc
class __$$IncrementQtyImplCopyWithImpl<$Res>
    extends _$MyRequestStateCopyWithImpl<$Res, _$IncrementQtyImpl>
    implements _$$IncrementQtyImplCopyWith<$Res> {
  __$$IncrementQtyImplCopyWithImpl(
      _$IncrementQtyImpl _value, $Res Function(_$IncrementQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? qty = null,
  }) {
    return _then(_$IncrementQtyImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$IncrementQtyImpl implements IncrementQty {
  const _$IncrementQtyImpl(this.index, this.qty);

  @override
  final int index;
  @override
  final double qty;

  @override
  String toString() {
    return 'MyRequestState.incrementQty(index: $index, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncrementQtyImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncrementQtyImplCopyWith<_$IncrementQtyImpl> get copyWith =>
      __$$IncrementQtyImplCopyWithImpl<_$IncrementQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(int index, double qty) incrementQty,
    required TResult Function(int index, double qty) decrementQty,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(int productID) receivedProductID,
    required TResult Function() receiveLoading,
  }) {
    return incrementQty(index, qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(int index, double qty)? incrementQty,
    TResult? Function(int index, double qty)? decrementQty,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(int productID)? receivedProductID,
    TResult? Function()? receiveLoading,
  }) {
    return incrementQty?.call(index, qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(int index, double qty)? incrementQty,
    TResult Function(int index, double qty)? decrementQty,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(int productID)? receivedProductID,
    TResult Function()? receiveLoading,
    required TResult orElse(),
  }) {
    if (incrementQty != null) {
      return incrementQty(index, qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(ReceivedProductID value) receivedProductID,
    required TResult Function(ReceiveLoading value) receiveLoading,
  }) {
    return incrementQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(ReceivedProductID value)? receivedProductID,
    TResult? Function(ReceiveLoading value)? receiveLoading,
  }) {
    return incrementQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(ReceivedProductID value)? receivedProductID,
    TResult Function(ReceiveLoading value)? receiveLoading,
    required TResult orElse(),
  }) {
    if (incrementQty != null) {
      return incrementQty(this);
    }
    return orElse();
  }
}

abstract class IncrementQty implements MyRequestState {
  const factory IncrementQty(final int index, final double qty) =
      _$IncrementQtyImpl;

  int get index;
  double get qty;
  @JsonKey(ignore: true)
  _$$IncrementQtyImplCopyWith<_$IncrementQtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecrementQtyImplCopyWith<$Res> {
  factory _$$DecrementQtyImplCopyWith(
          _$DecrementQtyImpl value, $Res Function(_$DecrementQtyImpl) then) =
      __$$DecrementQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, double qty});
}

/// @nodoc
class __$$DecrementQtyImplCopyWithImpl<$Res>
    extends _$MyRequestStateCopyWithImpl<$Res, _$DecrementQtyImpl>
    implements _$$DecrementQtyImplCopyWith<$Res> {
  __$$DecrementQtyImplCopyWithImpl(
      _$DecrementQtyImpl _value, $Res Function(_$DecrementQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? qty = null,
  }) {
    return _then(_$DecrementQtyImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$DecrementQtyImpl implements DecrementQty {
  const _$DecrementQtyImpl(this.index, this.qty);

  @override
  final int index;
  @override
  final double qty;

  @override
  String toString() {
    return 'MyRequestState.decrementQty(index: $index, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecrementQtyImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecrementQtyImplCopyWith<_$DecrementQtyImpl> get copyWith =>
      __$$DecrementQtyImplCopyWithImpl<_$DecrementQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(int index, double qty) incrementQty,
    required TResult Function(int index, double qty) decrementQty,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(int productID) receivedProductID,
    required TResult Function() receiveLoading,
  }) {
    return decrementQty(index, qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(int index, double qty)? incrementQty,
    TResult? Function(int index, double qty)? decrementQty,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(int productID)? receivedProductID,
    TResult? Function()? receiveLoading,
  }) {
    return decrementQty?.call(index, qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(int index, double qty)? incrementQty,
    TResult Function(int index, double qty)? decrementQty,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(int productID)? receivedProductID,
    TResult Function()? receiveLoading,
    required TResult orElse(),
  }) {
    if (decrementQty != null) {
      return decrementQty(index, qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(ReceivedProductID value) receivedProductID,
    required TResult Function(ReceiveLoading value) receiveLoading,
  }) {
    return decrementQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(ReceivedProductID value)? receivedProductID,
    TResult? Function(ReceiveLoading value)? receiveLoading,
  }) {
    return decrementQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(ReceivedProductID value)? receivedProductID,
    TResult Function(ReceiveLoading value)? receiveLoading,
    required TResult orElse(),
  }) {
    if (decrementQty != null) {
      return decrementQty(this);
    }
    return orElse();
  }
}

abstract class DecrementQty implements MyRequestState {
  const factory DecrementQty(final int index, final double qty) =
      _$DecrementQtyImpl;

  int get index;
  double get qty;
  @JsonKey(ignore: true)
  _$$DecrementQtyImplCopyWith<_$DecrementQtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsDataExitImplCopyWith<$Res> {
  factory _$$IsDataExitImplCopyWith(
          _$IsDataExitImpl value, $Res Function(_$IsDataExitImpl) then) =
      __$$IsDataExitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isExit});
}

/// @nodoc
class __$$IsDataExitImplCopyWithImpl<$Res>
    extends _$MyRequestStateCopyWithImpl<$Res, _$IsDataExitImpl>
    implements _$$IsDataExitImplCopyWith<$Res> {
  __$$IsDataExitImplCopyWithImpl(
      _$IsDataExitImpl _value, $Res Function(_$IsDataExitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExit = null,
  }) {
    return _then(_$IsDataExitImpl(
      null == isExit
          ? _value.isExit
          : isExit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IsDataExitImpl implements IsDataExit {
  const _$IsDataExitImpl(this.isExit);

  @override
  final bool isExit;

  @override
  String toString() {
    return 'MyRequestState.isDataExist(isExit: $isExit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsDataExitImpl &&
            (identical(other.isExit, isExit) || other.isExit == isExit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isExit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsDataExitImplCopyWith<_$IsDataExitImpl> get copyWith =>
      __$$IsDataExitImplCopyWithImpl<_$IsDataExitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(int index, double qty) incrementQty,
    required TResult Function(int index, double qty) decrementQty,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(int productID) receivedProductID,
    required TResult Function() receiveLoading,
  }) {
    return isDataExist(isExit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(int index, double qty)? incrementQty,
    TResult? Function(int index, double qty)? decrementQty,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(int productID)? receivedProductID,
    TResult? Function()? receiveLoading,
  }) {
    return isDataExist?.call(isExit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(int index, double qty)? incrementQty,
    TResult Function(int index, double qty)? decrementQty,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(int productID)? receivedProductID,
    TResult Function()? receiveLoading,
    required TResult orElse(),
  }) {
    if (isDataExist != null) {
      return isDataExist(isExit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(ReceivedProductID value) receivedProductID,
    required TResult Function(ReceiveLoading value) receiveLoading,
  }) {
    return isDataExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(ReceivedProductID value)? receivedProductID,
    TResult? Function(ReceiveLoading value)? receiveLoading,
  }) {
    return isDataExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(ReceivedProductID value)? receivedProductID,
    TResult Function(ReceiveLoading value)? receiveLoading,
    required TResult orElse(),
  }) {
    if (isDataExist != null) {
      return isDataExist(this);
    }
    return orElse();
  }
}

abstract class IsDataExit implements MyRequestState {
  const factory IsDataExit(final bool isExit) = _$IsDataExitImpl;

  bool get isExit;
  @JsonKey(ignore: true)
  _$$IsDataExitImplCopyWith<_$IsDataExitImpl> get copyWith =>
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
    extends _$MyRequestStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'MyRequestState.initial()';
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
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(int index, double qty) incrementQty,
    required TResult Function(int index, double qty) decrementQty,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(int productID) receivedProductID,
    required TResult Function() receiveLoading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(int index, double qty)? incrementQty,
    TResult? Function(int index, double qty)? decrementQty,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(int productID)? receivedProductID,
    TResult? Function()? receiveLoading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(int index, double qty)? incrementQty,
    TResult Function(int index, double qty)? decrementQty,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(int productID)? receivedProductID,
    TResult Function()? receiveLoading,
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
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(ReceivedProductID value) receivedProductID,
    required TResult Function(ReceiveLoading value) receiveLoading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(ReceivedProductID value)? receivedProductID,
    TResult? Function(ReceiveLoading value)? receiveLoading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(ReceivedProductID value)? receivedProductID,
    TResult Function(ReceiveLoading value)? receiveLoading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements MyRequestState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$MyRequestLoadingImplCopyWith<$Res> {
  factory _$$MyRequestLoadingImplCopyWith(_$MyRequestLoadingImpl value,
          $Res Function(_$MyRequestLoadingImpl) then) =
      __$$MyRequestLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyRequestLoadingImplCopyWithImpl<$Res>
    extends _$MyRequestStateCopyWithImpl<$Res, _$MyRequestLoadingImpl>
    implements _$$MyRequestLoadingImplCopyWith<$Res> {
  __$$MyRequestLoadingImplCopyWithImpl(_$MyRequestLoadingImpl _value,
      $Res Function(_$MyRequestLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyRequestLoadingImpl implements MyRequestLoading {
  const _$MyRequestLoadingImpl();

  @override
  String toString() {
    return 'MyRequestState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MyRequestLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(int index, double qty) incrementQty,
    required TResult Function(int index, double qty) decrementQty,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(int productID) receivedProductID,
    required TResult Function() receiveLoading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(int index, double qty)? incrementQty,
    TResult? Function(int index, double qty)? decrementQty,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(int productID)? receivedProductID,
    TResult? Function()? receiveLoading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(int index, double qty)? incrementQty,
    TResult Function(int index, double qty)? decrementQty,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(int productID)? receivedProductID,
    TResult Function()? receiveLoading,
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
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(ReceivedProductID value) receivedProductID,
    required TResult Function(ReceiveLoading value) receiveLoading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(ReceivedProductID value)? receivedProductID,
    TResult? Function(ReceiveLoading value)? receiveLoading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(ReceivedProductID value)? receivedProductID,
    TResult Function(ReceiveLoading value)? receiveLoading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MyRequestLoading implements MyRequestState {
  const factory MyRequestLoading() = _$MyRequestLoadingImpl;
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
    extends _$MyRequestStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'MyRequestState.error(error: $error)';
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
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(int index, double qty) incrementQty,
    required TResult Function(int index, double qty) decrementQty,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(int productID) receivedProductID,
    required TResult Function() receiveLoading,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(int index, double qty)? incrementQty,
    TResult? Function(int index, double qty)? decrementQty,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(int productID)? receivedProductID,
    TResult? Function()? receiveLoading,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(int index, double qty)? incrementQty,
    TResult Function(int index, double qty)? decrementQty,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(int productID)? receivedProductID,
    TResult Function()? receiveLoading,
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
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(ReceivedProductID value) receivedProductID,
    required TResult Function(ReceiveLoading value) receiveLoading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(ReceivedProductID value)? receivedProductID,
    TResult? Function(ReceiveLoading value)? receiveLoading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(ReceivedProductID value)? receivedProductID,
    TResult Function(ReceiveLoading value)? receiveLoading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements MyRequestState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceivedProductIDImplCopyWith<$Res> {
  factory _$$ReceivedProductIDImplCopyWith(_$ReceivedProductIDImpl value,
          $Res Function(_$ReceivedProductIDImpl) then) =
      __$$ReceivedProductIDImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int productID});
}

/// @nodoc
class __$$ReceivedProductIDImplCopyWithImpl<$Res>
    extends _$MyRequestStateCopyWithImpl<$Res, _$ReceivedProductIDImpl>
    implements _$$ReceivedProductIDImplCopyWith<$Res> {
  __$$ReceivedProductIDImplCopyWithImpl(_$ReceivedProductIDImpl _value,
      $Res Function(_$ReceivedProductIDImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = null,
  }) {
    return _then(_$ReceivedProductIDImpl(
      null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReceivedProductIDImpl implements ReceivedProductID {
  const _$ReceivedProductIDImpl(this.productID);

  @override
  final int productID;

  @override
  String toString() {
    return 'MyRequestState.receivedProductID(productID: $productID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceivedProductIDImpl &&
            (identical(other.productID, productID) ||
                other.productID == productID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceivedProductIDImplCopyWith<_$ReceivedProductIDImpl> get copyWith =>
      __$$ReceivedProductIDImplCopyWithImpl<_$ReceivedProductIDImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(int index, double qty) incrementQty,
    required TResult Function(int index, double qty) decrementQty,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(int productID) receivedProductID,
    required TResult Function() receiveLoading,
  }) {
    return receivedProductID(productID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(int index, double qty)? incrementQty,
    TResult? Function(int index, double qty)? decrementQty,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(int productID)? receivedProductID,
    TResult? Function()? receiveLoading,
  }) {
    return receivedProductID?.call(productID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(int index, double qty)? incrementQty,
    TResult Function(int index, double qty)? decrementQty,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(int productID)? receivedProductID,
    TResult Function()? receiveLoading,
    required TResult orElse(),
  }) {
    if (receivedProductID != null) {
      return receivedProductID(productID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(ReceivedProductID value) receivedProductID,
    required TResult Function(ReceiveLoading value) receiveLoading,
  }) {
    return receivedProductID(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(ReceivedProductID value)? receivedProductID,
    TResult? Function(ReceiveLoading value)? receiveLoading,
  }) {
    return receivedProductID?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(ReceivedProductID value)? receivedProductID,
    TResult Function(ReceiveLoading value)? receiveLoading,
    required TResult orElse(),
  }) {
    if (receivedProductID != null) {
      return receivedProductID(this);
    }
    return orElse();
  }
}

abstract class ReceivedProductID implements MyRequestState {
  const factory ReceivedProductID(final int productID) =
      _$ReceivedProductIDImpl;

  int get productID;
  @JsonKey(ignore: true)
  _$$ReceivedProductIDImplCopyWith<_$ReceivedProductIDImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiveLoadingImplCopyWith<$Res> {
  factory _$$ReceiveLoadingImplCopyWith(_$ReceiveLoadingImpl value,
          $Res Function(_$ReceiveLoadingImpl) then) =
      __$$ReceiveLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReceiveLoadingImplCopyWithImpl<$Res>
    extends _$MyRequestStateCopyWithImpl<$Res, _$ReceiveLoadingImpl>
    implements _$$ReceiveLoadingImplCopyWith<$Res> {
  __$$ReceiveLoadingImplCopyWithImpl(
      _$ReceiveLoadingImpl _value, $Res Function(_$ReceiveLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReceiveLoadingImpl implements ReceiveLoading {
  const _$ReceiveLoadingImpl();

  @override
  String toString() {
    return 'MyRequestState.receiveLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReceiveLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MyRequest> myRequestList) loadMyRequestData,
    required TResult Function(int index, double qty) incrementQty,
    required TResult Function(int index, double qty) decrementQty,
    required TResult Function(bool isExit) isDataExist,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
    required TResult Function(int productID) receivedProductID,
    required TResult Function() receiveLoading,
  }) {
    return receiveLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult? Function(int index, double qty)? incrementQty,
    TResult? Function(int index, double qty)? decrementQty,
    TResult? Function(bool isExit)? isDataExist,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
    TResult? Function(int productID)? receivedProductID,
    TResult? Function()? receiveLoading,
  }) {
    return receiveLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MyRequest> myRequestList)? loadMyRequestData,
    TResult Function(int index, double qty)? incrementQty,
    TResult Function(int index, double qty)? decrementQty,
    TResult Function(bool isExit)? isDataExist,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    TResult Function(int productID)? receivedProductID,
    TResult Function()? receiveLoading,
    required TResult orElse(),
  }) {
    if (receiveLoading != null) {
      return receiveLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyRequestList value) loadMyRequestData,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(IsDataExit value) isDataExist,
    required TResult Function(Initial value) initial,
    required TResult Function(MyRequestLoading value) loading,
    required TResult Function(Error value) error,
    required TResult Function(ReceivedProductID value) receivedProductID,
    required TResult Function(ReceiveLoading value) receiveLoading,
  }) {
    return receiveLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyRequestList value)? loadMyRequestData,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(IsDataExit value)? isDataExist,
    TResult? Function(Initial value)? initial,
    TResult? Function(MyRequestLoading value)? loading,
    TResult? Function(Error value)? error,
    TResult? Function(ReceivedProductID value)? receivedProductID,
    TResult? Function(ReceiveLoading value)? receiveLoading,
  }) {
    return receiveLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyRequestList value)? loadMyRequestData,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(IsDataExit value)? isDataExist,
    TResult Function(Initial value)? initial,
    TResult Function(MyRequestLoading value)? loading,
    TResult Function(Error value)? error,
    TResult Function(ReceivedProductID value)? receivedProductID,
    TResult Function(ReceiveLoading value)? receiveLoading,
    required TResult orElse(),
  }) {
    if (receiveLoading != null) {
      return receiveLoading(this);
    }
    return orElse();
  }
}

abstract class ReceiveLoading implements MyRequestState {
  const factory ReceiveLoading() = _$ReceiveLoadingImpl;
}
