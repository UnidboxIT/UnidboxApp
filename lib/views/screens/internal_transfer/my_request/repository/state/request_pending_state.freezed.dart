// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_pending_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RequestPendingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isRequestUpdate, int productID)
        isRequestUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isRequestUpdate, int productID)? isRequestUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isRequestUpdate, int productID)? isRequestUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(IsRequestUpdate value) isRequestUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(IsRequestUpdate value)? isRequestUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(IsRequestUpdate value)? isRequestUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestPendingStateCopyWith<$Res> {
  factory $RequestPendingStateCopyWith(
          RequestPendingState value, $Res Function(RequestPendingState) then) =
      _$RequestPendingStateCopyWithImpl<$Res, RequestPendingState>;
}

/// @nodoc
class _$RequestPendingStateCopyWithImpl<$Res, $Val extends RequestPendingState>
    implements $RequestPendingStateCopyWith<$Res> {
  _$RequestPendingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RequestPendingStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'RequestPendingState.initial()';
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
    required TResult Function() initial,
    required TResult Function(bool isRequestUpdate, int productID)
        isRequestUpdate,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isRequestUpdate, int productID)? isRequestUpdate,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isRequestUpdate, int productID)? isRequestUpdate,
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
    required TResult Function(Initial value) initial,
    required TResult Function(IsRequestUpdate value) isRequestUpdate,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(IsRequestUpdate value)? isRequestUpdate,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(IsRequestUpdate value)? isRequestUpdate,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements RequestPendingState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$IsRequestUpdateImplCopyWith<$Res> {
  factory _$$IsRequestUpdateImplCopyWith(_$IsRequestUpdateImpl value,
          $Res Function(_$IsRequestUpdateImpl) then) =
      __$$IsRequestUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isRequestUpdate, int productID});
}

/// @nodoc
class __$$IsRequestUpdateImplCopyWithImpl<$Res>
    extends _$RequestPendingStateCopyWithImpl<$Res, _$IsRequestUpdateImpl>
    implements _$$IsRequestUpdateImplCopyWith<$Res> {
  __$$IsRequestUpdateImplCopyWithImpl(
      _$IsRequestUpdateImpl _value, $Res Function(_$IsRequestUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRequestUpdate = null,
    Object? productID = null,
  }) {
    return _then(_$IsRequestUpdateImpl(
      null == isRequestUpdate
          ? _value.isRequestUpdate
          : isRequestUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IsRequestUpdateImpl implements IsRequestUpdate {
  const _$IsRequestUpdateImpl(this.isRequestUpdate, this.productID);

  @override
  final bool isRequestUpdate;
  @override
  final int productID;

  @override
  String toString() {
    return 'RequestPendingState.isRequestUpdate(isRequestUpdate: $isRequestUpdate, productID: $productID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsRequestUpdateImpl &&
            (identical(other.isRequestUpdate, isRequestUpdate) ||
                other.isRequestUpdate == isRequestUpdate) &&
            (identical(other.productID, productID) ||
                other.productID == productID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRequestUpdate, productID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsRequestUpdateImplCopyWith<_$IsRequestUpdateImpl> get copyWith =>
      __$$IsRequestUpdateImplCopyWithImpl<_$IsRequestUpdateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isRequestUpdate, int productID)
        isRequestUpdate,
  }) {
    return isRequestUpdate(this.isRequestUpdate, productID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isRequestUpdate, int productID)? isRequestUpdate,
  }) {
    return isRequestUpdate?.call(this.isRequestUpdate, productID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isRequestUpdate, int productID)? isRequestUpdate,
    required TResult orElse(),
  }) {
    if (isRequestUpdate != null) {
      return isRequestUpdate(this.isRequestUpdate, productID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(IsRequestUpdate value) isRequestUpdate,
  }) {
    return isRequestUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(IsRequestUpdate value)? isRequestUpdate,
  }) {
    return isRequestUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(IsRequestUpdate value)? isRequestUpdate,
    required TResult orElse(),
  }) {
    if (isRequestUpdate != null) {
      return isRequestUpdate(this);
    }
    return orElse();
  }
}

abstract class IsRequestUpdate implements RequestPendingState {
  const factory IsRequestUpdate(
      final bool isRequestUpdate, final int productID) = _$IsRequestUpdateImpl;

  bool get isRequestUpdate;
  int get productID;
  @JsonKey(ignore: true)
  _$$IsRequestUpdateImplCopyWith<_$IsRequestUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
