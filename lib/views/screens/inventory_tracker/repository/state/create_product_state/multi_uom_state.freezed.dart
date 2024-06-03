// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multi_uom_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MultiUomState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MultiUom> uomList) loadUomList,
    required TResult Function(MultiUom selectedRack) selectedUom,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MultiUom> uomList)? loadUomList,
    TResult? Function(MultiUom selectedRack)? selectedUom,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MultiUom> uomList)? loadUomList,
    TResult Function(MultiUom selectedRack)? selectedUom,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MultiUomList value) loadUomList,
    required TResult Function(SelectedMultiUom value) selectedUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MultiUomList value)? loadUomList,
    TResult? Function(SelectedMultiUom value)? selectedUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MultiUomList value)? loadUomList,
    TResult Function(SelectedMultiUom value)? selectedUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingUom value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultiUomStateCopyWith<$Res> {
  factory $MultiUomStateCopyWith(
          MultiUomState value, $Res Function(MultiUomState) then) =
      _$MultiUomStateCopyWithImpl<$Res, MultiUomState>;
}

/// @nodoc
class _$MultiUomStateCopyWithImpl<$Res, $Val extends MultiUomState>
    implements $MultiUomStateCopyWith<$Res> {
  _$MultiUomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MultiUomListImplCopyWith<$Res> {
  factory _$$MultiUomListImplCopyWith(
          _$MultiUomListImpl value, $Res Function(_$MultiUomListImpl) then) =
      __$$MultiUomListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MultiUom> uomList});
}

/// @nodoc
class __$$MultiUomListImplCopyWithImpl<$Res>
    extends _$MultiUomStateCopyWithImpl<$Res, _$MultiUomListImpl>
    implements _$$MultiUomListImplCopyWith<$Res> {
  __$$MultiUomListImplCopyWithImpl(
      _$MultiUomListImpl _value, $Res Function(_$MultiUomListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uomList = null,
  }) {
    return _then(_$MultiUomListImpl(
      null == uomList
          ? _value._uomList
          : uomList // ignore: cast_nullable_to_non_nullable
              as List<MultiUom>,
    ));
  }
}

/// @nodoc

class _$MultiUomListImpl implements MultiUomList {
  const _$MultiUomListImpl(final List<MultiUom> uomList) : _uomList = uomList;

  final List<MultiUom> _uomList;
  @override
  List<MultiUom> get uomList {
    if (_uomList is EqualUnmodifiableListView) return _uomList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uomList);
  }

  @override
  String toString() {
    return 'MultiUomState.loadUomList(uomList: $uomList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultiUomListImpl &&
            const DeepCollectionEquality().equals(other._uomList, _uomList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_uomList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MultiUomListImplCopyWith<_$MultiUomListImpl> get copyWith =>
      __$$MultiUomListImplCopyWithImpl<_$MultiUomListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MultiUom> uomList) loadUomList,
    required TResult Function(MultiUom selectedRack) selectedUom,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return loadUomList(uomList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MultiUom> uomList)? loadUomList,
    TResult? Function(MultiUom selectedRack)? selectedUom,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return loadUomList?.call(uomList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MultiUom> uomList)? loadUomList,
    TResult Function(MultiUom selectedRack)? selectedUom,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadUomList != null) {
      return loadUomList(uomList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MultiUomList value) loadUomList,
    required TResult Function(SelectedMultiUom value) selectedUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return loadUomList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MultiUomList value)? loadUomList,
    TResult? Function(SelectedMultiUom value)? selectedUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return loadUomList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MultiUomList value)? loadUomList,
    TResult Function(SelectedMultiUom value)? selectedUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingUom value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadUomList != null) {
      return loadUomList(this);
    }
    return orElse();
  }
}

abstract class MultiUomList implements MultiUomState {
  const factory MultiUomList(final List<MultiUom> uomList) = _$MultiUomListImpl;

  List<MultiUom> get uomList;
  @JsonKey(ignore: true)
  _$$MultiUomListImplCopyWith<_$MultiUomListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedMultiUomImplCopyWith<$Res> {
  factory _$$SelectedMultiUomImplCopyWith(_$SelectedMultiUomImpl value,
          $Res Function(_$SelectedMultiUomImpl) then) =
      __$$SelectedMultiUomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MultiUom selectedRack});
}

/// @nodoc
class __$$SelectedMultiUomImplCopyWithImpl<$Res>
    extends _$MultiUomStateCopyWithImpl<$Res, _$SelectedMultiUomImpl>
    implements _$$SelectedMultiUomImplCopyWith<$Res> {
  __$$SelectedMultiUomImplCopyWithImpl(_$SelectedMultiUomImpl _value,
      $Res Function(_$SelectedMultiUomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRack = null,
  }) {
    return _then(_$SelectedMultiUomImpl(
      null == selectedRack
          ? _value.selectedRack
          : selectedRack // ignore: cast_nullable_to_non_nullable
              as MultiUom,
    ));
  }
}

/// @nodoc

class _$SelectedMultiUomImpl implements SelectedMultiUom {
  const _$SelectedMultiUomImpl(this.selectedRack);

  @override
  final MultiUom selectedRack;

  @override
  String toString() {
    return 'MultiUomState.selectedUom(selectedRack: $selectedRack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedMultiUomImpl &&
            (identical(other.selectedRack, selectedRack) ||
                other.selectedRack == selectedRack));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedRack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedMultiUomImplCopyWith<_$SelectedMultiUomImpl> get copyWith =>
      __$$SelectedMultiUomImplCopyWithImpl<_$SelectedMultiUomImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MultiUom> uomList) loadUomList,
    required TResult Function(MultiUom selectedRack) selectedUom,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return selectedUom(selectedRack);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MultiUom> uomList)? loadUomList,
    TResult? Function(MultiUom selectedRack)? selectedUom,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return selectedUom?.call(selectedRack);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MultiUom> uomList)? loadUomList,
    TResult Function(MultiUom selectedRack)? selectedUom,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (selectedUom != null) {
      return selectedUom(selectedRack);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MultiUomList value) loadUomList,
    required TResult Function(SelectedMultiUom value) selectedUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return selectedUom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MultiUomList value)? loadUomList,
    TResult? Function(SelectedMultiUom value)? selectedUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return selectedUom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MultiUomList value)? loadUomList,
    TResult Function(SelectedMultiUom value)? selectedUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingUom value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (selectedUom != null) {
      return selectedUom(this);
    }
    return orElse();
  }
}

abstract class SelectedMultiUom implements MultiUomState {
  const factory SelectedMultiUom(final MultiUom selectedRack) =
      _$SelectedMultiUomImpl;

  MultiUom get selectedRack;
  @JsonKey(ignore: true)
  _$$SelectedMultiUomImplCopyWith<_$SelectedMultiUomImpl> get copyWith =>
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
    extends _$MultiUomStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'MultiUomState.initial()';
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
    required TResult Function(List<MultiUom> uomList) loadUomList,
    required TResult Function(MultiUom selectedRack) selectedUom,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MultiUom> uomList)? loadUomList,
    TResult? Function(MultiUom selectedRack)? selectedUom,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MultiUom> uomList)? loadUomList,
    TResult Function(MultiUom selectedRack)? selectedUom,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(MultiUomList value) loadUomList,
    required TResult Function(SelectedMultiUom value) selectedUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MultiUomList value)? loadUomList,
    TResult? Function(SelectedMultiUom value)? selectedUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MultiUomList value)? loadUomList,
    TResult Function(SelectedMultiUom value)? selectedUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingUom value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements MultiUomState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingUomImplCopyWith<$Res> {
  factory _$$LoadingUomImplCopyWith(
          _$LoadingUomImpl value, $Res Function(_$LoadingUomImpl) then) =
      __$$LoadingUomImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingUomImplCopyWithImpl<$Res>
    extends _$MultiUomStateCopyWithImpl<$Res, _$LoadingUomImpl>
    implements _$$LoadingUomImplCopyWith<$Res> {
  __$$LoadingUomImplCopyWithImpl(
      _$LoadingUomImpl _value, $Res Function(_$LoadingUomImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingUomImpl implements LoadingUom {
  const _$LoadingUomImpl();

  @override
  String toString() {
    return 'MultiUomState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingUomImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MultiUom> uomList) loadUomList,
    required TResult Function(MultiUom selectedRack) selectedUom,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MultiUom> uomList)? loadUomList,
    TResult? Function(MultiUom selectedRack)? selectedUom,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MultiUom> uomList)? loadUomList,
    TResult Function(MultiUom selectedRack)? selectedUom,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(MultiUomList value) loadUomList,
    required TResult Function(SelectedMultiUom value) selectedUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MultiUomList value)? loadUomList,
    TResult? Function(SelectedMultiUom value)? selectedUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MultiUomList value)? loadUomList,
    TResult Function(SelectedMultiUom value)? selectedUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingUom value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingUom implements MultiUomState {
  const factory LoadingUom() = _$LoadingUomImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$MultiUomStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'MultiUomState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MultiUom> uomList) loadUomList,
    required TResult Function(MultiUom selectedRack) selectedUom,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MultiUom> uomList)? loadUomList,
    TResult? Function(MultiUom selectedRack)? selectedUom,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MultiUom> uomList)? loadUomList,
    TResult Function(MultiUom selectedRack)? selectedUom,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MultiUomList value) loadUomList,
    required TResult Function(SelectedMultiUom value) selectedUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MultiUomList value)? loadUomList,
    TResult? Function(SelectedMultiUom value)? selectedUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MultiUomList value)? loadUomList,
    TResult Function(SelectedMultiUom value)? selectedUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingUom value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements MultiUomState {
  const factory Success() = _$SuccessImpl;
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
    extends _$MultiUomStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'MultiUomState.error(error: $error)';
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
    required TResult Function(List<MultiUom> uomList) loadUomList,
    required TResult Function(MultiUom selectedRack) selectedUom,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MultiUom> uomList)? loadUomList,
    TResult? Function(MultiUom selectedRack)? selectedUom,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MultiUom> uomList)? loadUomList,
    TResult Function(MultiUom selectedRack)? selectedUom,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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
    required TResult Function(MultiUomList value) loadUomList,
    required TResult Function(SelectedMultiUom value) selectedUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MultiUomList value)? loadUomList,
    TResult? Function(SelectedMultiUom value)? selectedUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MultiUomList value)? loadUomList,
    TResult Function(SelectedMultiUom value)? selectedUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingUom value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements MultiUomState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
