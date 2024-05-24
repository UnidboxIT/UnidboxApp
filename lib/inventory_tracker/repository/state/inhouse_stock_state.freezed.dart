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
    required TResult Function(int uomIndex) selectedBox,
    required TResult Function(int qty) incrementQty,
    required TResult Function(int qty) decrementQty,
    required TResult Function(bool selectedUrgent) urgent,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult? Function(int uomIndex)? selectedBox,
    TResult? Function(int qty)? incrementQty,
    TResult? Function(int qty)? decrementQty,
    TResult? Function(bool selectedUrgent)? urgent,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult Function(int uomIndex)? selectedBox,
    TResult Function(int qty)? incrementQty,
    TResult Function(int qty)? decrementQty,
    TResult Function(bool selectedUrgent)? urgent,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InhouseStockList value) loadInHouseStock,
    required TResult Function(SelectedBoxType value) selectedBox,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(Urgent value) urgent,
    required TResult Function(Initial value) initial,
    required TResult Function(InHouseLoading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InhouseStockList value)? loadInHouseStock,
    TResult? Function(SelectedBoxType value)? selectedBox,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(Urgent value)? urgent,
    TResult? Function(Initial value)? initial,
    TResult? Function(InHouseLoading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InhouseStockList value)? loadInHouseStock,
    TResult Function(SelectedBoxType value)? selectedBox,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(Urgent value)? urgent,
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
    required TResult Function(int uomIndex) selectedBox,
    required TResult Function(int qty) incrementQty,
    required TResult Function(int qty) decrementQty,
    required TResult Function(bool selectedUrgent) urgent,
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
    TResult? Function(int uomIndex)? selectedBox,
    TResult? Function(int qty)? incrementQty,
    TResult? Function(int qty)? decrementQty,
    TResult? Function(bool selectedUrgent)? urgent,
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
    TResult Function(int uomIndex)? selectedBox,
    TResult Function(int qty)? incrementQty,
    TResult Function(int qty)? decrementQty,
    TResult Function(bool selectedUrgent)? urgent,
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
    required TResult Function(SelectedBoxType value) selectedBox,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(Urgent value) urgent,
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
    TResult? Function(SelectedBoxType value)? selectedBox,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(Urgent value)? urgent,
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
    TResult Function(SelectedBoxType value)? selectedBox,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(Urgent value)? urgent,
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
abstract class _$$SelectedBoxTypeImplCopyWith<$Res> {
  factory _$$SelectedBoxTypeImplCopyWith(_$SelectedBoxTypeImpl value,
          $Res Function(_$SelectedBoxTypeImpl) then) =
      __$$SelectedBoxTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int uomIndex});
}

/// @nodoc
class __$$SelectedBoxTypeImplCopyWithImpl<$Res>
    extends _$InhouseStockStateCopyWithImpl<$Res, _$SelectedBoxTypeImpl>
    implements _$$SelectedBoxTypeImplCopyWith<$Res> {
  __$$SelectedBoxTypeImplCopyWithImpl(
      _$SelectedBoxTypeImpl _value, $Res Function(_$SelectedBoxTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uomIndex = null,
  }) {
    return _then(_$SelectedBoxTypeImpl(
      null == uomIndex
          ? _value.uomIndex
          : uomIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectedBoxTypeImpl implements SelectedBoxType {
  const _$SelectedBoxTypeImpl(this.uomIndex);

  @override
  final int uomIndex;

  @override
  String toString() {
    return 'InhouseStockState.selectedBox(uomIndex: $uomIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedBoxTypeImpl &&
            (identical(other.uomIndex, uomIndex) ||
                other.uomIndex == uomIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uomIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedBoxTypeImplCopyWith<_$SelectedBoxTypeImpl> get copyWith =>
      __$$SelectedBoxTypeImplCopyWithImpl<_$SelectedBoxTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InhouseStock> inhouseStock) loadInHouseStock,
    required TResult Function(int uomIndex) selectedBox,
    required TResult Function(int qty) incrementQty,
    required TResult Function(int qty) decrementQty,
    required TResult Function(bool selectedUrgent) urgent,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return selectedBox(uomIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult? Function(int uomIndex)? selectedBox,
    TResult? Function(int qty)? incrementQty,
    TResult? Function(int qty)? decrementQty,
    TResult? Function(bool selectedUrgent)? urgent,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return selectedBox?.call(uomIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult Function(int uomIndex)? selectedBox,
    TResult Function(int qty)? incrementQty,
    TResult Function(int qty)? decrementQty,
    TResult Function(bool selectedUrgent)? urgent,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (selectedBox != null) {
      return selectedBox(uomIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InhouseStockList value) loadInHouseStock,
    required TResult Function(SelectedBoxType value) selectedBox,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(Urgent value) urgent,
    required TResult Function(Initial value) initial,
    required TResult Function(InHouseLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return selectedBox(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InhouseStockList value)? loadInHouseStock,
    TResult? Function(SelectedBoxType value)? selectedBox,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(Urgent value)? urgent,
    TResult? Function(Initial value)? initial,
    TResult? Function(InHouseLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return selectedBox?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InhouseStockList value)? loadInHouseStock,
    TResult Function(SelectedBoxType value)? selectedBox,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(Urgent value)? urgent,
    TResult Function(Initial value)? initial,
    TResult Function(InHouseLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (selectedBox != null) {
      return selectedBox(this);
    }
    return orElse();
  }
}

abstract class SelectedBoxType implements InhouseStockState {
  const factory SelectedBoxType(final int uomIndex) = _$SelectedBoxTypeImpl;

  int get uomIndex;
  @JsonKey(ignore: true)
  _$$SelectedBoxTypeImplCopyWith<_$SelectedBoxTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncrementQtyImplCopyWith<$Res> {
  factory _$$IncrementQtyImplCopyWith(
          _$IncrementQtyImpl value, $Res Function(_$IncrementQtyImpl) then) =
      __$$IncrementQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int qty});
}

/// @nodoc
class __$$IncrementQtyImplCopyWithImpl<$Res>
    extends _$InhouseStockStateCopyWithImpl<$Res, _$IncrementQtyImpl>
    implements _$$IncrementQtyImplCopyWith<$Res> {
  __$$IncrementQtyImplCopyWithImpl(
      _$IncrementQtyImpl _value, $Res Function(_$IncrementQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
  }) {
    return _then(_$IncrementQtyImpl(
      null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IncrementQtyImpl implements IncrementQty {
  const _$IncrementQtyImpl(this.qty);

  @override
  final int qty;

  @override
  String toString() {
    return 'InhouseStockState.incrementQty(qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncrementQtyImpl &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncrementQtyImplCopyWith<_$IncrementQtyImpl> get copyWith =>
      __$$IncrementQtyImplCopyWithImpl<_$IncrementQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InhouseStock> inhouseStock) loadInHouseStock,
    required TResult Function(int uomIndex) selectedBox,
    required TResult Function(int qty) incrementQty,
    required TResult Function(int qty) decrementQty,
    required TResult Function(bool selectedUrgent) urgent,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return incrementQty(qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult? Function(int uomIndex)? selectedBox,
    TResult? Function(int qty)? incrementQty,
    TResult? Function(int qty)? decrementQty,
    TResult? Function(bool selectedUrgent)? urgent,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return incrementQty?.call(qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult Function(int uomIndex)? selectedBox,
    TResult Function(int qty)? incrementQty,
    TResult Function(int qty)? decrementQty,
    TResult Function(bool selectedUrgent)? urgent,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (incrementQty != null) {
      return incrementQty(qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InhouseStockList value) loadInHouseStock,
    required TResult Function(SelectedBoxType value) selectedBox,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(Urgent value) urgent,
    required TResult Function(Initial value) initial,
    required TResult Function(InHouseLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return incrementQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InhouseStockList value)? loadInHouseStock,
    TResult? Function(SelectedBoxType value)? selectedBox,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(Urgent value)? urgent,
    TResult? Function(Initial value)? initial,
    TResult? Function(InHouseLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return incrementQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InhouseStockList value)? loadInHouseStock,
    TResult Function(SelectedBoxType value)? selectedBox,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(Urgent value)? urgent,
    TResult Function(Initial value)? initial,
    TResult Function(InHouseLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (incrementQty != null) {
      return incrementQty(this);
    }
    return orElse();
  }
}

abstract class IncrementQty implements InhouseStockState {
  const factory IncrementQty(final int qty) = _$IncrementQtyImpl;

  int get qty;
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
  $Res call({int qty});
}

/// @nodoc
class __$$DecrementQtyImplCopyWithImpl<$Res>
    extends _$InhouseStockStateCopyWithImpl<$Res, _$DecrementQtyImpl>
    implements _$$DecrementQtyImplCopyWith<$Res> {
  __$$DecrementQtyImplCopyWithImpl(
      _$DecrementQtyImpl _value, $Res Function(_$DecrementQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
  }) {
    return _then(_$DecrementQtyImpl(
      null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DecrementQtyImpl implements DecrementQty {
  const _$DecrementQtyImpl(this.qty);

  @override
  final int qty;

  @override
  String toString() {
    return 'InhouseStockState.decrementQty(qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecrementQtyImpl &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecrementQtyImplCopyWith<_$DecrementQtyImpl> get copyWith =>
      __$$DecrementQtyImplCopyWithImpl<_$DecrementQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InhouseStock> inhouseStock) loadInHouseStock,
    required TResult Function(int uomIndex) selectedBox,
    required TResult Function(int qty) incrementQty,
    required TResult Function(int qty) decrementQty,
    required TResult Function(bool selectedUrgent) urgent,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return decrementQty(qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult? Function(int uomIndex)? selectedBox,
    TResult? Function(int qty)? incrementQty,
    TResult? Function(int qty)? decrementQty,
    TResult? Function(bool selectedUrgent)? urgent,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return decrementQty?.call(qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult Function(int uomIndex)? selectedBox,
    TResult Function(int qty)? incrementQty,
    TResult Function(int qty)? decrementQty,
    TResult Function(bool selectedUrgent)? urgent,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (decrementQty != null) {
      return decrementQty(qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InhouseStockList value) loadInHouseStock,
    required TResult Function(SelectedBoxType value) selectedBox,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(Urgent value) urgent,
    required TResult Function(Initial value) initial,
    required TResult Function(InHouseLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return decrementQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InhouseStockList value)? loadInHouseStock,
    TResult? Function(SelectedBoxType value)? selectedBox,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(Urgent value)? urgent,
    TResult? Function(Initial value)? initial,
    TResult? Function(InHouseLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return decrementQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InhouseStockList value)? loadInHouseStock,
    TResult Function(SelectedBoxType value)? selectedBox,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(Urgent value)? urgent,
    TResult Function(Initial value)? initial,
    TResult Function(InHouseLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (decrementQty != null) {
      return decrementQty(this);
    }
    return orElse();
  }
}

abstract class DecrementQty implements InhouseStockState {
  const factory DecrementQty(final int qty) = _$DecrementQtyImpl;

  int get qty;
  @JsonKey(ignore: true)
  _$$DecrementQtyImplCopyWith<_$DecrementQtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UrgentImplCopyWith<$Res> {
  factory _$$UrgentImplCopyWith(
          _$UrgentImpl value, $Res Function(_$UrgentImpl) then) =
      __$$UrgentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool selectedUrgent});
}

/// @nodoc
class __$$UrgentImplCopyWithImpl<$Res>
    extends _$InhouseStockStateCopyWithImpl<$Res, _$UrgentImpl>
    implements _$$UrgentImplCopyWith<$Res> {
  __$$UrgentImplCopyWithImpl(
      _$UrgentImpl _value, $Res Function(_$UrgentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedUrgent = null,
  }) {
    return _then(_$UrgentImpl(
      null == selectedUrgent
          ? _value.selectedUrgent
          : selectedUrgent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UrgentImpl implements Urgent {
  const _$UrgentImpl(this.selectedUrgent);

  @override
  final bool selectedUrgent;

  @override
  String toString() {
    return 'InhouseStockState.urgent(selectedUrgent: $selectedUrgent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UrgentImpl &&
            (identical(other.selectedUrgent, selectedUrgent) ||
                other.selectedUrgent == selectedUrgent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedUrgent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UrgentImplCopyWith<_$UrgentImpl> get copyWith =>
      __$$UrgentImplCopyWithImpl<_$UrgentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InhouseStock> inhouseStock) loadInHouseStock,
    required TResult Function(int uomIndex) selectedBox,
    required TResult Function(int qty) incrementQty,
    required TResult Function(int qty) decrementQty,
    required TResult Function(bool selectedUrgent) urgent,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return urgent(selectedUrgent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult? Function(int uomIndex)? selectedBox,
    TResult? Function(int qty)? incrementQty,
    TResult? Function(int qty)? decrementQty,
    TResult? Function(bool selectedUrgent)? urgent,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return urgent?.call(selectedUrgent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InhouseStock> inhouseStock)? loadInHouseStock,
    TResult Function(int uomIndex)? selectedBox,
    TResult Function(int qty)? incrementQty,
    TResult Function(int qty)? decrementQty,
    TResult Function(bool selectedUrgent)? urgent,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (urgent != null) {
      return urgent(selectedUrgent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InhouseStockList value) loadInHouseStock,
    required TResult Function(SelectedBoxType value) selectedBox,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(Urgent value) urgent,
    required TResult Function(Initial value) initial,
    required TResult Function(InHouseLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return urgent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InhouseStockList value)? loadInHouseStock,
    TResult? Function(SelectedBoxType value)? selectedBox,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(Urgent value)? urgent,
    TResult? Function(Initial value)? initial,
    TResult? Function(InHouseLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return urgent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InhouseStockList value)? loadInHouseStock,
    TResult Function(SelectedBoxType value)? selectedBox,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(Urgent value)? urgent,
    TResult Function(Initial value)? initial,
    TResult Function(InHouseLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (urgent != null) {
      return urgent(this);
    }
    return orElse();
  }
}

abstract class Urgent implements InhouseStockState {
  const factory Urgent(final bool selectedUrgent) = _$UrgentImpl;

  bool get selectedUrgent;
  @JsonKey(ignore: true)
  _$$UrgentImplCopyWith<_$UrgentImpl> get copyWith =>
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
    required TResult Function(int uomIndex) selectedBox,
    required TResult Function(int qty) incrementQty,
    required TResult Function(int qty) decrementQty,
    required TResult Function(bool selectedUrgent) urgent,
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
    TResult? Function(int uomIndex)? selectedBox,
    TResult? Function(int qty)? incrementQty,
    TResult? Function(int qty)? decrementQty,
    TResult? Function(bool selectedUrgent)? urgent,
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
    TResult Function(int uomIndex)? selectedBox,
    TResult Function(int qty)? incrementQty,
    TResult Function(int qty)? decrementQty,
    TResult Function(bool selectedUrgent)? urgent,
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
    required TResult Function(SelectedBoxType value) selectedBox,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(Urgent value) urgent,
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
    TResult? Function(SelectedBoxType value)? selectedBox,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(Urgent value)? urgent,
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
    TResult Function(SelectedBoxType value)? selectedBox,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(Urgent value)? urgent,
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
    required TResult Function(int uomIndex) selectedBox,
    required TResult Function(int qty) incrementQty,
    required TResult Function(int qty) decrementQty,
    required TResult Function(bool selectedUrgent) urgent,
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
    TResult? Function(int uomIndex)? selectedBox,
    TResult? Function(int qty)? incrementQty,
    TResult? Function(int qty)? decrementQty,
    TResult? Function(bool selectedUrgent)? urgent,
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
    TResult Function(int uomIndex)? selectedBox,
    TResult Function(int qty)? incrementQty,
    TResult Function(int qty)? decrementQty,
    TResult Function(bool selectedUrgent)? urgent,
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
    required TResult Function(SelectedBoxType value) selectedBox,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(Urgent value) urgent,
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
    TResult? Function(SelectedBoxType value)? selectedBox,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(Urgent value)? urgent,
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
    TResult Function(SelectedBoxType value)? selectedBox,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(Urgent value)? urgent,
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
    required TResult Function(int uomIndex) selectedBox,
    required TResult Function(int qty) incrementQty,
    required TResult Function(int qty) decrementQty,
    required TResult Function(bool selectedUrgent) urgent,
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
    TResult? Function(int uomIndex)? selectedBox,
    TResult? Function(int qty)? incrementQty,
    TResult? Function(int qty)? decrementQty,
    TResult? Function(bool selectedUrgent)? urgent,
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
    TResult Function(int uomIndex)? selectedBox,
    TResult Function(int qty)? incrementQty,
    TResult Function(int qty)? decrementQty,
    TResult Function(bool selectedUrgent)? urgent,
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
    required TResult Function(SelectedBoxType value) selectedBox,
    required TResult Function(IncrementQty value) incrementQty,
    required TResult Function(DecrementQty value) decrementQty,
    required TResult Function(Urgent value) urgent,
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
    TResult? Function(SelectedBoxType value)? selectedBox,
    TResult? Function(IncrementQty value)? incrementQty,
    TResult? Function(DecrementQty value)? decrementQty,
    TResult? Function(Urgent value)? urgent,
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
    TResult Function(SelectedBoxType value)? selectedBox,
    TResult Function(IncrementQty value)? incrementQty,
    TResult Function(DecrementQty value)? decrementQty,
    TResult Function(Urgent value)? urgent,
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
