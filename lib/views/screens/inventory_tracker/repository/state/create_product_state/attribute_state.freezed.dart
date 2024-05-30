// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attribute_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AttributeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Attribute> attributeList) loadAttributeList,
    required TResult Function(List<Attribute> attributeListByID)
        loadAttributeListByID,
    required TResult Function(Attribute attribute) selectedAttribute,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() attributeLoading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Attribute> attributeList)? loadAttributeList,
    TResult? Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult? Function(Attribute attribute)? selectedAttribute,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? attributeLoading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Attribute> attributeList)? loadAttributeList,
    TResult Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult Function(Attribute attribute)? selectedAttribute,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? attributeLoading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttributeList value) loadAttributeList,
    required TResult Function(AttributeListByID value) loadAttributeListByID,
    required TResult Function(SelectedAttribute value) selectedAttribute,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(AttributeLoading value) attributeLoading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttributeList value)? loadAttributeList,
    TResult? Function(AttributeListByID value)? loadAttributeListByID,
    TResult? Function(SelectedAttribute value)? selectedAttribute,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(AttributeLoading value)? attributeLoading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttributeList value)? loadAttributeList,
    TResult Function(AttributeListByID value)? loadAttributeListByID,
    TResult Function(SelectedAttribute value)? selectedAttribute,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(AttributeLoading value)? attributeLoading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributeStateCopyWith<$Res> {
  factory $AttributeStateCopyWith(
          AttributeState value, $Res Function(AttributeState) then) =
      _$AttributeStateCopyWithImpl<$Res, AttributeState>;
}

/// @nodoc
class _$AttributeStateCopyWithImpl<$Res, $Val extends AttributeState>
    implements $AttributeStateCopyWith<$Res> {
  _$AttributeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AttributeListImplCopyWith<$Res> {
  factory _$$AttributeListImplCopyWith(
          _$AttributeListImpl value, $Res Function(_$AttributeListImpl) then) =
      __$$AttributeListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Attribute> attributeList});
}

/// @nodoc
class __$$AttributeListImplCopyWithImpl<$Res>
    extends _$AttributeStateCopyWithImpl<$Res, _$AttributeListImpl>
    implements _$$AttributeListImplCopyWith<$Res> {
  __$$AttributeListImplCopyWithImpl(
      _$AttributeListImpl _value, $Res Function(_$AttributeListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributeList = null,
  }) {
    return _then(_$AttributeListImpl(
      null == attributeList
          ? _value._attributeList
          : attributeList // ignore: cast_nullable_to_non_nullable
              as List<Attribute>,
    ));
  }
}

/// @nodoc

class _$AttributeListImpl implements AttributeList {
  const _$AttributeListImpl(final List<Attribute> attributeList)
      : _attributeList = attributeList;

  final List<Attribute> _attributeList;
  @override
  List<Attribute> get attributeList {
    if (_attributeList is EqualUnmodifiableListView) return _attributeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attributeList);
  }

  @override
  String toString() {
    return 'AttributeState.loadAttributeList(attributeList: $attributeList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttributeListImpl &&
            const DeepCollectionEquality()
                .equals(other._attributeList, _attributeList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_attributeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttributeListImplCopyWith<_$AttributeListImpl> get copyWith =>
      __$$AttributeListImplCopyWithImpl<_$AttributeListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Attribute> attributeList) loadAttributeList,
    required TResult Function(List<Attribute> attributeListByID)
        loadAttributeListByID,
    required TResult Function(Attribute attribute) selectedAttribute,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() attributeLoading,
    required TResult Function(String? error) error,
  }) {
    return loadAttributeList(attributeList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Attribute> attributeList)? loadAttributeList,
    TResult? Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult? Function(Attribute attribute)? selectedAttribute,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? attributeLoading,
    TResult? Function(String? error)? error,
  }) {
    return loadAttributeList?.call(attributeList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Attribute> attributeList)? loadAttributeList,
    TResult Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult Function(Attribute attribute)? selectedAttribute,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? attributeLoading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadAttributeList != null) {
      return loadAttributeList(attributeList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttributeList value) loadAttributeList,
    required TResult Function(AttributeListByID value) loadAttributeListByID,
    required TResult Function(SelectedAttribute value) selectedAttribute,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(AttributeLoading value) attributeLoading,
    required TResult Function(Error value) error,
  }) {
    return loadAttributeList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttributeList value)? loadAttributeList,
    TResult? Function(AttributeListByID value)? loadAttributeListByID,
    TResult? Function(SelectedAttribute value)? selectedAttribute,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(AttributeLoading value)? attributeLoading,
    TResult? Function(Error value)? error,
  }) {
    return loadAttributeList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttributeList value)? loadAttributeList,
    TResult Function(AttributeListByID value)? loadAttributeListByID,
    TResult Function(SelectedAttribute value)? selectedAttribute,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(AttributeLoading value)? attributeLoading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadAttributeList != null) {
      return loadAttributeList(this);
    }
    return orElse();
  }
}

abstract class AttributeList implements AttributeState {
  const factory AttributeList(final List<Attribute> attributeList) =
      _$AttributeListImpl;

  List<Attribute> get attributeList;
  @JsonKey(ignore: true)
  _$$AttributeListImplCopyWith<_$AttributeListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AttributeListByIDImplCopyWith<$Res> {
  factory _$$AttributeListByIDImplCopyWith(_$AttributeListByIDImpl value,
          $Res Function(_$AttributeListByIDImpl) then) =
      __$$AttributeListByIDImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Attribute> attributeListByID});
}

/// @nodoc
class __$$AttributeListByIDImplCopyWithImpl<$Res>
    extends _$AttributeStateCopyWithImpl<$Res, _$AttributeListByIDImpl>
    implements _$$AttributeListByIDImplCopyWith<$Res> {
  __$$AttributeListByIDImplCopyWithImpl(_$AttributeListByIDImpl _value,
      $Res Function(_$AttributeListByIDImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributeListByID = null,
  }) {
    return _then(_$AttributeListByIDImpl(
      null == attributeListByID
          ? _value._attributeListByID
          : attributeListByID // ignore: cast_nullable_to_non_nullable
              as List<Attribute>,
    ));
  }
}

/// @nodoc

class _$AttributeListByIDImpl implements AttributeListByID {
  const _$AttributeListByIDImpl(final List<Attribute> attributeListByID)
      : _attributeListByID = attributeListByID;

  final List<Attribute> _attributeListByID;
  @override
  List<Attribute> get attributeListByID {
    if (_attributeListByID is EqualUnmodifiableListView)
      return _attributeListByID;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attributeListByID);
  }

  @override
  String toString() {
    return 'AttributeState.loadAttributeListByID(attributeListByID: $attributeListByID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttributeListByIDImpl &&
            const DeepCollectionEquality()
                .equals(other._attributeListByID, _attributeListByID));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_attributeListByID));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttributeListByIDImplCopyWith<_$AttributeListByIDImpl> get copyWith =>
      __$$AttributeListByIDImplCopyWithImpl<_$AttributeListByIDImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Attribute> attributeList) loadAttributeList,
    required TResult Function(List<Attribute> attributeListByID)
        loadAttributeListByID,
    required TResult Function(Attribute attribute) selectedAttribute,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() attributeLoading,
    required TResult Function(String? error) error,
  }) {
    return loadAttributeListByID(attributeListByID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Attribute> attributeList)? loadAttributeList,
    TResult? Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult? Function(Attribute attribute)? selectedAttribute,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? attributeLoading,
    TResult? Function(String? error)? error,
  }) {
    return loadAttributeListByID?.call(attributeListByID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Attribute> attributeList)? loadAttributeList,
    TResult Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult Function(Attribute attribute)? selectedAttribute,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? attributeLoading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadAttributeListByID != null) {
      return loadAttributeListByID(attributeListByID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttributeList value) loadAttributeList,
    required TResult Function(AttributeListByID value) loadAttributeListByID,
    required TResult Function(SelectedAttribute value) selectedAttribute,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(AttributeLoading value) attributeLoading,
    required TResult Function(Error value) error,
  }) {
    return loadAttributeListByID(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttributeList value)? loadAttributeList,
    TResult? Function(AttributeListByID value)? loadAttributeListByID,
    TResult? Function(SelectedAttribute value)? selectedAttribute,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(AttributeLoading value)? attributeLoading,
    TResult? Function(Error value)? error,
  }) {
    return loadAttributeListByID?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttributeList value)? loadAttributeList,
    TResult Function(AttributeListByID value)? loadAttributeListByID,
    TResult Function(SelectedAttribute value)? selectedAttribute,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(AttributeLoading value)? attributeLoading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadAttributeListByID != null) {
      return loadAttributeListByID(this);
    }
    return orElse();
  }
}

abstract class AttributeListByID implements AttributeState {
  const factory AttributeListByID(final List<Attribute> attributeListByID) =
      _$AttributeListByIDImpl;

  List<Attribute> get attributeListByID;
  @JsonKey(ignore: true)
  _$$AttributeListByIDImplCopyWith<_$AttributeListByIDImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedAttributeImplCopyWith<$Res> {
  factory _$$SelectedAttributeImplCopyWith(_$SelectedAttributeImpl value,
          $Res Function(_$SelectedAttributeImpl) then) =
      __$$SelectedAttributeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Attribute attribute});
}

/// @nodoc
class __$$SelectedAttributeImplCopyWithImpl<$Res>
    extends _$AttributeStateCopyWithImpl<$Res, _$SelectedAttributeImpl>
    implements _$$SelectedAttributeImplCopyWith<$Res> {
  __$$SelectedAttributeImplCopyWithImpl(_$SelectedAttributeImpl _value,
      $Res Function(_$SelectedAttributeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attribute = null,
  }) {
    return _then(_$SelectedAttributeImpl(
      null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as Attribute,
    ));
  }
}

/// @nodoc

class _$SelectedAttributeImpl implements SelectedAttribute {
  const _$SelectedAttributeImpl(this.attribute);

  @override
  final Attribute attribute;

  @override
  String toString() {
    return 'AttributeState.selectedAttribute(attribute: $attribute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedAttributeImpl &&
            (identical(other.attribute, attribute) ||
                other.attribute == attribute));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attribute);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedAttributeImplCopyWith<_$SelectedAttributeImpl> get copyWith =>
      __$$SelectedAttributeImplCopyWithImpl<_$SelectedAttributeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Attribute> attributeList) loadAttributeList,
    required TResult Function(List<Attribute> attributeListByID)
        loadAttributeListByID,
    required TResult Function(Attribute attribute) selectedAttribute,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() attributeLoading,
    required TResult Function(String? error) error,
  }) {
    return selectedAttribute(attribute);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Attribute> attributeList)? loadAttributeList,
    TResult? Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult? Function(Attribute attribute)? selectedAttribute,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? attributeLoading,
    TResult? Function(String? error)? error,
  }) {
    return selectedAttribute?.call(attribute);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Attribute> attributeList)? loadAttributeList,
    TResult Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult Function(Attribute attribute)? selectedAttribute,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? attributeLoading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (selectedAttribute != null) {
      return selectedAttribute(attribute);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttributeList value) loadAttributeList,
    required TResult Function(AttributeListByID value) loadAttributeListByID,
    required TResult Function(SelectedAttribute value) selectedAttribute,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(AttributeLoading value) attributeLoading,
    required TResult Function(Error value) error,
  }) {
    return selectedAttribute(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttributeList value)? loadAttributeList,
    TResult? Function(AttributeListByID value)? loadAttributeListByID,
    TResult? Function(SelectedAttribute value)? selectedAttribute,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(AttributeLoading value)? attributeLoading,
    TResult? Function(Error value)? error,
  }) {
    return selectedAttribute?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttributeList value)? loadAttributeList,
    TResult Function(AttributeListByID value)? loadAttributeListByID,
    TResult Function(SelectedAttribute value)? selectedAttribute,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(AttributeLoading value)? attributeLoading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (selectedAttribute != null) {
      return selectedAttribute(this);
    }
    return orElse();
  }
}

abstract class SelectedAttribute implements AttributeState {
  const factory SelectedAttribute(final Attribute attribute) =
      _$SelectedAttributeImpl;

  Attribute get attribute;
  @JsonKey(ignore: true)
  _$$SelectedAttributeImplCopyWith<_$SelectedAttributeImpl> get copyWith =>
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
    extends _$AttributeStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'AttributeState.initial()';
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
    required TResult Function(List<Attribute> attributeList) loadAttributeList,
    required TResult Function(List<Attribute> attributeListByID)
        loadAttributeListByID,
    required TResult Function(Attribute attribute) selectedAttribute,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() attributeLoading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Attribute> attributeList)? loadAttributeList,
    TResult? Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult? Function(Attribute attribute)? selectedAttribute,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? attributeLoading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Attribute> attributeList)? loadAttributeList,
    TResult Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult Function(Attribute attribute)? selectedAttribute,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? attributeLoading,
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
    required TResult Function(AttributeList value) loadAttributeList,
    required TResult Function(AttributeListByID value) loadAttributeListByID,
    required TResult Function(SelectedAttribute value) selectedAttribute,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(AttributeLoading value) attributeLoading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttributeList value)? loadAttributeList,
    TResult? Function(AttributeListByID value)? loadAttributeListByID,
    TResult? Function(SelectedAttribute value)? selectedAttribute,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(AttributeLoading value)? attributeLoading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttributeList value)? loadAttributeList,
    TResult Function(AttributeListByID value)? loadAttributeListByID,
    TResult Function(SelectedAttribute value)? selectedAttribute,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(AttributeLoading value)? attributeLoading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AttributeState {
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
    extends _$AttributeStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'AttributeState.loading()';
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
    required TResult Function(List<Attribute> attributeList) loadAttributeList,
    required TResult Function(List<Attribute> attributeListByID)
        loadAttributeListByID,
    required TResult Function(Attribute attribute) selectedAttribute,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() attributeLoading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Attribute> attributeList)? loadAttributeList,
    TResult? Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult? Function(Attribute attribute)? selectedAttribute,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? attributeLoading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Attribute> attributeList)? loadAttributeList,
    TResult Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult Function(Attribute attribute)? selectedAttribute,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? attributeLoading,
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
    required TResult Function(AttributeList value) loadAttributeList,
    required TResult Function(AttributeListByID value) loadAttributeListByID,
    required TResult Function(SelectedAttribute value) selectedAttribute,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(AttributeLoading value) attributeLoading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttributeList value)? loadAttributeList,
    TResult? Function(AttributeListByID value)? loadAttributeListByID,
    TResult? Function(SelectedAttribute value)? selectedAttribute,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(AttributeLoading value)? attributeLoading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttributeList value)? loadAttributeList,
    TResult Function(AttributeListByID value)? loadAttributeListByID,
    TResult Function(SelectedAttribute value)? selectedAttribute,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(AttributeLoading value)? attributeLoading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements AttributeState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$AttributeLoadingImplCopyWith<$Res> {
  factory _$$AttributeLoadingImplCopyWith(_$AttributeLoadingImpl value,
          $Res Function(_$AttributeLoadingImpl) then) =
      __$$AttributeLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AttributeLoadingImplCopyWithImpl<$Res>
    extends _$AttributeStateCopyWithImpl<$Res, _$AttributeLoadingImpl>
    implements _$$AttributeLoadingImplCopyWith<$Res> {
  __$$AttributeLoadingImplCopyWithImpl(_$AttributeLoadingImpl _value,
      $Res Function(_$AttributeLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AttributeLoadingImpl implements AttributeLoading {
  const _$AttributeLoadingImpl();

  @override
  String toString() {
    return 'AttributeState.attributeLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AttributeLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Attribute> attributeList) loadAttributeList,
    required TResult Function(List<Attribute> attributeListByID)
        loadAttributeListByID,
    required TResult Function(Attribute attribute) selectedAttribute,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() attributeLoading,
    required TResult Function(String? error) error,
  }) {
    return attributeLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Attribute> attributeList)? loadAttributeList,
    TResult? Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult? Function(Attribute attribute)? selectedAttribute,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? attributeLoading,
    TResult? Function(String? error)? error,
  }) {
    return attributeLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Attribute> attributeList)? loadAttributeList,
    TResult Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult Function(Attribute attribute)? selectedAttribute,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? attributeLoading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (attributeLoading != null) {
      return attributeLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttributeList value) loadAttributeList,
    required TResult Function(AttributeListByID value) loadAttributeListByID,
    required TResult Function(SelectedAttribute value) selectedAttribute,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(AttributeLoading value) attributeLoading,
    required TResult Function(Error value) error,
  }) {
    return attributeLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttributeList value)? loadAttributeList,
    TResult? Function(AttributeListByID value)? loadAttributeListByID,
    TResult? Function(SelectedAttribute value)? selectedAttribute,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(AttributeLoading value)? attributeLoading,
    TResult? Function(Error value)? error,
  }) {
    return attributeLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttributeList value)? loadAttributeList,
    TResult Function(AttributeListByID value)? loadAttributeListByID,
    TResult Function(SelectedAttribute value)? selectedAttribute,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(AttributeLoading value)? attributeLoading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (attributeLoading != null) {
      return attributeLoading(this);
    }
    return orElse();
  }
}

abstract class AttributeLoading implements AttributeState {
  const factory AttributeLoading() = _$AttributeLoadingImpl;
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
    extends _$AttributeStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'AttributeState.error(error: $error)';
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
    required TResult Function(List<Attribute> attributeList) loadAttributeList,
    required TResult Function(List<Attribute> attributeListByID)
        loadAttributeListByID,
    required TResult Function(Attribute attribute) selectedAttribute,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() attributeLoading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Attribute> attributeList)? loadAttributeList,
    TResult? Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult? Function(Attribute attribute)? selectedAttribute,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? attributeLoading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Attribute> attributeList)? loadAttributeList,
    TResult Function(List<Attribute> attributeListByID)? loadAttributeListByID,
    TResult Function(Attribute attribute)? selectedAttribute,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? attributeLoading,
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
    required TResult Function(AttributeList value) loadAttributeList,
    required TResult Function(AttributeListByID value) loadAttributeListByID,
    required TResult Function(SelectedAttribute value) selectedAttribute,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(AttributeLoading value) attributeLoading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttributeList value)? loadAttributeList,
    TResult? Function(AttributeListByID value)? loadAttributeListByID,
    TResult? Function(SelectedAttribute value)? selectedAttribute,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(AttributeLoading value)? attributeLoading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttributeList value)? loadAttributeList,
    TResult Function(AttributeListByID value)? loadAttributeListByID,
    TResult Function(SelectedAttribute value)? selectedAttribute,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(AttributeLoading value)? attributeLoading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements AttributeState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
