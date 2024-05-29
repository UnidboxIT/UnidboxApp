// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rack_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RackState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Racks> rackList) loadRackList,
    required TResult Function(List<Racks> selectedRack) selectedRack,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Racks> rackList)? loadRackList,
    TResult? Function(List<Racks> selectedRack)? selectedRack,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Racks> rackList)? loadRackList,
    TResult Function(List<Racks> selectedRack)? selectedRack,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
    TResult Function()? success,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RackList value) loadRackList,
    required TResult Function(SelectedRack value) selectedRack,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateLoading value) updateLoading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RackList value)? loadRackList,
    TResult? Function(SelectedRack value)? selectedRack,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateLoading value)? updateLoading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RackList value)? loadRackList,
    TResult Function(SelectedRack value)? selectedRack,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateLoading value)? updateLoading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RackStateCopyWith<$Res> {
  factory $RackStateCopyWith(RackState value, $Res Function(RackState) then) =
      _$RackStateCopyWithImpl<$Res, RackState>;
}

/// @nodoc
class _$RackStateCopyWithImpl<$Res, $Val extends RackState>
    implements $RackStateCopyWith<$Res> {
  _$RackStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RackListImplCopyWith<$Res> {
  factory _$$RackListImplCopyWith(
          _$RackListImpl value, $Res Function(_$RackListImpl) then) =
      __$$RackListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Racks> rackList});
}

/// @nodoc
class __$$RackListImplCopyWithImpl<$Res>
    extends _$RackStateCopyWithImpl<$Res, _$RackListImpl>
    implements _$$RackListImplCopyWith<$Res> {
  __$$RackListImplCopyWithImpl(
      _$RackListImpl _value, $Res Function(_$RackListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rackList = null,
  }) {
    return _then(_$RackListImpl(
      null == rackList
          ? _value._rackList
          : rackList // ignore: cast_nullable_to_non_nullable
              as List<Racks>,
    ));
  }
}

/// @nodoc

class _$RackListImpl implements RackList {
  const _$RackListImpl(final List<Racks> rackList) : _rackList = rackList;

  final List<Racks> _rackList;
  @override
  List<Racks> get rackList {
    if (_rackList is EqualUnmodifiableListView) return _rackList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rackList);
  }

  @override
  String toString() {
    return 'RackState.loadRackList(rackList: $rackList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RackListImpl &&
            const DeepCollectionEquality().equals(other._rackList, _rackList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rackList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RackListImplCopyWith<_$RackListImpl> get copyWith =>
      __$$RackListImplCopyWithImpl<_$RackListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Racks> rackList) loadRackList,
    required TResult Function(List<Racks> selectedRack) selectedRack,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return loadRackList(rackList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Racks> rackList)? loadRackList,
    TResult? Function(List<Racks> selectedRack)? selectedRack,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return loadRackList?.call(rackList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Racks> rackList)? loadRackList,
    TResult Function(List<Racks> selectedRack)? selectedRack,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
    TResult Function()? success,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadRackList != null) {
      return loadRackList(rackList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RackList value) loadRackList,
    required TResult Function(SelectedRack value) selectedRack,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateLoading value) updateLoading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return loadRackList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RackList value)? loadRackList,
    TResult? Function(SelectedRack value)? selectedRack,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateLoading value)? updateLoading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return loadRackList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RackList value)? loadRackList,
    TResult Function(SelectedRack value)? selectedRack,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateLoading value)? updateLoading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadRackList != null) {
      return loadRackList(this);
    }
    return orElse();
  }
}

abstract class RackList implements RackState {
  const factory RackList(final List<Racks> rackList) = _$RackListImpl;

  List<Racks> get rackList;
  @JsonKey(ignore: true)
  _$$RackListImplCopyWith<_$RackListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedRackImplCopyWith<$Res> {
  factory _$$SelectedRackImplCopyWith(
          _$SelectedRackImpl value, $Res Function(_$SelectedRackImpl) then) =
      __$$SelectedRackImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Racks> selectedRack});
}

/// @nodoc
class __$$SelectedRackImplCopyWithImpl<$Res>
    extends _$RackStateCopyWithImpl<$Res, _$SelectedRackImpl>
    implements _$$SelectedRackImplCopyWith<$Res> {
  __$$SelectedRackImplCopyWithImpl(
      _$SelectedRackImpl _value, $Res Function(_$SelectedRackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRack = null,
  }) {
    return _then(_$SelectedRackImpl(
      null == selectedRack
          ? _value._selectedRack
          : selectedRack // ignore: cast_nullable_to_non_nullable
              as List<Racks>,
    ));
  }
}

/// @nodoc

class _$SelectedRackImpl implements SelectedRack {
  const _$SelectedRackImpl(final List<Racks> selectedRack)
      : _selectedRack = selectedRack;

  final List<Racks> _selectedRack;
  @override
  List<Racks> get selectedRack {
    if (_selectedRack is EqualUnmodifiableListView) return _selectedRack;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedRack);
  }

  @override
  String toString() {
    return 'RackState.selectedRack(selectedRack: $selectedRack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedRackImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedRack, _selectedRack));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedRack));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedRackImplCopyWith<_$SelectedRackImpl> get copyWith =>
      __$$SelectedRackImplCopyWithImpl<_$SelectedRackImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Racks> rackList) loadRackList,
    required TResult Function(List<Racks> selectedRack) selectedRack,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return selectedRack(this.selectedRack);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Racks> rackList)? loadRackList,
    TResult? Function(List<Racks> selectedRack)? selectedRack,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return selectedRack?.call(this.selectedRack);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Racks> rackList)? loadRackList,
    TResult Function(List<Racks> selectedRack)? selectedRack,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
    TResult Function()? success,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (selectedRack != null) {
      return selectedRack(this.selectedRack);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RackList value) loadRackList,
    required TResult Function(SelectedRack value) selectedRack,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateLoading value) updateLoading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return selectedRack(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RackList value)? loadRackList,
    TResult? Function(SelectedRack value)? selectedRack,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateLoading value)? updateLoading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return selectedRack?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RackList value)? loadRackList,
    TResult Function(SelectedRack value)? selectedRack,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateLoading value)? updateLoading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (selectedRack != null) {
      return selectedRack(this);
    }
    return orElse();
  }
}

abstract class SelectedRack implements RackState {
  const factory SelectedRack(final List<Racks> selectedRack) =
      _$SelectedRackImpl;

  List<Racks> get selectedRack;
  @JsonKey(ignore: true)
  _$$SelectedRackImplCopyWith<_$SelectedRackImpl> get copyWith =>
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
    extends _$RackStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'RackState.initial()';
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
    required TResult Function(List<Racks> rackList) loadRackList,
    required TResult Function(List<Racks> selectedRack) selectedRack,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Racks> rackList)? loadRackList,
    TResult? Function(List<Racks> selectedRack)? selectedRack,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Racks> rackList)? loadRackList,
    TResult Function(List<Racks> selectedRack)? selectedRack,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
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
    required TResult Function(RackList value) loadRackList,
    required TResult Function(SelectedRack value) selectedRack,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateLoading value) updateLoading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RackList value)? loadRackList,
    TResult? Function(SelectedRack value)? selectedRack,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateLoading value)? updateLoading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RackList value)? loadRackList,
    TResult Function(SelectedRack value)? selectedRack,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateLoading value)? updateLoading,
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

abstract class Initial implements RackState {
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
    extends _$RackStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'RackState.loading()';
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
    required TResult Function(List<Racks> rackList) loadRackList,
    required TResult Function(List<Racks> selectedRack) selectedRack,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Racks> rackList)? loadRackList,
    TResult? Function(List<Racks> selectedRack)? selectedRack,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Racks> rackList)? loadRackList,
    TResult Function(List<Racks> selectedRack)? selectedRack,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
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
    required TResult Function(RackList value) loadRackList,
    required TResult Function(SelectedRack value) selectedRack,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateLoading value) updateLoading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RackList value)? loadRackList,
    TResult? Function(SelectedRack value)? selectedRack,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateLoading value)? updateLoading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RackList value)? loadRackList,
    TResult Function(SelectedRack value)? selectedRack,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateLoading value)? updateLoading,
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

abstract class Loading implements RackState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$UpdateLoadingImplCopyWith<$Res> {
  factory _$$UpdateLoadingImplCopyWith(
          _$UpdateLoadingImpl value, $Res Function(_$UpdateLoadingImpl) then) =
      __$$UpdateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateLoadingImplCopyWithImpl<$Res>
    extends _$RackStateCopyWithImpl<$Res, _$UpdateLoadingImpl>
    implements _$$UpdateLoadingImplCopyWith<$Res> {
  __$$UpdateLoadingImplCopyWithImpl(
      _$UpdateLoadingImpl _value, $Res Function(_$UpdateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateLoadingImpl implements UpdateLoading {
  const _$UpdateLoadingImpl();

  @override
  String toString() {
    return 'RackState.updateLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Racks> rackList) loadRackList,
    required TResult Function(List<Racks> selectedRack) selectedRack,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return updateLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Racks> rackList)? loadRackList,
    TResult? Function(List<Racks> selectedRack)? selectedRack,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return updateLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Racks> rackList)? loadRackList,
    TResult Function(List<Racks> selectedRack)? selectedRack,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
    TResult Function()? success,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (updateLoading != null) {
      return updateLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RackList value) loadRackList,
    required TResult Function(SelectedRack value) selectedRack,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateLoading value) updateLoading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return updateLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RackList value)? loadRackList,
    TResult? Function(SelectedRack value)? selectedRack,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateLoading value)? updateLoading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return updateLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RackList value)? loadRackList,
    TResult Function(SelectedRack value)? selectedRack,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateLoading value)? updateLoading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (updateLoading != null) {
      return updateLoading(this);
    }
    return orElse();
  }
}

abstract class UpdateLoading implements RackState {
  const factory UpdateLoading() = _$UpdateLoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$RackStateCopyWithImpl<$Res, _$SuccessImpl>
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
    return 'RackState.success()';
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
    required TResult Function(List<Racks> rackList) loadRackList,
    required TResult Function(List<Racks> selectedRack) selectedRack,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Racks> rackList)? loadRackList,
    TResult? Function(List<Racks> selectedRack)? selectedRack,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Racks> rackList)? loadRackList,
    TResult Function(List<Racks> selectedRack)? selectedRack,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
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
    required TResult Function(RackList value) loadRackList,
    required TResult Function(SelectedRack value) selectedRack,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateLoading value) updateLoading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RackList value)? loadRackList,
    TResult? Function(SelectedRack value)? selectedRack,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateLoading value)? updateLoading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RackList value)? loadRackList,
    TResult Function(SelectedRack value)? selectedRack,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateLoading value)? updateLoading,
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

abstract class Success implements RackState {
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
    extends _$RackStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'RackState.error(error: $error)';
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
    required TResult Function(List<Racks> rackList) loadRackList,
    required TResult Function(List<Racks> selectedRack) selectedRack,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() updateLoading,
    required TResult Function() success,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Racks> rackList)? loadRackList,
    TResult? Function(List<Racks> selectedRack)? selectedRack,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? updateLoading,
    TResult? Function()? success,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Racks> rackList)? loadRackList,
    TResult Function(List<Racks> selectedRack)? selectedRack,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? updateLoading,
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
    required TResult Function(RackList value) loadRackList,
    required TResult Function(SelectedRack value) selectedRack,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UpdateLoading value) updateLoading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RackList value)? loadRackList,
    TResult? Function(SelectedRack value)? selectedRack,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UpdateLoading value)? updateLoading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RackList value)? loadRackList,
    TResult Function(SelectedRack value)? selectedRack,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UpdateLoading value)? updateLoading,
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

abstract class Error implements RackState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
