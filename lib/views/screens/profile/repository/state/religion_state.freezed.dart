// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'religion_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReligionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Religion> religionList) laodReligion,
    required TResult Function(Religion religion) selectedReligion,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Religion> religionList)? laodReligion,
    TResult? Function(Religion religion)? selectedReligion,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Religion> religionList)? laodReligion,
    TResult Function(Religion religion)? selectedReligion,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReligionList value) laodReligion,
    required TResult Function(SelectedReligion value) selectedReligion,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReligionList value)? laodReligion,
    TResult? Function(SelectedReligion value)? selectedReligion,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReligionList value)? laodReligion,
    TResult Function(SelectedReligion value)? selectedReligion,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReligionStateCopyWith<$Res> {
  factory $ReligionStateCopyWith(
          ReligionState value, $Res Function(ReligionState) then) =
      _$ReligionStateCopyWithImpl<$Res, ReligionState>;
}

/// @nodoc
class _$ReligionStateCopyWithImpl<$Res, $Val extends ReligionState>
    implements $ReligionStateCopyWith<$Res> {
  _$ReligionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReligionListImplCopyWith<$Res> {
  factory _$$ReligionListImplCopyWith(
          _$ReligionListImpl value, $Res Function(_$ReligionListImpl) then) =
      __$$ReligionListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Religion> religionList});
}

/// @nodoc
class __$$ReligionListImplCopyWithImpl<$Res>
    extends _$ReligionStateCopyWithImpl<$Res, _$ReligionListImpl>
    implements _$$ReligionListImplCopyWith<$Res> {
  __$$ReligionListImplCopyWithImpl(
      _$ReligionListImpl _value, $Res Function(_$ReligionListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? religionList = null,
  }) {
    return _then(_$ReligionListImpl(
      null == religionList
          ? _value._religionList
          : religionList // ignore: cast_nullable_to_non_nullable
              as List<Religion>,
    ));
  }
}

/// @nodoc

class _$ReligionListImpl implements ReligionList {
  const _$ReligionListImpl(final List<Religion> religionList)
      : _religionList = religionList;

  final List<Religion> _religionList;
  @override
  List<Religion> get religionList {
    if (_religionList is EqualUnmodifiableListView) return _religionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_religionList);
  }

  @override
  String toString() {
    return 'ReligionState.laodReligion(religionList: $religionList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReligionListImpl &&
            const DeepCollectionEquality()
                .equals(other._religionList, _religionList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_religionList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReligionListImplCopyWith<_$ReligionListImpl> get copyWith =>
      __$$ReligionListImplCopyWithImpl<_$ReligionListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Religion> religionList) laodReligion,
    required TResult Function(Religion religion) selectedReligion,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return laodReligion(religionList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Religion> religionList)? laodReligion,
    TResult? Function(Religion religion)? selectedReligion,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return laodReligion?.call(religionList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Religion> religionList)? laodReligion,
    TResult Function(Religion religion)? selectedReligion,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (laodReligion != null) {
      return laodReligion(religionList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReligionList value) laodReligion,
    required TResult Function(SelectedReligion value) selectedReligion,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return laodReligion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReligionList value)? laodReligion,
    TResult? Function(SelectedReligion value)? selectedReligion,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return laodReligion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReligionList value)? laodReligion,
    TResult Function(SelectedReligion value)? selectedReligion,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (laodReligion != null) {
      return laodReligion(this);
    }
    return orElse();
  }
}

abstract class ReligionList implements ReligionState {
  const factory ReligionList(final List<Religion> religionList) =
      _$ReligionListImpl;

  List<Religion> get religionList;
  @JsonKey(ignore: true)
  _$$ReligionListImplCopyWith<_$ReligionListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedReligionImplCopyWith<$Res> {
  factory _$$SelectedReligionImplCopyWith(_$SelectedReligionImpl value,
          $Res Function(_$SelectedReligionImpl) then) =
      __$$SelectedReligionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Religion religion});
}

/// @nodoc
class __$$SelectedReligionImplCopyWithImpl<$Res>
    extends _$ReligionStateCopyWithImpl<$Res, _$SelectedReligionImpl>
    implements _$$SelectedReligionImplCopyWith<$Res> {
  __$$SelectedReligionImplCopyWithImpl(_$SelectedReligionImpl _value,
      $Res Function(_$SelectedReligionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? religion = null,
  }) {
    return _then(_$SelectedReligionImpl(
      null == religion
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as Religion,
    ));
  }
}

/// @nodoc

class _$SelectedReligionImpl implements SelectedReligion {
  const _$SelectedReligionImpl(this.religion);

  @override
  final Religion religion;

  @override
  String toString() {
    return 'ReligionState.selectedReligion(religion: $religion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedReligionImpl &&
            (identical(other.religion, religion) ||
                other.religion == religion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, religion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedReligionImplCopyWith<_$SelectedReligionImpl> get copyWith =>
      __$$SelectedReligionImplCopyWithImpl<_$SelectedReligionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Religion> religionList) laodReligion,
    required TResult Function(Religion religion) selectedReligion,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return selectedReligion(religion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Religion> religionList)? laodReligion,
    TResult? Function(Religion religion)? selectedReligion,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return selectedReligion?.call(religion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Religion> religionList)? laodReligion,
    TResult Function(Religion religion)? selectedReligion,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (selectedReligion != null) {
      return selectedReligion(religion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReligionList value) laodReligion,
    required TResult Function(SelectedReligion value) selectedReligion,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return selectedReligion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReligionList value)? laodReligion,
    TResult? Function(SelectedReligion value)? selectedReligion,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return selectedReligion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReligionList value)? laodReligion,
    TResult Function(SelectedReligion value)? selectedReligion,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (selectedReligion != null) {
      return selectedReligion(this);
    }
    return orElse();
  }
}

abstract class SelectedReligion implements ReligionState {
  const factory SelectedReligion(final Religion religion) =
      _$SelectedReligionImpl;

  Religion get religion;
  @JsonKey(ignore: true)
  _$$SelectedReligionImplCopyWith<_$SelectedReligionImpl> get copyWith =>
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
    extends _$ReligionStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ReligionState.initial()';
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
    required TResult Function(List<Religion> religionList) laodReligion,
    required TResult Function(Religion religion) selectedReligion,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Religion> religionList)? laodReligion,
    TResult? Function(Religion religion)? selectedReligion,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Religion> religionList)? laodReligion,
    TResult Function(Religion religion)? selectedReligion,
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
    required TResult Function(ReligionList value) laodReligion,
    required TResult Function(SelectedReligion value) selectedReligion,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReligionList value)? laodReligion,
    TResult? Function(SelectedReligion value)? selectedReligion,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReligionList value)? laodReligion,
    TResult Function(SelectedReligion value)? selectedReligion,
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

abstract class Initial implements ReligionState {
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
    extends _$ReligionStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'ReligionState.loading()';
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
    required TResult Function(List<Religion> religionList) laodReligion,
    required TResult Function(Religion religion) selectedReligion,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Religion> religionList)? laodReligion,
    TResult? Function(Religion religion)? selectedReligion,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Religion> religionList)? laodReligion,
    TResult Function(Religion religion)? selectedReligion,
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
    required TResult Function(ReligionList value) laodReligion,
    required TResult Function(SelectedReligion value) selectedReligion,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReligionList value)? laodReligion,
    TResult? Function(SelectedReligion value)? selectedReligion,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReligionList value)? laodReligion,
    TResult Function(SelectedReligion value)? selectedReligion,
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

abstract class Loading implements ReligionState {
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
    extends _$ReligionStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'ReligionState.error(error: $error)';
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
    required TResult Function(List<Religion> religionList) laodReligion,
    required TResult Function(Religion religion) selectedReligion,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Religion> religionList)? laodReligion,
    TResult? Function(Religion religion)? selectedReligion,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Religion> religionList)? laodReligion,
    TResult Function(Religion religion)? selectedReligion,
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
    required TResult Function(ReligionList value) laodReligion,
    required TResult Function(SelectedReligion value) selectedReligion,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReligionList value)? laodReligion,
    TResult? Function(SelectedReligion value)? selectedReligion,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReligionList value)? laodReligion,
    TResult Function(SelectedReligion value)? selectedReligion,
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

abstract class Error implements ReligionState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
