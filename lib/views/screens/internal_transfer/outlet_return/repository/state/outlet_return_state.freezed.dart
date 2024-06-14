// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outlet_return_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OutletReturnState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<OtherRequest> outletReturnList)
        loadOtherRequestData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() acceptLoading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OtherRequest> outletReturnList)?
        loadOtherRequestData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? acceptLoading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OtherRequest> outletReturnList)? loadOtherRequestData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? acceptLoading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OutletReturnList value) loadOtherRequestData,
    required TResult Function(Initial value) initial,
    required TResult Function(OutletReturnLoading value) loading,
    required TResult Function(ReceiveLoading value) acceptLoading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutletReturnList value)? loadOtherRequestData,
    TResult? Function(Initial value)? initial,
    TResult? Function(OutletReturnLoading value)? loading,
    TResult? Function(ReceiveLoading value)? acceptLoading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutletReturnList value)? loadOtherRequestData,
    TResult Function(Initial value)? initial,
    TResult Function(OutletReturnLoading value)? loading,
    TResult Function(ReceiveLoading value)? acceptLoading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletReturnStateCopyWith<$Res> {
  factory $OutletReturnStateCopyWith(
          OutletReturnState value, $Res Function(OutletReturnState) then) =
      _$OutletReturnStateCopyWithImpl<$Res, OutletReturnState>;
}

/// @nodoc
class _$OutletReturnStateCopyWithImpl<$Res, $Val extends OutletReturnState>
    implements $OutletReturnStateCopyWith<$Res> {
  _$OutletReturnStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OutletReturnListImplCopyWith<$Res> {
  factory _$$OutletReturnListImplCopyWith(_$OutletReturnListImpl value,
          $Res Function(_$OutletReturnListImpl) then) =
      __$$OutletReturnListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OtherRequest> outletReturnList});
}

/// @nodoc
class __$$OutletReturnListImplCopyWithImpl<$Res>
    extends _$OutletReturnStateCopyWithImpl<$Res, _$OutletReturnListImpl>
    implements _$$OutletReturnListImplCopyWith<$Res> {
  __$$OutletReturnListImplCopyWithImpl(_$OutletReturnListImpl _value,
      $Res Function(_$OutletReturnListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletReturnList = null,
  }) {
    return _then(_$OutletReturnListImpl(
      null == outletReturnList
          ? _value._outletReturnList
          : outletReturnList // ignore: cast_nullable_to_non_nullable
              as List<OtherRequest>,
    ));
  }
}

/// @nodoc

class _$OutletReturnListImpl implements OutletReturnList {
  const _$OutletReturnListImpl(final List<OtherRequest> outletReturnList)
      : _outletReturnList = outletReturnList;

  final List<OtherRequest> _outletReturnList;
  @override
  List<OtherRequest> get outletReturnList {
    if (_outletReturnList is EqualUnmodifiableListView)
      return _outletReturnList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outletReturnList);
  }

  @override
  String toString() {
    return 'OutletReturnState.loadOtherRequestData(outletReturnList: $outletReturnList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletReturnListImpl &&
            const DeepCollectionEquality()
                .equals(other._outletReturnList, _outletReturnList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_outletReturnList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletReturnListImplCopyWith<_$OutletReturnListImpl> get copyWith =>
      __$$OutletReturnListImplCopyWithImpl<_$OutletReturnListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<OtherRequest> outletReturnList)
        loadOtherRequestData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() acceptLoading,
    required TResult Function(String? error) error,
  }) {
    return loadOtherRequestData(outletReturnList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OtherRequest> outletReturnList)?
        loadOtherRequestData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? acceptLoading,
    TResult? Function(String? error)? error,
  }) {
    return loadOtherRequestData?.call(outletReturnList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OtherRequest> outletReturnList)? loadOtherRequestData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? acceptLoading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadOtherRequestData != null) {
      return loadOtherRequestData(outletReturnList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OutletReturnList value) loadOtherRequestData,
    required TResult Function(Initial value) initial,
    required TResult Function(OutletReturnLoading value) loading,
    required TResult Function(ReceiveLoading value) acceptLoading,
    required TResult Function(Error value) error,
  }) {
    return loadOtherRequestData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutletReturnList value)? loadOtherRequestData,
    TResult? Function(Initial value)? initial,
    TResult? Function(OutletReturnLoading value)? loading,
    TResult? Function(ReceiveLoading value)? acceptLoading,
    TResult? Function(Error value)? error,
  }) {
    return loadOtherRequestData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutletReturnList value)? loadOtherRequestData,
    TResult Function(Initial value)? initial,
    TResult Function(OutletReturnLoading value)? loading,
    TResult Function(ReceiveLoading value)? acceptLoading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadOtherRequestData != null) {
      return loadOtherRequestData(this);
    }
    return orElse();
  }
}

abstract class OutletReturnList implements OutletReturnState {
  const factory OutletReturnList(final List<OtherRequest> outletReturnList) =
      _$OutletReturnListImpl;

  List<OtherRequest> get outletReturnList;
  @JsonKey(ignore: true)
  _$$OutletReturnListImplCopyWith<_$OutletReturnListImpl> get copyWith =>
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
    extends _$OutletReturnStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'OutletReturnState.initial()';
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
    required TResult Function(List<OtherRequest> outletReturnList)
        loadOtherRequestData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() acceptLoading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OtherRequest> outletReturnList)?
        loadOtherRequestData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? acceptLoading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OtherRequest> outletReturnList)? loadOtherRequestData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? acceptLoading,
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
    required TResult Function(OutletReturnList value) loadOtherRequestData,
    required TResult Function(Initial value) initial,
    required TResult Function(OutletReturnLoading value) loading,
    required TResult Function(ReceiveLoading value) acceptLoading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutletReturnList value)? loadOtherRequestData,
    TResult? Function(Initial value)? initial,
    TResult? Function(OutletReturnLoading value)? loading,
    TResult? Function(ReceiveLoading value)? acceptLoading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutletReturnList value)? loadOtherRequestData,
    TResult Function(Initial value)? initial,
    TResult Function(OutletReturnLoading value)? loading,
    TResult Function(ReceiveLoading value)? acceptLoading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements OutletReturnState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$OutletReturnLoadingImplCopyWith<$Res> {
  factory _$$OutletReturnLoadingImplCopyWith(_$OutletReturnLoadingImpl value,
          $Res Function(_$OutletReturnLoadingImpl) then) =
      __$$OutletReturnLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OutletReturnLoadingImplCopyWithImpl<$Res>
    extends _$OutletReturnStateCopyWithImpl<$Res, _$OutletReturnLoadingImpl>
    implements _$$OutletReturnLoadingImplCopyWith<$Res> {
  __$$OutletReturnLoadingImplCopyWithImpl(_$OutletReturnLoadingImpl _value,
      $Res Function(_$OutletReturnLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OutletReturnLoadingImpl implements OutletReturnLoading {
  const _$OutletReturnLoadingImpl();

  @override
  String toString() {
    return 'OutletReturnState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletReturnLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<OtherRequest> outletReturnList)
        loadOtherRequestData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() acceptLoading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OtherRequest> outletReturnList)?
        loadOtherRequestData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? acceptLoading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OtherRequest> outletReturnList)? loadOtherRequestData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? acceptLoading,
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
    required TResult Function(OutletReturnList value) loadOtherRequestData,
    required TResult Function(Initial value) initial,
    required TResult Function(OutletReturnLoading value) loading,
    required TResult Function(ReceiveLoading value) acceptLoading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutletReturnList value)? loadOtherRequestData,
    TResult? Function(Initial value)? initial,
    TResult? Function(OutletReturnLoading value)? loading,
    TResult? Function(ReceiveLoading value)? acceptLoading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutletReturnList value)? loadOtherRequestData,
    TResult Function(Initial value)? initial,
    TResult Function(OutletReturnLoading value)? loading,
    TResult Function(ReceiveLoading value)? acceptLoading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OutletReturnLoading implements OutletReturnState {
  const factory OutletReturnLoading() = _$OutletReturnLoadingImpl;
}

/// @nodoc
abstract class _$$ReceiveLoadingImplCopyWith<$Res> {
  factory _$$ReceiveLoadingImplCopyWith(_$ReceiveLoadingImpl value,
          $Res Function(_$ReceiveLoadingImpl) then) =
      __$$ReceiveLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReceiveLoadingImplCopyWithImpl<$Res>
    extends _$OutletReturnStateCopyWithImpl<$Res, _$ReceiveLoadingImpl>
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
    return 'OutletReturnState.acceptLoading()';
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
    required TResult Function(List<OtherRequest> outletReturnList)
        loadOtherRequestData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() acceptLoading,
    required TResult Function(String? error) error,
  }) {
    return acceptLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OtherRequest> outletReturnList)?
        loadOtherRequestData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? acceptLoading,
    TResult? Function(String? error)? error,
  }) {
    return acceptLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OtherRequest> outletReturnList)? loadOtherRequestData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? acceptLoading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (acceptLoading != null) {
      return acceptLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OutletReturnList value) loadOtherRequestData,
    required TResult Function(Initial value) initial,
    required TResult Function(OutletReturnLoading value) loading,
    required TResult Function(ReceiveLoading value) acceptLoading,
    required TResult Function(Error value) error,
  }) {
    return acceptLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutletReturnList value)? loadOtherRequestData,
    TResult? Function(Initial value)? initial,
    TResult? Function(OutletReturnLoading value)? loading,
    TResult? Function(ReceiveLoading value)? acceptLoading,
    TResult? Function(Error value)? error,
  }) {
    return acceptLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutletReturnList value)? loadOtherRequestData,
    TResult Function(Initial value)? initial,
    TResult Function(OutletReturnLoading value)? loading,
    TResult Function(ReceiveLoading value)? acceptLoading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (acceptLoading != null) {
      return acceptLoading(this);
    }
    return orElse();
  }
}

abstract class ReceiveLoading implements OutletReturnState {
  const factory ReceiveLoading() = _$ReceiveLoadingImpl;
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
    extends _$OutletReturnStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'OutletReturnState.error(error: $error)';
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
    required TResult Function(List<OtherRequest> outletReturnList)
        loadOtherRequestData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() acceptLoading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OtherRequest> outletReturnList)?
        loadOtherRequestData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? acceptLoading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OtherRequest> outletReturnList)? loadOtherRequestData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? acceptLoading,
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
    required TResult Function(OutletReturnList value) loadOtherRequestData,
    required TResult Function(Initial value) initial,
    required TResult Function(OutletReturnLoading value) loading,
    required TResult Function(ReceiveLoading value) acceptLoading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OutletReturnList value)? loadOtherRequestData,
    TResult? Function(Initial value)? initial,
    TResult? Function(OutletReturnLoading value)? loading,
    TResult? Function(ReceiveLoading value)? acceptLoading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OutletReturnList value)? loadOtherRequestData,
    TResult Function(Initial value)? initial,
    TResult Function(OutletReturnLoading value)? loading,
    TResult Function(ReceiveLoading value)? acceptLoading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements OutletReturnState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
