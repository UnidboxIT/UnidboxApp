// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReturnRequestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, int qty) incrementQty,
    required TResult Function(int index, int qty) decrementQty,
    required TResult Function(int index, int qty) addQtyTextFieldValue,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int qty)? incrementQty,
    TResult? Function(int index, int qty)? decrementQty,
    TResult? Function(int index, int qty)? addQtyTextFieldValue,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int qty)? incrementQty,
    TResult Function(int index, int qty)? decrementQty,
    TResult Function(int index, int qty)? addQtyTextFieldValue,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncrementReturnQty value) incrementQty,
    required TResult Function(DecrementReturnQty value) decrementQty,
    required TResult Function(AddQtyTextFieldValue value) addQtyTextFieldValue,
    required TResult Function(Initial value) initial,
    required TResult Function(ReturnRequestLoading value) loading,
    required TResult Function(ReturnRequestError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementReturnQty value)? incrementQty,
    TResult? Function(DecrementReturnQty value)? decrementQty,
    TResult? Function(AddQtyTextFieldValue value)? addQtyTextFieldValue,
    TResult? Function(Initial value)? initial,
    TResult? Function(ReturnRequestLoading value)? loading,
    TResult? Function(ReturnRequestError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementReturnQty value)? incrementQty,
    TResult Function(DecrementReturnQty value)? decrementQty,
    TResult Function(AddQtyTextFieldValue value)? addQtyTextFieldValue,
    TResult Function(Initial value)? initial,
    TResult Function(ReturnRequestLoading value)? loading,
    TResult Function(ReturnRequestError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnRequestStateCopyWith<$Res> {
  factory $ReturnRequestStateCopyWith(
          ReturnRequestState value, $Res Function(ReturnRequestState) then) =
      _$ReturnRequestStateCopyWithImpl<$Res, ReturnRequestState>;
}

/// @nodoc
class _$ReturnRequestStateCopyWithImpl<$Res, $Val extends ReturnRequestState>
    implements $ReturnRequestStateCopyWith<$Res> {
  _$ReturnRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IncrementReturnQtyImplCopyWith<$Res> {
  factory _$$IncrementReturnQtyImplCopyWith(_$IncrementReturnQtyImpl value,
          $Res Function(_$IncrementReturnQtyImpl) then) =
      __$$IncrementReturnQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, int qty});
}

/// @nodoc
class __$$IncrementReturnQtyImplCopyWithImpl<$Res>
    extends _$ReturnRequestStateCopyWithImpl<$Res, _$IncrementReturnQtyImpl>
    implements _$$IncrementReturnQtyImplCopyWith<$Res> {
  __$$IncrementReturnQtyImplCopyWithImpl(_$IncrementReturnQtyImpl _value,
      $Res Function(_$IncrementReturnQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? qty = null,
  }) {
    return _then(_$IncrementReturnQtyImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IncrementReturnQtyImpl implements IncrementReturnQty {
  const _$IncrementReturnQtyImpl(this.index, this.qty);

  @override
  final int index;
  @override
  final int qty;

  @override
  String toString() {
    return 'ReturnRequestState.incrementQty(index: $index, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncrementReturnQtyImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncrementReturnQtyImplCopyWith<_$IncrementReturnQtyImpl> get copyWith =>
      __$$IncrementReturnQtyImplCopyWithImpl<_$IncrementReturnQtyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, int qty) incrementQty,
    required TResult Function(int index, int qty) decrementQty,
    required TResult Function(int index, int qty) addQtyTextFieldValue,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return incrementQty(index, qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int qty)? incrementQty,
    TResult? Function(int index, int qty)? decrementQty,
    TResult? Function(int index, int qty)? addQtyTextFieldValue,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return incrementQty?.call(index, qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int qty)? incrementQty,
    TResult Function(int index, int qty)? decrementQty,
    TResult Function(int index, int qty)? addQtyTextFieldValue,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
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
    required TResult Function(IncrementReturnQty value) incrementQty,
    required TResult Function(DecrementReturnQty value) decrementQty,
    required TResult Function(AddQtyTextFieldValue value) addQtyTextFieldValue,
    required TResult Function(Initial value) initial,
    required TResult Function(ReturnRequestLoading value) loading,
    required TResult Function(ReturnRequestError value) error,
  }) {
    return incrementQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementReturnQty value)? incrementQty,
    TResult? Function(DecrementReturnQty value)? decrementQty,
    TResult? Function(AddQtyTextFieldValue value)? addQtyTextFieldValue,
    TResult? Function(Initial value)? initial,
    TResult? Function(ReturnRequestLoading value)? loading,
    TResult? Function(ReturnRequestError value)? error,
  }) {
    return incrementQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementReturnQty value)? incrementQty,
    TResult Function(DecrementReturnQty value)? decrementQty,
    TResult Function(AddQtyTextFieldValue value)? addQtyTextFieldValue,
    TResult Function(Initial value)? initial,
    TResult Function(ReturnRequestLoading value)? loading,
    TResult Function(ReturnRequestError value)? error,
    required TResult orElse(),
  }) {
    if (incrementQty != null) {
      return incrementQty(this);
    }
    return orElse();
  }
}

abstract class IncrementReturnQty implements ReturnRequestState {
  const factory IncrementReturnQty(final int index, final int qty) =
      _$IncrementReturnQtyImpl;

  int get index;
  int get qty;
  @JsonKey(ignore: true)
  _$$IncrementReturnQtyImplCopyWith<_$IncrementReturnQtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecrementReturnQtyImplCopyWith<$Res> {
  factory _$$DecrementReturnQtyImplCopyWith(_$DecrementReturnQtyImpl value,
          $Res Function(_$DecrementReturnQtyImpl) then) =
      __$$DecrementReturnQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, int qty});
}

/// @nodoc
class __$$DecrementReturnQtyImplCopyWithImpl<$Res>
    extends _$ReturnRequestStateCopyWithImpl<$Res, _$DecrementReturnQtyImpl>
    implements _$$DecrementReturnQtyImplCopyWith<$Res> {
  __$$DecrementReturnQtyImplCopyWithImpl(_$DecrementReturnQtyImpl _value,
      $Res Function(_$DecrementReturnQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? qty = null,
  }) {
    return _then(_$DecrementReturnQtyImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DecrementReturnQtyImpl implements DecrementReturnQty {
  const _$DecrementReturnQtyImpl(this.index, this.qty);

  @override
  final int index;
  @override
  final int qty;

  @override
  String toString() {
    return 'ReturnRequestState.decrementQty(index: $index, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecrementReturnQtyImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecrementReturnQtyImplCopyWith<_$DecrementReturnQtyImpl> get copyWith =>
      __$$DecrementReturnQtyImplCopyWithImpl<_$DecrementReturnQtyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, int qty) incrementQty,
    required TResult Function(int index, int qty) decrementQty,
    required TResult Function(int index, int qty) addQtyTextFieldValue,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return decrementQty(index, qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int qty)? incrementQty,
    TResult? Function(int index, int qty)? decrementQty,
    TResult? Function(int index, int qty)? addQtyTextFieldValue,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return decrementQty?.call(index, qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int qty)? incrementQty,
    TResult Function(int index, int qty)? decrementQty,
    TResult Function(int index, int qty)? addQtyTextFieldValue,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
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
    required TResult Function(IncrementReturnQty value) incrementQty,
    required TResult Function(DecrementReturnQty value) decrementQty,
    required TResult Function(AddQtyTextFieldValue value) addQtyTextFieldValue,
    required TResult Function(Initial value) initial,
    required TResult Function(ReturnRequestLoading value) loading,
    required TResult Function(ReturnRequestError value) error,
  }) {
    return decrementQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementReturnQty value)? incrementQty,
    TResult? Function(DecrementReturnQty value)? decrementQty,
    TResult? Function(AddQtyTextFieldValue value)? addQtyTextFieldValue,
    TResult? Function(Initial value)? initial,
    TResult? Function(ReturnRequestLoading value)? loading,
    TResult? Function(ReturnRequestError value)? error,
  }) {
    return decrementQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementReturnQty value)? incrementQty,
    TResult Function(DecrementReturnQty value)? decrementQty,
    TResult Function(AddQtyTextFieldValue value)? addQtyTextFieldValue,
    TResult Function(Initial value)? initial,
    TResult Function(ReturnRequestLoading value)? loading,
    TResult Function(ReturnRequestError value)? error,
    required TResult orElse(),
  }) {
    if (decrementQty != null) {
      return decrementQty(this);
    }
    return orElse();
  }
}

abstract class DecrementReturnQty implements ReturnRequestState {
  const factory DecrementReturnQty(final int index, final int qty) =
      _$DecrementReturnQtyImpl;

  int get index;
  int get qty;
  @JsonKey(ignore: true)
  _$$DecrementReturnQtyImplCopyWith<_$DecrementReturnQtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddQtyTextFieldValueImplCopyWith<$Res> {
  factory _$$AddQtyTextFieldValueImplCopyWith(_$AddQtyTextFieldValueImpl value,
          $Res Function(_$AddQtyTextFieldValueImpl) then) =
      __$$AddQtyTextFieldValueImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, int qty});
}

/// @nodoc
class __$$AddQtyTextFieldValueImplCopyWithImpl<$Res>
    extends _$ReturnRequestStateCopyWithImpl<$Res, _$AddQtyTextFieldValueImpl>
    implements _$$AddQtyTextFieldValueImplCopyWith<$Res> {
  __$$AddQtyTextFieldValueImplCopyWithImpl(_$AddQtyTextFieldValueImpl _value,
      $Res Function(_$AddQtyTextFieldValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? qty = null,
  }) {
    return _then(_$AddQtyTextFieldValueImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddQtyTextFieldValueImpl implements AddQtyTextFieldValue {
  const _$AddQtyTextFieldValueImpl(this.index, this.qty);

  @override
  final int index;
  @override
  final int qty;

  @override
  String toString() {
    return 'ReturnRequestState.addQtyTextFieldValue(index: $index, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddQtyTextFieldValueImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddQtyTextFieldValueImplCopyWith<_$AddQtyTextFieldValueImpl>
      get copyWith =>
          __$$AddQtyTextFieldValueImplCopyWithImpl<_$AddQtyTextFieldValueImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, int qty) incrementQty,
    required TResult Function(int index, int qty) decrementQty,
    required TResult Function(int index, int qty) addQtyTextFieldValue,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return addQtyTextFieldValue(index, qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int qty)? incrementQty,
    TResult? Function(int index, int qty)? decrementQty,
    TResult? Function(int index, int qty)? addQtyTextFieldValue,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return addQtyTextFieldValue?.call(index, qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int qty)? incrementQty,
    TResult Function(int index, int qty)? decrementQty,
    TResult Function(int index, int qty)? addQtyTextFieldValue,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (addQtyTextFieldValue != null) {
      return addQtyTextFieldValue(index, qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IncrementReturnQty value) incrementQty,
    required TResult Function(DecrementReturnQty value) decrementQty,
    required TResult Function(AddQtyTextFieldValue value) addQtyTextFieldValue,
    required TResult Function(Initial value) initial,
    required TResult Function(ReturnRequestLoading value) loading,
    required TResult Function(ReturnRequestError value) error,
  }) {
    return addQtyTextFieldValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementReturnQty value)? incrementQty,
    TResult? Function(DecrementReturnQty value)? decrementQty,
    TResult? Function(AddQtyTextFieldValue value)? addQtyTextFieldValue,
    TResult? Function(Initial value)? initial,
    TResult? Function(ReturnRequestLoading value)? loading,
    TResult? Function(ReturnRequestError value)? error,
  }) {
    return addQtyTextFieldValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementReturnQty value)? incrementQty,
    TResult Function(DecrementReturnQty value)? decrementQty,
    TResult Function(AddQtyTextFieldValue value)? addQtyTextFieldValue,
    TResult Function(Initial value)? initial,
    TResult Function(ReturnRequestLoading value)? loading,
    TResult Function(ReturnRequestError value)? error,
    required TResult orElse(),
  }) {
    if (addQtyTextFieldValue != null) {
      return addQtyTextFieldValue(this);
    }
    return orElse();
  }
}

abstract class AddQtyTextFieldValue implements ReturnRequestState {
  const factory AddQtyTextFieldValue(final int index, final int qty) =
      _$AddQtyTextFieldValueImpl;

  int get index;
  int get qty;
  @JsonKey(ignore: true)
  _$$AddQtyTextFieldValueImplCopyWith<_$AddQtyTextFieldValueImpl>
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
    extends _$ReturnRequestStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ReturnRequestState.initial()';
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
    required TResult Function(int index, int qty) incrementQty,
    required TResult Function(int index, int qty) decrementQty,
    required TResult Function(int index, int qty) addQtyTextFieldValue,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int qty)? incrementQty,
    TResult? Function(int index, int qty)? decrementQty,
    TResult? Function(int index, int qty)? addQtyTextFieldValue,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int qty)? incrementQty,
    TResult Function(int index, int qty)? decrementQty,
    TResult Function(int index, int qty)? addQtyTextFieldValue,
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
    required TResult Function(IncrementReturnQty value) incrementQty,
    required TResult Function(DecrementReturnQty value) decrementQty,
    required TResult Function(AddQtyTextFieldValue value) addQtyTextFieldValue,
    required TResult Function(Initial value) initial,
    required TResult Function(ReturnRequestLoading value) loading,
    required TResult Function(ReturnRequestError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementReturnQty value)? incrementQty,
    TResult? Function(DecrementReturnQty value)? decrementQty,
    TResult? Function(AddQtyTextFieldValue value)? addQtyTextFieldValue,
    TResult? Function(Initial value)? initial,
    TResult? Function(ReturnRequestLoading value)? loading,
    TResult? Function(ReturnRequestError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementReturnQty value)? incrementQty,
    TResult Function(DecrementReturnQty value)? decrementQty,
    TResult Function(AddQtyTextFieldValue value)? addQtyTextFieldValue,
    TResult Function(Initial value)? initial,
    TResult Function(ReturnRequestLoading value)? loading,
    TResult Function(ReturnRequestError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ReturnRequestState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ReturnRequestLoadingImplCopyWith<$Res> {
  factory _$$ReturnRequestLoadingImplCopyWith(_$ReturnRequestLoadingImpl value,
          $Res Function(_$ReturnRequestLoadingImpl) then) =
      __$$ReturnRequestLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReturnRequestLoadingImplCopyWithImpl<$Res>
    extends _$ReturnRequestStateCopyWithImpl<$Res, _$ReturnRequestLoadingImpl>
    implements _$$ReturnRequestLoadingImplCopyWith<$Res> {
  __$$ReturnRequestLoadingImplCopyWithImpl(_$ReturnRequestLoadingImpl _value,
      $Res Function(_$ReturnRequestLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReturnRequestLoadingImpl implements ReturnRequestLoading {
  const _$ReturnRequestLoadingImpl();

  @override
  String toString() {
    return 'ReturnRequestState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnRequestLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, int qty) incrementQty,
    required TResult Function(int index, int qty) decrementQty,
    required TResult Function(int index, int qty) addQtyTextFieldValue,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int qty)? incrementQty,
    TResult? Function(int index, int qty)? decrementQty,
    TResult? Function(int index, int qty)? addQtyTextFieldValue,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int qty)? incrementQty,
    TResult Function(int index, int qty)? decrementQty,
    TResult Function(int index, int qty)? addQtyTextFieldValue,
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
    required TResult Function(IncrementReturnQty value) incrementQty,
    required TResult Function(DecrementReturnQty value) decrementQty,
    required TResult Function(AddQtyTextFieldValue value) addQtyTextFieldValue,
    required TResult Function(Initial value) initial,
    required TResult Function(ReturnRequestLoading value) loading,
    required TResult Function(ReturnRequestError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementReturnQty value)? incrementQty,
    TResult? Function(DecrementReturnQty value)? decrementQty,
    TResult? Function(AddQtyTextFieldValue value)? addQtyTextFieldValue,
    TResult? Function(Initial value)? initial,
    TResult? Function(ReturnRequestLoading value)? loading,
    TResult? Function(ReturnRequestError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementReturnQty value)? incrementQty,
    TResult Function(DecrementReturnQty value)? decrementQty,
    TResult Function(AddQtyTextFieldValue value)? addQtyTextFieldValue,
    TResult Function(Initial value)? initial,
    TResult Function(ReturnRequestLoading value)? loading,
    TResult Function(ReturnRequestError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ReturnRequestLoading implements ReturnRequestState {
  const factory ReturnRequestLoading() = _$ReturnRequestLoadingImpl;
}

/// @nodoc
abstract class _$$ReturnRequestErrorImplCopyWith<$Res> {
  factory _$$ReturnRequestErrorImplCopyWith(_$ReturnRequestErrorImpl value,
          $Res Function(_$ReturnRequestErrorImpl) then) =
      __$$ReturnRequestErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$ReturnRequestErrorImplCopyWithImpl<$Res>
    extends _$ReturnRequestStateCopyWithImpl<$Res, _$ReturnRequestErrorImpl>
    implements _$$ReturnRequestErrorImplCopyWith<$Res> {
  __$$ReturnRequestErrorImplCopyWithImpl(_$ReturnRequestErrorImpl _value,
      $Res Function(_$ReturnRequestErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ReturnRequestErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReturnRequestErrorImpl implements ReturnRequestError {
  const _$ReturnRequestErrorImpl({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'ReturnRequestState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnRequestErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnRequestErrorImplCopyWith<_$ReturnRequestErrorImpl> get copyWith =>
      __$$ReturnRequestErrorImplCopyWithImpl<_$ReturnRequestErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, int qty) incrementQty,
    required TResult Function(int index, int qty) decrementQty,
    required TResult Function(int index, int qty) addQtyTextFieldValue,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int qty)? incrementQty,
    TResult? Function(int index, int qty)? decrementQty,
    TResult? Function(int index, int qty)? addQtyTextFieldValue,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int qty)? incrementQty,
    TResult Function(int index, int qty)? decrementQty,
    TResult Function(int index, int qty)? addQtyTextFieldValue,
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
    required TResult Function(IncrementReturnQty value) incrementQty,
    required TResult Function(DecrementReturnQty value) decrementQty,
    required TResult Function(AddQtyTextFieldValue value) addQtyTextFieldValue,
    required TResult Function(Initial value) initial,
    required TResult Function(ReturnRequestLoading value) loading,
    required TResult Function(ReturnRequestError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IncrementReturnQty value)? incrementQty,
    TResult? Function(DecrementReturnQty value)? decrementQty,
    TResult? Function(AddQtyTextFieldValue value)? addQtyTextFieldValue,
    TResult? Function(Initial value)? initial,
    TResult? Function(ReturnRequestLoading value)? loading,
    TResult? Function(ReturnRequestError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IncrementReturnQty value)? incrementQty,
    TResult Function(DecrementReturnQty value)? decrementQty,
    TResult Function(AddQtyTextFieldValue value)? addQtyTextFieldValue,
    TResult Function(Initial value)? initial,
    TResult Function(ReturnRequestLoading value)? loading,
    TResult Function(ReturnRequestError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ReturnRequestError implements ReturnRequestState {
  const factory ReturnRequestError({final String? error}) =
      _$ReturnRequestErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ReturnRequestErrorImplCopyWith<_$ReturnRequestErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}