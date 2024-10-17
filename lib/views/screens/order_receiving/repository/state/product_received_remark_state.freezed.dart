// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_received_remark_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductReceivedRemarkState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReasonsData> productReceivedRemarkList)
        loadProductReceivedRemark,
    required TResult Function(
            Map<String, dynamic> selectedProductReceivedRemark)
        selectedProductReceivedRemark,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReasonsData> productReceivedRemarkList)?
        loadProductReceivedRemark,
    TResult? Function(Map<String, dynamic> selectedProductReceivedRemark)?
        selectedProductReceivedRemark,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReasonsData> productReceivedRemarkList)?
        loadProductReceivedRemark,
    TResult Function(Map<String, dynamic> selectedProductReceivedRemark)?
        selectedProductReceivedRemark,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductReceivedRemarkList value)
        loadProductReceivedRemark,
    required TResult Function(SelectedProductReceivedRemark value)
        selectedProductReceivedRemark,
    required TResult Function(Initial value) initial,
    required TResult Function(ProducReceivedRemarkLoading value) loading,
    required TResult Function(ProducReceivedRemarkError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductReceivedRemarkList value)?
        loadProductReceivedRemark,
    TResult? Function(SelectedProductReceivedRemark value)?
        selectedProductReceivedRemark,
    TResult? Function(Initial value)? initial,
    TResult? Function(ProducReceivedRemarkLoading value)? loading,
    TResult? Function(ProducReceivedRemarkError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductReceivedRemarkList value)?
        loadProductReceivedRemark,
    TResult Function(SelectedProductReceivedRemark value)?
        selectedProductReceivedRemark,
    TResult Function(Initial value)? initial,
    TResult Function(ProducReceivedRemarkLoading value)? loading,
    TResult Function(ProducReceivedRemarkError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReceivedRemarkStateCopyWith<$Res> {
  factory $ProductReceivedRemarkStateCopyWith(ProductReceivedRemarkState value,
          $Res Function(ProductReceivedRemarkState) then) =
      _$ProductReceivedRemarkStateCopyWithImpl<$Res,
          ProductReceivedRemarkState>;
}

/// @nodoc
class _$ProductReceivedRemarkStateCopyWithImpl<$Res,
        $Val extends ProductReceivedRemarkState>
    implements $ProductReceivedRemarkStateCopyWith<$Res> {
  _$ProductReceivedRemarkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProductReceivedRemarkListImplCopyWith<$Res> {
  factory _$$ProductReceivedRemarkListImplCopyWith(
          _$ProductReceivedRemarkListImpl value,
          $Res Function(_$ProductReceivedRemarkListImpl) then) =
      __$$ProductReceivedRemarkListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ReasonsData> productReceivedRemarkList});
}

/// @nodoc
class __$$ProductReceivedRemarkListImplCopyWithImpl<$Res>
    extends _$ProductReceivedRemarkStateCopyWithImpl<$Res,
        _$ProductReceivedRemarkListImpl>
    implements _$$ProductReceivedRemarkListImplCopyWith<$Res> {
  __$$ProductReceivedRemarkListImplCopyWithImpl(
      _$ProductReceivedRemarkListImpl _value,
      $Res Function(_$ProductReceivedRemarkListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReceivedRemarkList = null,
  }) {
    return _then(_$ProductReceivedRemarkListImpl(
      null == productReceivedRemarkList
          ? _value._productReceivedRemarkList
          : productReceivedRemarkList // ignore: cast_nullable_to_non_nullable
              as List<ReasonsData>,
    ));
  }
}

/// @nodoc

class _$ProductReceivedRemarkListImpl implements ProductReceivedRemarkList {
  const _$ProductReceivedRemarkListImpl(
      final List<ReasonsData> productReceivedRemarkList)
      : _productReceivedRemarkList = productReceivedRemarkList;

  final List<ReasonsData> _productReceivedRemarkList;
  @override
  List<ReasonsData> get productReceivedRemarkList {
    if (_productReceivedRemarkList is EqualUnmodifiableListView)
      return _productReceivedRemarkList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productReceivedRemarkList);
  }

  @override
  String toString() {
    return 'ProductReceivedRemarkState.loadProductReceivedRemark(productReceivedRemarkList: $productReceivedRemarkList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReceivedRemarkListImpl &&
            const DeepCollectionEquality().equals(
                other._productReceivedRemarkList, _productReceivedRemarkList));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_productReceivedRemarkList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReceivedRemarkListImplCopyWith<_$ProductReceivedRemarkListImpl>
      get copyWith => __$$ProductReceivedRemarkListImplCopyWithImpl<
          _$ProductReceivedRemarkListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReasonsData> productReceivedRemarkList)
        loadProductReceivedRemark,
    required TResult Function(
            Map<String, dynamic> selectedProductReceivedRemark)
        selectedProductReceivedRemark,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadProductReceivedRemark(productReceivedRemarkList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReasonsData> productReceivedRemarkList)?
        loadProductReceivedRemark,
    TResult? Function(Map<String, dynamic> selectedProductReceivedRemark)?
        selectedProductReceivedRemark,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadProductReceivedRemark?.call(productReceivedRemarkList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReasonsData> productReceivedRemarkList)?
        loadProductReceivedRemark,
    TResult Function(Map<String, dynamic> selectedProductReceivedRemark)?
        selectedProductReceivedRemark,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadProductReceivedRemark != null) {
      return loadProductReceivedRemark(productReceivedRemarkList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductReceivedRemarkList value)
        loadProductReceivedRemark,
    required TResult Function(SelectedProductReceivedRemark value)
        selectedProductReceivedRemark,
    required TResult Function(Initial value) initial,
    required TResult Function(ProducReceivedRemarkLoading value) loading,
    required TResult Function(ProducReceivedRemarkError value) error,
  }) {
    return loadProductReceivedRemark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductReceivedRemarkList value)?
        loadProductReceivedRemark,
    TResult? Function(SelectedProductReceivedRemark value)?
        selectedProductReceivedRemark,
    TResult? Function(Initial value)? initial,
    TResult? Function(ProducReceivedRemarkLoading value)? loading,
    TResult? Function(ProducReceivedRemarkError value)? error,
  }) {
    return loadProductReceivedRemark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductReceivedRemarkList value)?
        loadProductReceivedRemark,
    TResult Function(SelectedProductReceivedRemark value)?
        selectedProductReceivedRemark,
    TResult Function(Initial value)? initial,
    TResult Function(ProducReceivedRemarkLoading value)? loading,
    TResult Function(ProducReceivedRemarkError value)? error,
    required TResult orElse(),
  }) {
    if (loadProductReceivedRemark != null) {
      return loadProductReceivedRemark(this);
    }
    return orElse();
  }
}

abstract class ProductReceivedRemarkList implements ProductReceivedRemarkState {
  const factory ProductReceivedRemarkList(
          final List<ReasonsData> productReceivedRemarkList) =
      _$ProductReceivedRemarkListImpl;

  List<ReasonsData> get productReceivedRemarkList;
  @JsonKey(ignore: true)
  _$$ProductReceivedRemarkListImplCopyWith<_$ProductReceivedRemarkListImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedProductReceivedRemarkImplCopyWith<$Res> {
  factory _$$SelectedProductReceivedRemarkImplCopyWith(
          _$SelectedProductReceivedRemarkImpl value,
          $Res Function(_$SelectedProductReceivedRemarkImpl) then) =
      __$$SelectedProductReceivedRemarkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> selectedProductReceivedRemark});
}

/// @nodoc
class __$$SelectedProductReceivedRemarkImplCopyWithImpl<$Res>
    extends _$ProductReceivedRemarkStateCopyWithImpl<$Res,
        _$SelectedProductReceivedRemarkImpl>
    implements _$$SelectedProductReceivedRemarkImplCopyWith<$Res> {
  __$$SelectedProductReceivedRemarkImplCopyWithImpl(
      _$SelectedProductReceivedRemarkImpl _value,
      $Res Function(_$SelectedProductReceivedRemarkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedProductReceivedRemark = null,
  }) {
    return _then(_$SelectedProductReceivedRemarkImpl(
      null == selectedProductReceivedRemark
          ? _value._selectedProductReceivedRemark
          : selectedProductReceivedRemark // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$SelectedProductReceivedRemarkImpl
    implements SelectedProductReceivedRemark {
  const _$SelectedProductReceivedRemarkImpl(
      final Map<String, dynamic> selectedProductReceivedRemark)
      : _selectedProductReceivedRemark = selectedProductReceivedRemark;

  final Map<String, dynamic> _selectedProductReceivedRemark;
  @override
  Map<String, dynamic> get selectedProductReceivedRemark {
    if (_selectedProductReceivedRemark is EqualUnmodifiableMapView)
      return _selectedProductReceivedRemark;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedProductReceivedRemark);
  }

  @override
  String toString() {
    return 'ProductReceivedRemarkState.selectedProductReceivedRemark(selectedProductReceivedRemark: $selectedProductReceivedRemark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedProductReceivedRemarkImpl &&
            const DeepCollectionEquality().equals(
                other._selectedProductReceivedRemark,
                _selectedProductReceivedRemark));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_selectedProductReceivedRemark));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedProductReceivedRemarkImplCopyWith<
          _$SelectedProductReceivedRemarkImpl>
      get copyWith => __$$SelectedProductReceivedRemarkImplCopyWithImpl<
          _$SelectedProductReceivedRemarkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReasonsData> productReceivedRemarkList)
        loadProductReceivedRemark,
    required TResult Function(
            Map<String, dynamic> selectedProductReceivedRemark)
        selectedProductReceivedRemark,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return selectedProductReceivedRemark(this.selectedProductReceivedRemark);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReasonsData> productReceivedRemarkList)?
        loadProductReceivedRemark,
    TResult? Function(Map<String, dynamic> selectedProductReceivedRemark)?
        selectedProductReceivedRemark,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return selectedProductReceivedRemark
        ?.call(this.selectedProductReceivedRemark);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReasonsData> productReceivedRemarkList)?
        loadProductReceivedRemark,
    TResult Function(Map<String, dynamic> selectedProductReceivedRemark)?
        selectedProductReceivedRemark,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (selectedProductReceivedRemark != null) {
      return selectedProductReceivedRemark(this.selectedProductReceivedRemark);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductReceivedRemarkList value)
        loadProductReceivedRemark,
    required TResult Function(SelectedProductReceivedRemark value)
        selectedProductReceivedRemark,
    required TResult Function(Initial value) initial,
    required TResult Function(ProducReceivedRemarkLoading value) loading,
    required TResult Function(ProducReceivedRemarkError value) error,
  }) {
    return selectedProductReceivedRemark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductReceivedRemarkList value)?
        loadProductReceivedRemark,
    TResult? Function(SelectedProductReceivedRemark value)?
        selectedProductReceivedRemark,
    TResult? Function(Initial value)? initial,
    TResult? Function(ProducReceivedRemarkLoading value)? loading,
    TResult? Function(ProducReceivedRemarkError value)? error,
  }) {
    return selectedProductReceivedRemark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductReceivedRemarkList value)?
        loadProductReceivedRemark,
    TResult Function(SelectedProductReceivedRemark value)?
        selectedProductReceivedRemark,
    TResult Function(Initial value)? initial,
    TResult Function(ProducReceivedRemarkLoading value)? loading,
    TResult Function(ProducReceivedRemarkError value)? error,
    required TResult orElse(),
  }) {
    if (selectedProductReceivedRemark != null) {
      return selectedProductReceivedRemark(this);
    }
    return orElse();
  }
}

abstract class SelectedProductReceivedRemark
    implements ProductReceivedRemarkState {
  const factory SelectedProductReceivedRemark(
          final Map<String, dynamic> selectedProductReceivedRemark) =
      _$SelectedProductReceivedRemarkImpl;

  Map<String, dynamic> get selectedProductReceivedRemark;
  @JsonKey(ignore: true)
  _$$SelectedProductReceivedRemarkImplCopyWith<
          _$SelectedProductReceivedRemarkImpl>
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
    extends _$ProductReceivedRemarkStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ProductReceivedRemarkState.initial()';
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
    required TResult Function(List<ReasonsData> productReceivedRemarkList)
        loadProductReceivedRemark,
    required TResult Function(
            Map<String, dynamic> selectedProductReceivedRemark)
        selectedProductReceivedRemark,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReasonsData> productReceivedRemarkList)?
        loadProductReceivedRemark,
    TResult? Function(Map<String, dynamic> selectedProductReceivedRemark)?
        selectedProductReceivedRemark,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReasonsData> productReceivedRemarkList)?
        loadProductReceivedRemark,
    TResult Function(Map<String, dynamic> selectedProductReceivedRemark)?
        selectedProductReceivedRemark,
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
    required TResult Function(ProductReceivedRemarkList value)
        loadProductReceivedRemark,
    required TResult Function(SelectedProductReceivedRemark value)
        selectedProductReceivedRemark,
    required TResult Function(Initial value) initial,
    required TResult Function(ProducReceivedRemarkLoading value) loading,
    required TResult Function(ProducReceivedRemarkError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductReceivedRemarkList value)?
        loadProductReceivedRemark,
    TResult? Function(SelectedProductReceivedRemark value)?
        selectedProductReceivedRemark,
    TResult? Function(Initial value)? initial,
    TResult? Function(ProducReceivedRemarkLoading value)? loading,
    TResult? Function(ProducReceivedRemarkError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductReceivedRemarkList value)?
        loadProductReceivedRemark,
    TResult Function(SelectedProductReceivedRemark value)?
        selectedProductReceivedRemark,
    TResult Function(Initial value)? initial,
    TResult Function(ProducReceivedRemarkLoading value)? loading,
    TResult Function(ProducReceivedRemarkError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ProductReceivedRemarkState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ProducReceivedRemarkLoadingImplCopyWith<$Res> {
  factory _$$ProducReceivedRemarkLoadingImplCopyWith(
          _$ProducReceivedRemarkLoadingImpl value,
          $Res Function(_$ProducReceivedRemarkLoadingImpl) then) =
      __$$ProducReceivedRemarkLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProducReceivedRemarkLoadingImplCopyWithImpl<$Res>
    extends _$ProductReceivedRemarkStateCopyWithImpl<$Res,
        _$ProducReceivedRemarkLoadingImpl>
    implements _$$ProducReceivedRemarkLoadingImplCopyWith<$Res> {
  __$$ProducReceivedRemarkLoadingImplCopyWithImpl(
      _$ProducReceivedRemarkLoadingImpl _value,
      $Res Function(_$ProducReceivedRemarkLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProducReceivedRemarkLoadingImpl implements ProducReceivedRemarkLoading {
  const _$ProducReceivedRemarkLoadingImpl();

  @override
  String toString() {
    return 'ProductReceivedRemarkState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProducReceivedRemarkLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReasonsData> productReceivedRemarkList)
        loadProductReceivedRemark,
    required TResult Function(
            Map<String, dynamic> selectedProductReceivedRemark)
        selectedProductReceivedRemark,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReasonsData> productReceivedRemarkList)?
        loadProductReceivedRemark,
    TResult? Function(Map<String, dynamic> selectedProductReceivedRemark)?
        selectedProductReceivedRemark,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReasonsData> productReceivedRemarkList)?
        loadProductReceivedRemark,
    TResult Function(Map<String, dynamic> selectedProductReceivedRemark)?
        selectedProductReceivedRemark,
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
    required TResult Function(ProductReceivedRemarkList value)
        loadProductReceivedRemark,
    required TResult Function(SelectedProductReceivedRemark value)
        selectedProductReceivedRemark,
    required TResult Function(Initial value) initial,
    required TResult Function(ProducReceivedRemarkLoading value) loading,
    required TResult Function(ProducReceivedRemarkError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductReceivedRemarkList value)?
        loadProductReceivedRemark,
    TResult? Function(SelectedProductReceivedRemark value)?
        selectedProductReceivedRemark,
    TResult? Function(Initial value)? initial,
    TResult? Function(ProducReceivedRemarkLoading value)? loading,
    TResult? Function(ProducReceivedRemarkError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductReceivedRemarkList value)?
        loadProductReceivedRemark,
    TResult Function(SelectedProductReceivedRemark value)?
        selectedProductReceivedRemark,
    TResult Function(Initial value)? initial,
    TResult Function(ProducReceivedRemarkLoading value)? loading,
    TResult Function(ProducReceivedRemarkError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProducReceivedRemarkLoading
    implements ProductReceivedRemarkState {
  const factory ProducReceivedRemarkLoading() =
      _$ProducReceivedRemarkLoadingImpl;
}

/// @nodoc
abstract class _$$ProducReceivedRemarkErrorImplCopyWith<$Res> {
  factory _$$ProducReceivedRemarkErrorImplCopyWith(
          _$ProducReceivedRemarkErrorImpl value,
          $Res Function(_$ProducReceivedRemarkErrorImpl) then) =
      __$$ProducReceivedRemarkErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$ProducReceivedRemarkErrorImplCopyWithImpl<$Res>
    extends _$ProductReceivedRemarkStateCopyWithImpl<$Res,
        _$ProducReceivedRemarkErrorImpl>
    implements _$$ProducReceivedRemarkErrorImplCopyWith<$Res> {
  __$$ProducReceivedRemarkErrorImplCopyWithImpl(
      _$ProducReceivedRemarkErrorImpl _value,
      $Res Function(_$ProducReceivedRemarkErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ProducReceivedRemarkErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProducReceivedRemarkErrorImpl implements ProducReceivedRemarkError {
  const _$ProducReceivedRemarkErrorImpl({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'ProductReceivedRemarkState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProducReceivedRemarkErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProducReceivedRemarkErrorImplCopyWith<_$ProducReceivedRemarkErrorImpl>
      get copyWith => __$$ProducReceivedRemarkErrorImplCopyWithImpl<
          _$ProducReceivedRemarkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ReasonsData> productReceivedRemarkList)
        loadProductReceivedRemark,
    required TResult Function(
            Map<String, dynamic> selectedProductReceivedRemark)
        selectedProductReceivedRemark,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ReasonsData> productReceivedRemarkList)?
        loadProductReceivedRemark,
    TResult? Function(Map<String, dynamic> selectedProductReceivedRemark)?
        selectedProductReceivedRemark,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ReasonsData> productReceivedRemarkList)?
        loadProductReceivedRemark,
    TResult Function(Map<String, dynamic> selectedProductReceivedRemark)?
        selectedProductReceivedRemark,
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
    required TResult Function(ProductReceivedRemarkList value)
        loadProductReceivedRemark,
    required TResult Function(SelectedProductReceivedRemark value)
        selectedProductReceivedRemark,
    required TResult Function(Initial value) initial,
    required TResult Function(ProducReceivedRemarkLoading value) loading,
    required TResult Function(ProducReceivedRemarkError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductReceivedRemarkList value)?
        loadProductReceivedRemark,
    TResult? Function(SelectedProductReceivedRemark value)?
        selectedProductReceivedRemark,
    TResult? Function(Initial value)? initial,
    TResult? Function(ProducReceivedRemarkLoading value)? loading,
    TResult? Function(ProducReceivedRemarkError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductReceivedRemarkList value)?
        loadProductReceivedRemark,
    TResult Function(SelectedProductReceivedRemark value)?
        selectedProductReceivedRemark,
    TResult Function(Initial value)? initial,
    TResult Function(ProducReceivedRemarkLoading value)? loading,
    TResult Function(ProducReceivedRemarkError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProducReceivedRemarkError implements ProductReceivedRemarkState {
  const factory ProducReceivedRemarkError({final String? error}) =
      _$ProducReceivedRemarkErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ProducReceivedRemarkErrorImplCopyWith<_$ProducReceivedRemarkErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
