// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_tacker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InventoryTrackerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InventoryTracker> inventoryTracker)
        loadInventoryTrcker,
    required TResult Function(Map<int, List<InventoryTracker>> categoryMap)
        loadCategory,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InventoryTracker> inventoryTracker)?
        loadInventoryTrcker,
    TResult? Function(Map<int, List<InventoryTracker>> categoryMap)?
        loadCategory,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InventoryTracker> inventoryTracker)?
        loadInventoryTrcker,
    TResult Function(Map<int, List<InventoryTracker>> categoryMap)?
        loadCategory,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryTrackerList value) loadInventoryTrcker,
    required TResult Function(CategoryListMap value) loadCategory,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryTrackerList value)? loadInventoryTrcker,
    TResult? Function(CategoryListMap value)? loadCategory,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryTrackerList value)? loadInventoryTrcker,
    TResult Function(CategoryListMap value)? loadCategory,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryTrackerStateCopyWith<$Res> {
  factory $InventoryTrackerStateCopyWith(InventoryTrackerState value,
          $Res Function(InventoryTrackerState) then) =
      _$InventoryTrackerStateCopyWithImpl<$Res, InventoryTrackerState>;
}

/// @nodoc
class _$InventoryTrackerStateCopyWithImpl<$Res,
        $Val extends InventoryTrackerState>
    implements $InventoryTrackerStateCopyWith<$Res> {
  _$InventoryTrackerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InventoryTrackerListImplCopyWith<$Res> {
  factory _$$InventoryTrackerListImplCopyWith(_$InventoryTrackerListImpl value,
          $Res Function(_$InventoryTrackerListImpl) then) =
      __$$InventoryTrackerListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<InventoryTracker> inventoryTracker});
}

/// @nodoc
class __$$InventoryTrackerListImplCopyWithImpl<$Res>
    extends _$InventoryTrackerStateCopyWithImpl<$Res,
        _$InventoryTrackerListImpl>
    implements _$$InventoryTrackerListImplCopyWith<$Res> {
  __$$InventoryTrackerListImplCopyWithImpl(_$InventoryTrackerListImpl _value,
      $Res Function(_$InventoryTrackerListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inventoryTracker = null,
  }) {
    return _then(_$InventoryTrackerListImpl(
      null == inventoryTracker
          ? _value._inventoryTracker
          : inventoryTracker // ignore: cast_nullable_to_non_nullable
              as List<InventoryTracker>,
    ));
  }
}

/// @nodoc

class _$InventoryTrackerListImpl implements InventoryTrackerList {
  const _$InventoryTrackerListImpl(
      final List<InventoryTracker> inventoryTracker)
      : _inventoryTracker = inventoryTracker;

  final List<InventoryTracker> _inventoryTracker;
  @override
  List<InventoryTracker> get inventoryTracker {
    if (_inventoryTracker is EqualUnmodifiableListView)
      return _inventoryTracker;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inventoryTracker);
  }

  @override
  String toString() {
    return 'InventoryTrackerState.loadInventoryTrcker(inventoryTracker: $inventoryTracker)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryTrackerListImpl &&
            const DeepCollectionEquality()
                .equals(other._inventoryTracker, _inventoryTracker));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_inventoryTracker));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryTrackerListImplCopyWith<_$InventoryTrackerListImpl>
      get copyWith =>
          __$$InventoryTrackerListImplCopyWithImpl<_$InventoryTrackerListImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InventoryTracker> inventoryTracker)
        loadInventoryTrcker,
    required TResult Function(Map<int, List<InventoryTracker>> categoryMap)
        loadCategory,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadInventoryTrcker(inventoryTracker);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InventoryTracker> inventoryTracker)?
        loadInventoryTrcker,
    TResult? Function(Map<int, List<InventoryTracker>> categoryMap)?
        loadCategory,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadInventoryTrcker?.call(inventoryTracker);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InventoryTracker> inventoryTracker)?
        loadInventoryTrcker,
    TResult Function(Map<int, List<InventoryTracker>> categoryMap)?
        loadCategory,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadInventoryTrcker != null) {
      return loadInventoryTrcker(inventoryTracker);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryTrackerList value) loadInventoryTrcker,
    required TResult Function(CategoryListMap value) loadCategory,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadInventoryTrcker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryTrackerList value)? loadInventoryTrcker,
    TResult? Function(CategoryListMap value)? loadCategory,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadInventoryTrcker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryTrackerList value)? loadInventoryTrcker,
    TResult Function(CategoryListMap value)? loadCategory,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadInventoryTrcker != null) {
      return loadInventoryTrcker(this);
    }
    return orElse();
  }
}

abstract class InventoryTrackerList implements InventoryTrackerState {
  const factory InventoryTrackerList(
          final List<InventoryTracker> inventoryTracker) =
      _$InventoryTrackerListImpl;

  List<InventoryTracker> get inventoryTracker;
  @JsonKey(ignore: true)
  _$$InventoryTrackerListImplCopyWith<_$InventoryTrackerListImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryListMapImplCopyWith<$Res> {
  factory _$$CategoryListMapImplCopyWith(_$CategoryListMapImpl value,
          $Res Function(_$CategoryListMapImpl) then) =
      __$$CategoryListMapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<int, List<InventoryTracker>> categoryMap});
}

/// @nodoc
class __$$CategoryListMapImplCopyWithImpl<$Res>
    extends _$InventoryTrackerStateCopyWithImpl<$Res, _$CategoryListMapImpl>
    implements _$$CategoryListMapImplCopyWith<$Res> {
  __$$CategoryListMapImplCopyWithImpl(
      _$CategoryListMapImpl _value, $Res Function(_$CategoryListMapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryMap = null,
  }) {
    return _then(_$CategoryListMapImpl(
      null == categoryMap
          ? _value._categoryMap
          : categoryMap // ignore: cast_nullable_to_non_nullable
              as Map<int, List<InventoryTracker>>,
    ));
  }
}

/// @nodoc

class _$CategoryListMapImpl implements CategoryListMap {
  const _$CategoryListMapImpl(
      final Map<int, List<InventoryTracker>> categoryMap)
      : _categoryMap = categoryMap;

  final Map<int, List<InventoryTracker>> _categoryMap;
  @override
  Map<int, List<InventoryTracker>> get categoryMap {
    if (_categoryMap is EqualUnmodifiableMapView) return _categoryMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryMap);
  }

  @override
  String toString() {
    return 'InventoryTrackerState.loadCategory(categoryMap: $categoryMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryListMapImpl &&
            const DeepCollectionEquality()
                .equals(other._categoryMap, _categoryMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categoryMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryListMapImplCopyWith<_$CategoryListMapImpl> get copyWith =>
      __$$CategoryListMapImplCopyWithImpl<_$CategoryListMapImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<InventoryTracker> inventoryTracker)
        loadInventoryTrcker,
    required TResult Function(Map<int, List<InventoryTracker>> categoryMap)
        loadCategory,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadCategory(categoryMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InventoryTracker> inventoryTracker)?
        loadInventoryTrcker,
    TResult? Function(Map<int, List<InventoryTracker>> categoryMap)?
        loadCategory,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadCategory?.call(categoryMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InventoryTracker> inventoryTracker)?
        loadInventoryTrcker,
    TResult Function(Map<int, List<InventoryTracker>> categoryMap)?
        loadCategory,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadCategory != null) {
      return loadCategory(categoryMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryTrackerList value) loadInventoryTrcker,
    required TResult Function(CategoryListMap value) loadCategory,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryTrackerList value)? loadInventoryTrcker,
    TResult? Function(CategoryListMap value)? loadCategory,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryTrackerList value)? loadInventoryTrcker,
    TResult Function(CategoryListMap value)? loadCategory,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadCategory != null) {
      return loadCategory(this);
    }
    return orElse();
  }
}

abstract class CategoryListMap implements InventoryTrackerState {
  const factory CategoryListMap(
          final Map<int, List<InventoryTracker>> categoryMap) =
      _$CategoryListMapImpl;

  Map<int, List<InventoryTracker>> get categoryMap;
  @JsonKey(ignore: true)
  _$$CategoryListMapImplCopyWith<_$CategoryListMapImpl> get copyWith =>
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
    extends _$InventoryTrackerStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'InventoryTrackerState.initial()';
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
    required TResult Function(List<InventoryTracker> inventoryTracker)
        loadInventoryTrcker,
    required TResult Function(Map<int, List<InventoryTracker>> categoryMap)
        loadCategory,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InventoryTracker> inventoryTracker)?
        loadInventoryTrcker,
    TResult? Function(Map<int, List<InventoryTracker>> categoryMap)?
        loadCategory,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InventoryTracker> inventoryTracker)?
        loadInventoryTrcker,
    TResult Function(Map<int, List<InventoryTracker>> categoryMap)?
        loadCategory,
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
    required TResult Function(InventoryTrackerList value) loadInventoryTrcker,
    required TResult Function(CategoryListMap value) loadCategory,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryTrackerList value)? loadInventoryTrcker,
    TResult? Function(CategoryListMap value)? loadCategory,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryTrackerList value)? loadInventoryTrcker,
    TResult Function(CategoryListMap value)? loadCategory,
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

abstract class Initial implements InventoryTrackerState {
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
    extends _$InventoryTrackerStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'InventoryTrackerState.loading()';
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
    required TResult Function(List<InventoryTracker> inventoryTracker)
        loadInventoryTrcker,
    required TResult Function(Map<int, List<InventoryTracker>> categoryMap)
        loadCategory,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InventoryTracker> inventoryTracker)?
        loadInventoryTrcker,
    TResult? Function(Map<int, List<InventoryTracker>> categoryMap)?
        loadCategory,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InventoryTracker> inventoryTracker)?
        loadInventoryTrcker,
    TResult Function(Map<int, List<InventoryTracker>> categoryMap)?
        loadCategory,
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
    required TResult Function(InventoryTrackerList value) loadInventoryTrcker,
    required TResult Function(CategoryListMap value) loadCategory,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryTrackerList value)? loadInventoryTrcker,
    TResult? Function(CategoryListMap value)? loadCategory,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryTrackerList value)? loadInventoryTrcker,
    TResult Function(CategoryListMap value)? loadCategory,
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

abstract class Loading implements InventoryTrackerState {
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
    extends _$InventoryTrackerStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'InventoryTrackerState.error(error: $error)';
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
    required TResult Function(List<InventoryTracker> inventoryTracker)
        loadInventoryTrcker,
    required TResult Function(Map<int, List<InventoryTracker>> categoryMap)
        loadCategory,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<InventoryTracker> inventoryTracker)?
        loadInventoryTrcker,
    TResult? Function(Map<int, List<InventoryTracker>> categoryMap)?
        loadCategory,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<InventoryTracker> inventoryTracker)?
        loadInventoryTrcker,
    TResult Function(Map<int, List<InventoryTracker>> categoryMap)?
        loadCategory,
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
    required TResult Function(InventoryTrackerList value) loadInventoryTrcker,
    required TResult Function(CategoryListMap value) loadCategory,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryTrackerList value)? loadInventoryTrcker,
    TResult? Function(CategoryListMap value)? loadCategory,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryTrackerList value)? loadInventoryTrcker,
    TResult Function(CategoryListMap value)? loadCategory,
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

abstract class Error implements InventoryTrackerState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
