// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_receiving_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PendingReceivingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<OrderReceiving> pendingReceivingDataList)
        loadPendingReceivingData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OrderReceiving> pendingReceivingDataList)?
        loadPendingReceivingData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OrderReceiving> pendingReceivingDataList)?
        loadPendingReceivingData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PendingReceivingData value)
        loadPendingReceivingData,
    required TResult Function(Initial value) initial,
    required TResult Function(PendingReceivingLoading value) loading,
    required TResult Function(PendingReceivingError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PendingReceivingData value)? loadPendingReceivingData,
    TResult? Function(Initial value)? initial,
    TResult? Function(PendingReceivingLoading value)? loading,
    TResult? Function(PendingReceivingError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PendingReceivingData value)? loadPendingReceivingData,
    TResult Function(Initial value)? initial,
    TResult Function(PendingReceivingLoading value)? loading,
    TResult Function(PendingReceivingError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingReceivingStateCopyWith<$Res> {
  factory $PendingReceivingStateCopyWith(PendingReceivingState value,
          $Res Function(PendingReceivingState) then) =
      _$PendingReceivingStateCopyWithImpl<$Res, PendingReceivingState>;
}

/// @nodoc
class _$PendingReceivingStateCopyWithImpl<$Res,
        $Val extends PendingReceivingState>
    implements $PendingReceivingStateCopyWith<$Res> {
  _$PendingReceivingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PendingReceivingDataImplCopyWith<$Res> {
  factory _$$PendingReceivingDataImplCopyWith(_$PendingReceivingDataImpl value,
          $Res Function(_$PendingReceivingDataImpl) then) =
      __$$PendingReceivingDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OrderReceiving> pendingReceivingDataList});
}

/// @nodoc
class __$$PendingReceivingDataImplCopyWithImpl<$Res>
    extends _$PendingReceivingStateCopyWithImpl<$Res,
        _$PendingReceivingDataImpl>
    implements _$$PendingReceivingDataImplCopyWith<$Res> {
  __$$PendingReceivingDataImplCopyWithImpl(_$PendingReceivingDataImpl _value,
      $Res Function(_$PendingReceivingDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingReceivingDataList = null,
  }) {
    return _then(_$PendingReceivingDataImpl(
      null == pendingReceivingDataList
          ? _value._pendingReceivingDataList
          : pendingReceivingDataList // ignore: cast_nullable_to_non_nullable
              as List<OrderReceiving>,
    ));
  }
}

/// @nodoc

class _$PendingReceivingDataImpl implements PendingReceivingData {
  const _$PendingReceivingDataImpl(
      final List<OrderReceiving> pendingReceivingDataList)
      : _pendingReceivingDataList = pendingReceivingDataList;

  final List<OrderReceiving> _pendingReceivingDataList;
  @override
  List<OrderReceiving> get pendingReceivingDataList {
    if (_pendingReceivingDataList is EqualUnmodifiableListView)
      return _pendingReceivingDataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingReceivingDataList);
  }

  @override
  String toString() {
    return 'PendingReceivingState.loadPendingReceivingData(pendingReceivingDataList: $pendingReceivingDataList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingReceivingDataImpl &&
            const DeepCollectionEquality().equals(
                other._pendingReceivingDataList, _pendingReceivingDataList));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_pendingReceivingDataList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingReceivingDataImplCopyWith<_$PendingReceivingDataImpl>
      get copyWith =>
          __$$PendingReceivingDataImplCopyWithImpl<_$PendingReceivingDataImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<OrderReceiving> pendingReceivingDataList)
        loadPendingReceivingData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadPendingReceivingData(pendingReceivingDataList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OrderReceiving> pendingReceivingDataList)?
        loadPendingReceivingData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadPendingReceivingData?.call(pendingReceivingDataList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OrderReceiving> pendingReceivingDataList)?
        loadPendingReceivingData,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadPendingReceivingData != null) {
      return loadPendingReceivingData(pendingReceivingDataList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PendingReceivingData value)
        loadPendingReceivingData,
    required TResult Function(Initial value) initial,
    required TResult Function(PendingReceivingLoading value) loading,
    required TResult Function(PendingReceivingError value) error,
  }) {
    return loadPendingReceivingData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PendingReceivingData value)? loadPendingReceivingData,
    TResult? Function(Initial value)? initial,
    TResult? Function(PendingReceivingLoading value)? loading,
    TResult? Function(PendingReceivingError value)? error,
  }) {
    return loadPendingReceivingData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PendingReceivingData value)? loadPendingReceivingData,
    TResult Function(Initial value)? initial,
    TResult Function(PendingReceivingLoading value)? loading,
    TResult Function(PendingReceivingError value)? error,
    required TResult orElse(),
  }) {
    if (loadPendingReceivingData != null) {
      return loadPendingReceivingData(this);
    }
    return orElse();
  }
}

abstract class PendingReceivingData implements PendingReceivingState {
  const factory PendingReceivingData(
          final List<OrderReceiving> pendingReceivingDataList) =
      _$PendingReceivingDataImpl;

  List<OrderReceiving> get pendingReceivingDataList;
  @JsonKey(ignore: true)
  _$$PendingReceivingDataImplCopyWith<_$PendingReceivingDataImpl>
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
    extends _$PendingReceivingStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'PendingReceivingState.initial()';
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
    required TResult Function(List<OrderReceiving> pendingReceivingDataList)
        loadPendingReceivingData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OrderReceiving> pendingReceivingDataList)?
        loadPendingReceivingData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OrderReceiving> pendingReceivingDataList)?
        loadPendingReceivingData,
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
    required TResult Function(PendingReceivingData value)
        loadPendingReceivingData,
    required TResult Function(Initial value) initial,
    required TResult Function(PendingReceivingLoading value) loading,
    required TResult Function(PendingReceivingError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PendingReceivingData value)? loadPendingReceivingData,
    TResult? Function(Initial value)? initial,
    TResult? Function(PendingReceivingLoading value)? loading,
    TResult? Function(PendingReceivingError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PendingReceivingData value)? loadPendingReceivingData,
    TResult Function(Initial value)? initial,
    TResult Function(PendingReceivingLoading value)? loading,
    TResult Function(PendingReceivingError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements PendingReceivingState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$PendingReceivingLoadingImplCopyWith<$Res> {
  factory _$$PendingReceivingLoadingImplCopyWith(
          _$PendingReceivingLoadingImpl value,
          $Res Function(_$PendingReceivingLoadingImpl) then) =
      __$$PendingReceivingLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PendingReceivingLoadingImplCopyWithImpl<$Res>
    extends _$PendingReceivingStateCopyWithImpl<$Res,
        _$PendingReceivingLoadingImpl>
    implements _$$PendingReceivingLoadingImplCopyWith<$Res> {
  __$$PendingReceivingLoadingImplCopyWithImpl(
      _$PendingReceivingLoadingImpl _value,
      $Res Function(_$PendingReceivingLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PendingReceivingLoadingImpl implements PendingReceivingLoading {
  const _$PendingReceivingLoadingImpl();

  @override
  String toString() {
    return 'PendingReceivingState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingReceivingLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<OrderReceiving> pendingReceivingDataList)
        loadPendingReceivingData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OrderReceiving> pendingReceivingDataList)?
        loadPendingReceivingData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OrderReceiving> pendingReceivingDataList)?
        loadPendingReceivingData,
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
    required TResult Function(PendingReceivingData value)
        loadPendingReceivingData,
    required TResult Function(Initial value) initial,
    required TResult Function(PendingReceivingLoading value) loading,
    required TResult Function(PendingReceivingError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PendingReceivingData value)? loadPendingReceivingData,
    TResult? Function(Initial value)? initial,
    TResult? Function(PendingReceivingLoading value)? loading,
    TResult? Function(PendingReceivingError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PendingReceivingData value)? loadPendingReceivingData,
    TResult Function(Initial value)? initial,
    TResult Function(PendingReceivingLoading value)? loading,
    TResult Function(PendingReceivingError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PendingReceivingLoading implements PendingReceivingState {
  const factory PendingReceivingLoading() = _$PendingReceivingLoadingImpl;
}

/// @nodoc
abstract class _$$PendingReceivingErrorImplCopyWith<$Res> {
  factory _$$PendingReceivingErrorImplCopyWith(
          _$PendingReceivingErrorImpl value,
          $Res Function(_$PendingReceivingErrorImpl) then) =
      __$$PendingReceivingErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$PendingReceivingErrorImplCopyWithImpl<$Res>
    extends _$PendingReceivingStateCopyWithImpl<$Res,
        _$PendingReceivingErrorImpl>
    implements _$$PendingReceivingErrorImplCopyWith<$Res> {
  __$$PendingReceivingErrorImplCopyWithImpl(_$PendingReceivingErrorImpl _value,
      $Res Function(_$PendingReceivingErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$PendingReceivingErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PendingReceivingErrorImpl implements PendingReceivingError {
  const _$PendingReceivingErrorImpl({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'PendingReceivingState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingReceivingErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingReceivingErrorImplCopyWith<_$PendingReceivingErrorImpl>
      get copyWith => __$$PendingReceivingErrorImplCopyWithImpl<
          _$PendingReceivingErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<OrderReceiving> pendingReceivingDataList)
        loadPendingReceivingData,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OrderReceiving> pendingReceivingDataList)?
        loadPendingReceivingData,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OrderReceiving> pendingReceivingDataList)?
        loadPendingReceivingData,
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
    required TResult Function(PendingReceivingData value)
        loadPendingReceivingData,
    required TResult Function(Initial value) initial,
    required TResult Function(PendingReceivingLoading value) loading,
    required TResult Function(PendingReceivingError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PendingReceivingData value)? loadPendingReceivingData,
    TResult? Function(Initial value)? initial,
    TResult? Function(PendingReceivingLoading value)? loading,
    TResult? Function(PendingReceivingError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PendingReceivingData value)? loadPendingReceivingData,
    TResult Function(Initial value)? initial,
    TResult Function(PendingReceivingLoading value)? loading,
    TResult Function(PendingReceivingError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PendingReceivingError implements PendingReceivingState {
  const factory PendingReceivingError({final String? error}) =
      _$PendingReceivingErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$PendingReceivingErrorImplCopyWith<_$PendingReceivingErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
