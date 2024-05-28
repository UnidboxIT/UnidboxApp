// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ongoing_job_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OngoingJobState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<OngoingJob> ongoingJob) loadOngoingJob,
    required TResult Function(List<SelectionField> seclectionField)
        loadSelectionField,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OngoingJob> ongoingJob)? loadOngoingJob,
    TResult? Function(List<SelectionField> seclectionField)? loadSelectionField,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OngoingJob> ongoingJob)? loadOngoingJob,
    TResult Function(List<SelectionField> seclectionField)? loadSelectionField,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OngoingJobList value) loadOngoingJob,
    required TResult Function(SelectionFieldList value) loadSelectionField,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OngoingJobList value)? loadOngoingJob,
    TResult? Function(SelectionFieldList value)? loadSelectionField,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OngoingJobList value)? loadOngoingJob,
    TResult Function(SelectionFieldList value)? loadSelectionField,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OngoingJobStateCopyWith<$Res> {
  factory $OngoingJobStateCopyWith(
          OngoingJobState value, $Res Function(OngoingJobState) then) =
      _$OngoingJobStateCopyWithImpl<$Res, OngoingJobState>;
}

/// @nodoc
class _$OngoingJobStateCopyWithImpl<$Res, $Val extends OngoingJobState>
    implements $OngoingJobStateCopyWith<$Res> {
  _$OngoingJobStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OngoingJobListImplCopyWith<$Res> {
  factory _$$OngoingJobListImplCopyWith(_$OngoingJobListImpl value,
          $Res Function(_$OngoingJobListImpl) then) =
      __$$OngoingJobListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OngoingJob> ongoingJob});
}

/// @nodoc
class __$$OngoingJobListImplCopyWithImpl<$Res>
    extends _$OngoingJobStateCopyWithImpl<$Res, _$OngoingJobListImpl>
    implements _$$OngoingJobListImplCopyWith<$Res> {
  __$$OngoingJobListImplCopyWithImpl(
      _$OngoingJobListImpl _value, $Res Function(_$OngoingJobListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ongoingJob = null,
  }) {
    return _then(_$OngoingJobListImpl(
      null == ongoingJob
          ? _value._ongoingJob
          : ongoingJob // ignore: cast_nullable_to_non_nullable
              as List<OngoingJob>,
    ));
  }
}

/// @nodoc

class _$OngoingJobListImpl implements OngoingJobList {
  const _$OngoingJobListImpl(final List<OngoingJob> ongoingJob)
      : _ongoingJob = ongoingJob;

  final List<OngoingJob> _ongoingJob;
  @override
  List<OngoingJob> get ongoingJob {
    if (_ongoingJob is EqualUnmodifiableListView) return _ongoingJob;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ongoingJob);
  }

  @override
  String toString() {
    return 'OngoingJobState.loadOngoingJob(ongoingJob: $ongoingJob)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OngoingJobListImpl &&
            const DeepCollectionEquality()
                .equals(other._ongoingJob, _ongoingJob));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_ongoingJob));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OngoingJobListImplCopyWith<_$OngoingJobListImpl> get copyWith =>
      __$$OngoingJobListImplCopyWithImpl<_$OngoingJobListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<OngoingJob> ongoingJob) loadOngoingJob,
    required TResult Function(List<SelectionField> seclectionField)
        loadSelectionField,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadOngoingJob(ongoingJob);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OngoingJob> ongoingJob)? loadOngoingJob,
    TResult? Function(List<SelectionField> seclectionField)? loadSelectionField,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadOngoingJob?.call(ongoingJob);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OngoingJob> ongoingJob)? loadOngoingJob,
    TResult Function(List<SelectionField> seclectionField)? loadSelectionField,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadOngoingJob != null) {
      return loadOngoingJob(ongoingJob);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OngoingJobList value) loadOngoingJob,
    required TResult Function(SelectionFieldList value) loadSelectionField,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadOngoingJob(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OngoingJobList value)? loadOngoingJob,
    TResult? Function(SelectionFieldList value)? loadSelectionField,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadOngoingJob?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OngoingJobList value)? loadOngoingJob,
    TResult Function(SelectionFieldList value)? loadSelectionField,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadOngoingJob != null) {
      return loadOngoingJob(this);
    }
    return orElse();
  }
}

abstract class OngoingJobList implements OngoingJobState {
  const factory OngoingJobList(final List<OngoingJob> ongoingJob) =
      _$OngoingJobListImpl;

  List<OngoingJob> get ongoingJob;
  @JsonKey(ignore: true)
  _$$OngoingJobListImplCopyWith<_$OngoingJobListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectionFieldListImplCopyWith<$Res> {
  factory _$$SelectionFieldListImplCopyWith(_$SelectionFieldListImpl value,
          $Res Function(_$SelectionFieldListImpl) then) =
      __$$SelectionFieldListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SelectionField> seclectionField});
}

/// @nodoc
class __$$SelectionFieldListImplCopyWithImpl<$Res>
    extends _$OngoingJobStateCopyWithImpl<$Res, _$SelectionFieldListImpl>
    implements _$$SelectionFieldListImplCopyWith<$Res> {
  __$$SelectionFieldListImplCopyWithImpl(_$SelectionFieldListImpl _value,
      $Res Function(_$SelectionFieldListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seclectionField = null,
  }) {
    return _then(_$SelectionFieldListImpl(
      null == seclectionField
          ? _value._seclectionField
          : seclectionField // ignore: cast_nullable_to_non_nullable
              as List<SelectionField>,
    ));
  }
}

/// @nodoc

class _$SelectionFieldListImpl implements SelectionFieldList {
  const _$SelectionFieldListImpl(final List<SelectionField> seclectionField)
      : _seclectionField = seclectionField;

  final List<SelectionField> _seclectionField;
  @override
  List<SelectionField> get seclectionField {
    if (_seclectionField is EqualUnmodifiableListView) return _seclectionField;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seclectionField);
  }

  @override
  String toString() {
    return 'OngoingJobState.loadSelectionField(seclectionField: $seclectionField)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectionFieldListImpl &&
            const DeepCollectionEquality()
                .equals(other._seclectionField, _seclectionField));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_seclectionField));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectionFieldListImplCopyWith<_$SelectionFieldListImpl> get copyWith =>
      __$$SelectionFieldListImplCopyWithImpl<_$SelectionFieldListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<OngoingJob> ongoingJob) loadOngoingJob,
    required TResult Function(List<SelectionField> seclectionField)
        loadSelectionField,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadSelectionField(seclectionField);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OngoingJob> ongoingJob)? loadOngoingJob,
    TResult? Function(List<SelectionField> seclectionField)? loadSelectionField,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadSelectionField?.call(seclectionField);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OngoingJob> ongoingJob)? loadOngoingJob,
    TResult Function(List<SelectionField> seclectionField)? loadSelectionField,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadSelectionField != null) {
      return loadSelectionField(seclectionField);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OngoingJobList value) loadOngoingJob,
    required TResult Function(SelectionFieldList value) loadSelectionField,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadSelectionField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OngoingJobList value)? loadOngoingJob,
    TResult? Function(SelectionFieldList value)? loadSelectionField,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadSelectionField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OngoingJobList value)? loadOngoingJob,
    TResult Function(SelectionFieldList value)? loadSelectionField,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadSelectionField != null) {
      return loadSelectionField(this);
    }
    return orElse();
  }
}

abstract class SelectionFieldList implements OngoingJobState {
  const factory SelectionFieldList(final List<SelectionField> seclectionField) =
      _$SelectionFieldListImpl;

  List<SelectionField> get seclectionField;
  @JsonKey(ignore: true)
  _$$SelectionFieldListImplCopyWith<_$SelectionFieldListImpl> get copyWith =>
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
    extends _$OngoingJobStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'OngoingJobState.initial()';
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
    required TResult Function(List<OngoingJob> ongoingJob) loadOngoingJob,
    required TResult Function(List<SelectionField> seclectionField)
        loadSelectionField,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OngoingJob> ongoingJob)? loadOngoingJob,
    TResult? Function(List<SelectionField> seclectionField)? loadSelectionField,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OngoingJob> ongoingJob)? loadOngoingJob,
    TResult Function(List<SelectionField> seclectionField)? loadSelectionField,
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
    required TResult Function(OngoingJobList value) loadOngoingJob,
    required TResult Function(SelectionFieldList value) loadSelectionField,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OngoingJobList value)? loadOngoingJob,
    TResult? Function(SelectionFieldList value)? loadSelectionField,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OngoingJobList value)? loadOngoingJob,
    TResult Function(SelectionFieldList value)? loadSelectionField,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements OngoingJobState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$OngoingJobStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'OngoingJobState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<OngoingJob> ongoingJob) loadOngoingJob,
    required TResult Function(List<SelectionField> seclectionField)
        loadSelectionField,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OngoingJob> ongoingJob)? loadOngoingJob,
    TResult? Function(List<SelectionField> seclectionField)? loadSelectionField,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OngoingJob> ongoingJob)? loadOngoingJob,
    TResult Function(List<SelectionField> seclectionField)? loadSelectionField,
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
    required TResult Function(OngoingJobList value) loadOngoingJob,
    required TResult Function(SelectionFieldList value) loadSelectionField,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OngoingJobList value)? loadOngoingJob,
    TResult? Function(SelectionFieldList value)? loadSelectionField,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OngoingJobList value)? loadOngoingJob,
    TResult Function(SelectionFieldList value)? loadSelectionField,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements OngoingJobState {
  const factory Loading() = _$LoadingImpl;
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
    extends _$OngoingJobStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'OngoingJobState.error(error: $error)';
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
    required TResult Function(List<OngoingJob> ongoingJob) loadOngoingJob,
    required TResult Function(List<SelectionField> seclectionField)
        loadSelectionField,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OngoingJob> ongoingJob)? loadOngoingJob,
    TResult? Function(List<SelectionField> seclectionField)? loadSelectionField,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OngoingJob> ongoingJob)? loadOngoingJob,
    TResult Function(List<SelectionField> seclectionField)? loadSelectionField,
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
    required TResult Function(OngoingJobList value) loadOngoingJob,
    required TResult Function(SelectionFieldList value) loadSelectionField,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OngoingJobList value)? loadOngoingJob,
    TResult? Function(SelectionFieldList value)? loadSelectionField,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OngoingJobList value)? loadOngoingJob,
    TResult Function(SelectionFieldList value)? loadSelectionField,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements OngoingJobState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
