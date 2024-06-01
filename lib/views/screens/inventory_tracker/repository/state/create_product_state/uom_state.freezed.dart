// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uom_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UomState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Uom> uomList) loadUomList,
    required TResult Function(Uom selectedRack) selectedUom,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Uom> uomList)? loadUomList,
    TResult? Function(Uom selectedRack)? selectedUom,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Uom> uomList)? loadUomList,
    TResult Function(Uom selectedRack)? selectedUom,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UomList value) loadUomList,
    required TResult Function(SelectedUom value) selectedUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UomList value)? loadUomList,
    TResult? Function(SelectedUom value)? selectedUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UomList value)? loadUomList,
    TResult Function(SelectedUom value)? selectedUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingUom value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UomStateCopyWith<$Res> {
  factory $UomStateCopyWith(UomState value, $Res Function(UomState) then) =
      _$UomStateCopyWithImpl<$Res, UomState>;
}

/// @nodoc
class _$UomStateCopyWithImpl<$Res, $Val extends UomState>
    implements $UomStateCopyWith<$Res> {
  _$UomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UomListImplCopyWith<$Res> {
  factory _$$UomListImplCopyWith(
          _$UomListImpl value, $Res Function(_$UomListImpl) then) =
      __$$UomListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Uom> uomList});
}

/// @nodoc
class __$$UomListImplCopyWithImpl<$Res>
    extends _$UomStateCopyWithImpl<$Res, _$UomListImpl>
    implements _$$UomListImplCopyWith<$Res> {
  __$$UomListImplCopyWithImpl(
      _$UomListImpl _value, $Res Function(_$UomListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uomList = null,
  }) {
    return _then(_$UomListImpl(
      null == uomList
          ? _value._uomList
          : uomList // ignore: cast_nullable_to_non_nullable
              as List<Uom>,
    ));
  }
}

/// @nodoc

class _$UomListImpl implements UomList {
  const _$UomListImpl(final List<Uom> uomList) : _uomList = uomList;

  final List<Uom> _uomList;
  @override
  List<Uom> get uomList {
    if (_uomList is EqualUnmodifiableListView) return _uomList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uomList);
  }

  @override
  String toString() {
    return 'UomState.loadUomList(uomList: $uomList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UomListImpl &&
            const DeepCollectionEquality().equals(other._uomList, _uomList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_uomList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UomListImplCopyWith<_$UomListImpl> get copyWith =>
      __$$UomListImplCopyWithImpl<_$UomListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Uom> uomList) loadUomList,
    required TResult Function(Uom selectedRack) selectedUom,
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
    TResult? Function(List<Uom> uomList)? loadUomList,
    TResult? Function(Uom selectedRack)? selectedUom,
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
    TResult Function(List<Uom> uomList)? loadUomList,
    TResult Function(Uom selectedRack)? selectedUom,
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
    required TResult Function(UomList value) loadUomList,
    required TResult Function(SelectedUom value) selectedUom,
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
    TResult? Function(UomList value)? loadUomList,
    TResult? Function(SelectedUom value)? selectedUom,
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
    TResult Function(UomList value)? loadUomList,
    TResult Function(SelectedUom value)? selectedUom,
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

abstract class UomList implements UomState {
  const factory UomList(final List<Uom> uomList) = _$UomListImpl;

  List<Uom> get uomList;
  @JsonKey(ignore: true)
  _$$UomListImplCopyWith<_$UomListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedUomImplCopyWith<$Res> {
  factory _$$SelectedUomImplCopyWith(
          _$SelectedUomImpl value, $Res Function(_$SelectedUomImpl) then) =
      __$$SelectedUomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uom selectedRack});
}

/// @nodoc
class __$$SelectedUomImplCopyWithImpl<$Res>
    extends _$UomStateCopyWithImpl<$Res, _$SelectedUomImpl>
    implements _$$SelectedUomImplCopyWith<$Res> {
  __$$SelectedUomImplCopyWithImpl(
      _$SelectedUomImpl _value, $Res Function(_$SelectedUomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRack = null,
  }) {
    return _then(_$SelectedUomImpl(
      null == selectedRack
          ? _value.selectedRack
          : selectedRack // ignore: cast_nullable_to_non_nullable
              as Uom,
    ));
  }
}

/// @nodoc

class _$SelectedUomImpl implements SelectedUom {
  const _$SelectedUomImpl(this.selectedRack);

  @override
  final Uom selectedRack;

  @override
  String toString() {
    return 'UomState.selectedUom(selectedRack: $selectedRack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedUomImpl &&
            (identical(other.selectedRack, selectedRack) ||
                other.selectedRack == selectedRack));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedRack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedUomImplCopyWith<_$SelectedUomImpl> get copyWith =>
      __$$SelectedUomImplCopyWithImpl<_$SelectedUomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Uom> uomList) loadUomList,
    required TResult Function(Uom selectedRack) selectedUom,
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
    TResult? Function(List<Uom> uomList)? loadUomList,
    TResult? Function(Uom selectedRack)? selectedUom,
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
    TResult Function(List<Uom> uomList)? loadUomList,
    TResult Function(Uom selectedRack)? selectedUom,
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
    required TResult Function(UomList value) loadUomList,
    required TResult Function(SelectedUom value) selectedUom,
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
    TResult? Function(UomList value)? loadUomList,
    TResult? Function(SelectedUom value)? selectedUom,
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
    TResult Function(UomList value)? loadUomList,
    TResult Function(SelectedUom value)? selectedUom,
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

abstract class SelectedUom implements UomState {
  const factory SelectedUom(final Uom selectedRack) = _$SelectedUomImpl;

  Uom get selectedRack;
  @JsonKey(ignore: true)
  _$$SelectedUomImplCopyWith<_$SelectedUomImpl> get copyWith =>
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
    extends _$UomStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'UomState.initial()';
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
    required TResult Function(List<Uom> uomList) loadUomList,
    required TResult Function(Uom selectedRack) selectedUom,
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
    TResult? Function(List<Uom> uomList)? loadUomList,
    TResult? Function(Uom selectedRack)? selectedUom,
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
    TResult Function(List<Uom> uomList)? loadUomList,
    TResult Function(Uom selectedRack)? selectedUom,
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
    required TResult Function(UomList value) loadUomList,
    required TResult Function(SelectedUom value) selectedUom,
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
    TResult? Function(UomList value)? loadUomList,
    TResult? Function(SelectedUom value)? selectedUom,
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
    TResult Function(UomList value)? loadUomList,
    TResult Function(SelectedUom value)? selectedUom,
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

abstract class Initial implements UomState {
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
    extends _$UomStateCopyWithImpl<$Res, _$LoadingUomImpl>
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
    return 'UomState.loading()';
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
    required TResult Function(List<Uom> uomList) loadUomList,
    required TResult Function(Uom selectedRack) selectedUom,
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
    TResult? Function(List<Uom> uomList)? loadUomList,
    TResult? Function(Uom selectedRack)? selectedUom,
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
    TResult Function(List<Uom> uomList)? loadUomList,
    TResult Function(Uom selectedRack)? selectedUom,
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
    required TResult Function(UomList value) loadUomList,
    required TResult Function(SelectedUom value) selectedUom,
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
    TResult? Function(UomList value)? loadUomList,
    TResult? Function(SelectedUom value)? selectedUom,
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
    TResult Function(UomList value)? loadUomList,
    TResult Function(SelectedUom value)? selectedUom,
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

abstract class LoadingUom implements UomState {
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
    extends _$UomStateCopyWithImpl<$Res, _$SuccessImpl>
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
    return 'UomState.success()';
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
    required TResult Function(List<Uom> uomList) loadUomList,
    required TResult Function(Uom selectedRack) selectedUom,
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
    TResult? Function(List<Uom> uomList)? loadUomList,
    TResult? Function(Uom selectedRack)? selectedUom,
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
    TResult Function(List<Uom> uomList)? loadUomList,
    TResult Function(Uom selectedRack)? selectedUom,
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
    required TResult Function(UomList value) loadUomList,
    required TResult Function(SelectedUom value) selectedUom,
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
    TResult? Function(UomList value)? loadUomList,
    TResult? Function(SelectedUom value)? selectedUom,
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
    TResult Function(UomList value)? loadUomList,
    TResult Function(SelectedUom value)? selectedUom,
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

abstract class Success implements UomState {
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
    extends _$UomStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'UomState.error(error: $error)';
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
    required TResult Function(List<Uom> uomList) loadUomList,
    required TResult Function(Uom selectedRack) selectedUom,
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
    TResult? Function(List<Uom> uomList)? loadUomList,
    TResult? Function(Uom selectedRack)? selectedUom,
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
    TResult Function(List<Uom> uomList)? loadUomList,
    TResult Function(Uom selectedRack)? selectedUom,
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
    required TResult Function(UomList value) loadUomList,
    required TResult Function(SelectedUom value) selectedUom,
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
    TResult? Function(UomList value)? loadUomList,
    TResult? Function(SelectedUom value)? selectedUom,
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
    TResult Function(UomList value)? loadUomList,
    TResult Function(SelectedUom value)? selectedUom,
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

abstract class Error implements UomState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
