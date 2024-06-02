// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_uom_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainUomState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Uom> uomList) loadMainUomList,
    required TResult Function(Uom selectedRack) selectedMainUom,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Uom> uomList)? loadMainUomList,
    TResult? Function(Uom selectedRack)? selectedMainUom,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Uom> uomList)? loadMainUomList,
    TResult Function(Uom selectedRack)? selectedMainUom,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainUomList value) loadMainUomList,
    required TResult Function(MainSelectedUom value) selectedMainUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingMainUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainUomList value)? loadMainUomList,
    TResult? Function(MainSelectedUom value)? selectedMainUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingMainUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainUomList value)? loadMainUomList,
    TResult Function(MainSelectedUom value)? selectedMainUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingMainUom value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainUomStateCopyWith<$Res> {
  factory $MainUomStateCopyWith(
          MainUomState value, $Res Function(MainUomState) then) =
      _$MainUomStateCopyWithImpl<$Res, MainUomState>;
}

/// @nodoc
class _$MainUomStateCopyWithImpl<$Res, $Val extends MainUomState>
    implements $MainUomStateCopyWith<$Res> {
  _$MainUomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MainUomListImplCopyWith<$Res> {
  factory _$$MainUomListImplCopyWith(
          _$MainUomListImpl value, $Res Function(_$MainUomListImpl) then) =
      __$$MainUomListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Uom> uomList});
}

/// @nodoc
class __$$MainUomListImplCopyWithImpl<$Res>
    extends _$MainUomStateCopyWithImpl<$Res, _$MainUomListImpl>
    implements _$$MainUomListImplCopyWith<$Res> {
  __$$MainUomListImplCopyWithImpl(
      _$MainUomListImpl _value, $Res Function(_$MainUomListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uomList = null,
  }) {
    return _then(_$MainUomListImpl(
      null == uomList
          ? _value._uomList
          : uomList // ignore: cast_nullable_to_non_nullable
              as List<Uom>,
    ));
  }
}

/// @nodoc

class _$MainUomListImpl implements MainUomList {
  const _$MainUomListImpl(final List<Uom> uomList) : _uomList = uomList;

  final List<Uom> _uomList;
  @override
  List<Uom> get uomList {
    if (_uomList is EqualUnmodifiableListView) return _uomList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uomList);
  }

  @override
  String toString() {
    return 'MainUomState.loadMainUomList(uomList: $uomList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainUomListImpl &&
            const DeepCollectionEquality().equals(other._uomList, _uomList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_uomList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainUomListImplCopyWith<_$MainUomListImpl> get copyWith =>
      __$$MainUomListImplCopyWithImpl<_$MainUomListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Uom> uomList) loadMainUomList,
    required TResult Function(Uom selectedRack) selectedMainUom,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return loadMainUomList(uomList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Uom> uomList)? loadMainUomList,
    TResult? Function(Uom selectedRack)? selectedMainUom,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return loadMainUomList?.call(uomList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Uom> uomList)? loadMainUomList,
    TResult Function(Uom selectedRack)? selectedMainUom,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadMainUomList != null) {
      return loadMainUomList(uomList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainUomList value) loadMainUomList,
    required TResult Function(MainSelectedUom value) selectedMainUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingMainUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return loadMainUomList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainUomList value)? loadMainUomList,
    TResult? Function(MainSelectedUom value)? selectedMainUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingMainUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return loadMainUomList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainUomList value)? loadMainUomList,
    TResult Function(MainSelectedUom value)? selectedMainUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingMainUom value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadMainUomList != null) {
      return loadMainUomList(this);
    }
    return orElse();
  }
}

abstract class MainUomList implements MainUomState {
  const factory MainUomList(final List<Uom> uomList) = _$MainUomListImpl;

  List<Uom> get uomList;
  @JsonKey(ignore: true)
  _$$MainUomListImplCopyWith<_$MainUomListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MainSelectedUomImplCopyWith<$Res> {
  factory _$$MainSelectedUomImplCopyWith(_$MainSelectedUomImpl value,
          $Res Function(_$MainSelectedUomImpl) then) =
      __$$MainSelectedUomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uom selectedRack});
}

/// @nodoc
class __$$MainSelectedUomImplCopyWithImpl<$Res>
    extends _$MainUomStateCopyWithImpl<$Res, _$MainSelectedUomImpl>
    implements _$$MainSelectedUomImplCopyWith<$Res> {
  __$$MainSelectedUomImplCopyWithImpl(
      _$MainSelectedUomImpl _value, $Res Function(_$MainSelectedUomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRack = null,
  }) {
    return _then(_$MainSelectedUomImpl(
      null == selectedRack
          ? _value.selectedRack
          : selectedRack // ignore: cast_nullable_to_non_nullable
              as Uom,
    ));
  }
}

/// @nodoc

class _$MainSelectedUomImpl implements MainSelectedUom {
  const _$MainSelectedUomImpl(this.selectedRack);

  @override
  final Uom selectedRack;

  @override
  String toString() {
    return 'MainUomState.selectedMainUom(selectedRack: $selectedRack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainSelectedUomImpl &&
            (identical(other.selectedRack, selectedRack) ||
                other.selectedRack == selectedRack));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedRack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainSelectedUomImplCopyWith<_$MainSelectedUomImpl> get copyWith =>
      __$$MainSelectedUomImplCopyWithImpl<_$MainSelectedUomImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Uom> uomList) loadMainUomList,
    required TResult Function(Uom selectedRack) selectedMainUom,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return selectedMainUom(selectedRack);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Uom> uomList)? loadMainUomList,
    TResult? Function(Uom selectedRack)? selectedMainUom,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return selectedMainUom?.call(selectedRack);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Uom> uomList)? loadMainUomList,
    TResult Function(Uom selectedRack)? selectedMainUom,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (selectedMainUom != null) {
      return selectedMainUom(selectedRack);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainUomList value) loadMainUomList,
    required TResult Function(MainSelectedUom value) selectedMainUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingMainUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return selectedMainUom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainUomList value)? loadMainUomList,
    TResult? Function(MainSelectedUom value)? selectedMainUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingMainUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return selectedMainUom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainUomList value)? loadMainUomList,
    TResult Function(MainSelectedUom value)? selectedMainUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingMainUom value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (selectedMainUom != null) {
      return selectedMainUom(this);
    }
    return orElse();
  }
}

abstract class MainSelectedUom implements MainUomState {
  const factory MainSelectedUom(final Uom selectedRack) = _$MainSelectedUomImpl;

  Uom get selectedRack;
  @JsonKey(ignore: true)
  _$$MainSelectedUomImplCopyWith<_$MainSelectedUomImpl> get copyWith =>
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
    extends _$MainUomStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'MainUomState.initial()';
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
    required TResult Function(List<Uom> uomList) loadMainUomList,
    required TResult Function(Uom selectedRack) selectedMainUom,
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
    TResult? Function(List<Uom> uomList)? loadMainUomList,
    TResult? Function(Uom selectedRack)? selectedMainUom,
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
    TResult Function(List<Uom> uomList)? loadMainUomList,
    TResult Function(Uom selectedRack)? selectedMainUom,
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
    required TResult Function(MainUomList value) loadMainUomList,
    required TResult Function(MainSelectedUom value) selectedMainUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingMainUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainUomList value)? loadMainUomList,
    TResult? Function(MainSelectedUom value)? selectedMainUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingMainUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainUomList value)? loadMainUomList,
    TResult Function(MainSelectedUom value)? selectedMainUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingMainUom value)? loading,
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

abstract class Initial implements MainUomState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingMainUomImplCopyWith<$Res> {
  factory _$$LoadingMainUomImplCopyWith(_$LoadingMainUomImpl value,
          $Res Function(_$LoadingMainUomImpl) then) =
      __$$LoadingMainUomImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingMainUomImplCopyWithImpl<$Res>
    extends _$MainUomStateCopyWithImpl<$Res, _$LoadingMainUomImpl>
    implements _$$LoadingMainUomImplCopyWith<$Res> {
  __$$LoadingMainUomImplCopyWithImpl(
      _$LoadingMainUomImpl _value, $Res Function(_$LoadingMainUomImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingMainUomImpl implements LoadingMainUom {
  const _$LoadingMainUomImpl();

  @override
  String toString() {
    return 'MainUomState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingMainUomImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Uom> uomList) loadMainUomList,
    required TResult Function(Uom selectedRack) selectedMainUom,
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
    TResult? Function(List<Uom> uomList)? loadMainUomList,
    TResult? Function(Uom selectedRack)? selectedMainUom,
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
    TResult Function(List<Uom> uomList)? loadMainUomList,
    TResult Function(Uom selectedRack)? selectedMainUom,
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
    required TResult Function(MainUomList value) loadMainUomList,
    required TResult Function(MainSelectedUom value) selectedMainUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingMainUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainUomList value)? loadMainUomList,
    TResult? Function(MainSelectedUom value)? selectedMainUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingMainUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainUomList value)? loadMainUomList,
    TResult Function(MainSelectedUom value)? selectedMainUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingMainUom value)? loading,
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

abstract class LoadingMainUom implements MainUomState {
  const factory LoadingMainUom() = _$LoadingMainUomImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$MainUomStateCopyWithImpl<$Res, _$SuccessImpl>
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
    return 'MainUomState.success()';
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
    required TResult Function(List<Uom> uomList) loadMainUomList,
    required TResult Function(Uom selectedRack) selectedMainUom,
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
    TResult? Function(List<Uom> uomList)? loadMainUomList,
    TResult? Function(Uom selectedRack)? selectedMainUom,
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
    TResult Function(List<Uom> uomList)? loadMainUomList,
    TResult Function(Uom selectedRack)? selectedMainUom,
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
    required TResult Function(MainUomList value) loadMainUomList,
    required TResult Function(MainSelectedUom value) selectedMainUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingMainUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainUomList value)? loadMainUomList,
    TResult? Function(MainSelectedUom value)? selectedMainUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingMainUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainUomList value)? loadMainUomList,
    TResult Function(MainSelectedUom value)? selectedMainUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingMainUom value)? loading,
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

abstract class Success implements MainUomState {
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
    extends _$MainUomStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'MainUomState.error(error: $error)';
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
    required TResult Function(List<Uom> uomList) loadMainUomList,
    required TResult Function(Uom selectedRack) selectedMainUom,
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
    TResult? Function(List<Uom> uomList)? loadMainUomList,
    TResult? Function(Uom selectedRack)? selectedMainUom,
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
    TResult Function(List<Uom> uomList)? loadMainUomList,
    TResult Function(Uom selectedRack)? selectedMainUom,
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
    required TResult Function(MainUomList value) loadMainUomList,
    required TResult Function(MainSelectedUom value) selectedMainUom,
    required TResult Function(Initial value) initial,
    required TResult Function(LoadingMainUom value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainUomList value)? loadMainUomList,
    TResult? Function(MainSelectedUom value)? selectedMainUom,
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadingMainUom value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainUomList value)? loadMainUomList,
    TResult Function(MainSelectedUom value)? selectedMainUom,
    TResult Function(Initial value)? initial,
    TResult Function(LoadingMainUom value)? loading,
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

abstract class Error implements MainUomState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
