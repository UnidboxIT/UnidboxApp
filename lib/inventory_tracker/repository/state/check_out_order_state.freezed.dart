// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_out_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckOutOrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String success) success,
    required TResult Function(double totalPrice) calculateTotalPrice,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String success)? success,
    TResult? Function(double totalPrice)? calculateTotalPrice,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String success)? success,
    TResult Function(double totalPrice)? calculateTotalPrice,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Successful value) success,
    required TResult Function(CalculateTotalPrice value) calculateTotalPrice,
    required TResult Function(Initial value) initial,
    required TResult Function(CheckOutLoading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Successful value)? success,
    TResult? Function(CalculateTotalPrice value)? calculateTotalPrice,
    TResult? Function(Initial value)? initial,
    TResult? Function(CheckOutLoading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Successful value)? success,
    TResult Function(CalculateTotalPrice value)? calculateTotalPrice,
    TResult Function(Initial value)? initial,
    TResult Function(CheckOutLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckOutOrderStateCopyWith<$Res> {
  factory $CheckOutOrderStateCopyWith(
          CheckOutOrderState value, $Res Function(CheckOutOrderState) then) =
      _$CheckOutOrderStateCopyWithImpl<$Res, CheckOutOrderState>;
}

/// @nodoc
class _$CheckOutOrderStateCopyWithImpl<$Res, $Val extends CheckOutOrderState>
    implements $CheckOutOrderStateCopyWith<$Res> {
  _$CheckOutOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessfulImplCopyWith<$Res> {
  factory _$$SuccessfulImplCopyWith(
          _$SuccessfulImpl value, $Res Function(_$SuccessfulImpl) then) =
      __$$SuccessfulImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String success});
}

/// @nodoc
class __$$SuccessfulImplCopyWithImpl<$Res>
    extends _$CheckOutOrderStateCopyWithImpl<$Res, _$SuccessfulImpl>
    implements _$$SuccessfulImplCopyWith<$Res> {
  __$$SuccessfulImplCopyWithImpl(
      _$SuccessfulImpl _value, $Res Function(_$SuccessfulImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_$SuccessfulImpl(
      null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessfulImpl implements Successful {
  const _$SuccessfulImpl(this.success);

  @override
  final String success;

  @override
  String toString() {
    return 'CheckOutOrderState.success(success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessfulImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessfulImplCopyWith<_$SuccessfulImpl> get copyWith =>
      __$$SuccessfulImplCopyWithImpl<_$SuccessfulImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String success) success,
    required TResult Function(double totalPrice) calculateTotalPrice,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return success(this.success);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String success)? success,
    TResult? Function(double totalPrice)? calculateTotalPrice,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return success?.call(this.success);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String success)? success,
    TResult Function(double totalPrice)? calculateTotalPrice,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
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
    required TResult Function(Successful value) success,
    required TResult Function(CalculateTotalPrice value) calculateTotalPrice,
    required TResult Function(Initial value) initial,
    required TResult Function(CheckOutLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Successful value)? success,
    TResult? Function(CalculateTotalPrice value)? calculateTotalPrice,
    TResult? Function(Initial value)? initial,
    TResult? Function(CheckOutLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Successful value)? success,
    TResult Function(CalculateTotalPrice value)? calculateTotalPrice,
    TResult Function(Initial value)? initial,
    TResult Function(CheckOutLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Successful implements CheckOutOrderState {
  const factory Successful(final String success) = _$SuccessfulImpl;

  String get success;
  @JsonKey(ignore: true)
  _$$SuccessfulImplCopyWith<_$SuccessfulImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CalculateTotalPriceImplCopyWith<$Res> {
  factory _$$CalculateTotalPriceImplCopyWith(_$CalculateTotalPriceImpl value,
          $Res Function(_$CalculateTotalPriceImpl) then) =
      __$$CalculateTotalPriceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double totalPrice});
}

/// @nodoc
class __$$CalculateTotalPriceImplCopyWithImpl<$Res>
    extends _$CheckOutOrderStateCopyWithImpl<$Res, _$CalculateTotalPriceImpl>
    implements _$$CalculateTotalPriceImplCopyWith<$Res> {
  __$$CalculateTotalPriceImplCopyWithImpl(_$CalculateTotalPriceImpl _value,
      $Res Function(_$CalculateTotalPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPrice = null,
  }) {
    return _then(_$CalculateTotalPriceImpl(
      null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CalculateTotalPriceImpl implements CalculateTotalPrice {
  const _$CalculateTotalPriceImpl(this.totalPrice);

  @override
  final double totalPrice;

  @override
  String toString() {
    return 'CheckOutOrderState.calculateTotalPrice(totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculateTotalPriceImpl &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculateTotalPriceImplCopyWith<_$CalculateTotalPriceImpl> get copyWith =>
      __$$CalculateTotalPriceImplCopyWithImpl<_$CalculateTotalPriceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String success) success,
    required TResult Function(double totalPrice) calculateTotalPrice,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return calculateTotalPrice(totalPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String success)? success,
    TResult? Function(double totalPrice)? calculateTotalPrice,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return calculateTotalPrice?.call(totalPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String success)? success,
    TResult Function(double totalPrice)? calculateTotalPrice,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (calculateTotalPrice != null) {
      return calculateTotalPrice(totalPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Successful value) success,
    required TResult Function(CalculateTotalPrice value) calculateTotalPrice,
    required TResult Function(Initial value) initial,
    required TResult Function(CheckOutLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return calculateTotalPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Successful value)? success,
    TResult? Function(CalculateTotalPrice value)? calculateTotalPrice,
    TResult? Function(Initial value)? initial,
    TResult? Function(CheckOutLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return calculateTotalPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Successful value)? success,
    TResult Function(CalculateTotalPrice value)? calculateTotalPrice,
    TResult Function(Initial value)? initial,
    TResult Function(CheckOutLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (calculateTotalPrice != null) {
      return calculateTotalPrice(this);
    }
    return orElse();
  }
}

abstract class CalculateTotalPrice implements CheckOutOrderState {
  const factory CalculateTotalPrice(final double totalPrice) =
      _$CalculateTotalPriceImpl;

  double get totalPrice;
  @JsonKey(ignore: true)
  _$$CalculateTotalPriceImplCopyWith<_$CalculateTotalPriceImpl> get copyWith =>
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
    extends _$CheckOutOrderStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CheckOutOrderState.initial()';
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
    required TResult Function(String success) success,
    required TResult Function(double totalPrice) calculateTotalPrice,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String success)? success,
    TResult? Function(double totalPrice)? calculateTotalPrice,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String success)? success,
    TResult Function(double totalPrice)? calculateTotalPrice,
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
    required TResult Function(Successful value) success,
    required TResult Function(CalculateTotalPrice value) calculateTotalPrice,
    required TResult Function(Initial value) initial,
    required TResult Function(CheckOutLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Successful value)? success,
    TResult? Function(CalculateTotalPrice value)? calculateTotalPrice,
    TResult? Function(Initial value)? initial,
    TResult? Function(CheckOutLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Successful value)? success,
    TResult Function(CalculateTotalPrice value)? calculateTotalPrice,
    TResult Function(Initial value)? initial,
    TResult Function(CheckOutLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements CheckOutOrderState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CheckOutLoadingImplCopyWith<$Res> {
  factory _$$CheckOutLoadingImplCopyWith(_$CheckOutLoadingImpl value,
          $Res Function(_$CheckOutLoadingImpl) then) =
      __$$CheckOutLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckOutLoadingImplCopyWithImpl<$Res>
    extends _$CheckOutOrderStateCopyWithImpl<$Res, _$CheckOutLoadingImpl>
    implements _$$CheckOutLoadingImplCopyWith<$Res> {
  __$$CheckOutLoadingImplCopyWithImpl(
      _$CheckOutLoadingImpl _value, $Res Function(_$CheckOutLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckOutLoadingImpl implements CheckOutLoading {
  const _$CheckOutLoadingImpl();

  @override
  String toString() {
    return 'CheckOutOrderState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckOutLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String success) success,
    required TResult Function(double totalPrice) calculateTotalPrice,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String success)? success,
    TResult? Function(double totalPrice)? calculateTotalPrice,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String success)? success,
    TResult Function(double totalPrice)? calculateTotalPrice,
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
    required TResult Function(Successful value) success,
    required TResult Function(CalculateTotalPrice value) calculateTotalPrice,
    required TResult Function(Initial value) initial,
    required TResult Function(CheckOutLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Successful value)? success,
    TResult? Function(CalculateTotalPrice value)? calculateTotalPrice,
    TResult? Function(Initial value)? initial,
    TResult? Function(CheckOutLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Successful value)? success,
    TResult Function(CalculateTotalPrice value)? calculateTotalPrice,
    TResult Function(Initial value)? initial,
    TResult Function(CheckOutLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CheckOutLoading implements CheckOutOrderState {
  const factory CheckOutLoading() = _$CheckOutLoadingImpl;
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
    extends _$CheckOutOrderStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'CheckOutOrderState.error(error: $error)';
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
    required TResult Function(String success) success,
    required TResult Function(double totalPrice) calculateTotalPrice,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String success)? success,
    TResult? Function(double totalPrice)? calculateTotalPrice,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String success)? success,
    TResult Function(double totalPrice)? calculateTotalPrice,
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
    required TResult Function(Successful value) success,
    required TResult Function(CalculateTotalPrice value) calculateTotalPrice,
    required TResult Function(Initial value) initial,
    required TResult Function(CheckOutLoading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Successful value)? success,
    TResult? Function(CalculateTotalPrice value)? calculateTotalPrice,
    TResult? Function(Initial value)? initial,
    TResult? Function(CheckOutLoading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Successful value)? success,
    TResult Function(CalculateTotalPrice value)? calculateTotalPrice,
    TResult Function(Initial value)? initial,
    TResult Function(CheckOutLoading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements CheckOutOrderState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
