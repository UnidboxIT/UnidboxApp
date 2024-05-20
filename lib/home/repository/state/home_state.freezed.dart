// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Noti> notiList) loadNoti,
    required TResult Function(List<MyTask> myTaskList) loadMyTask,
    required TResult Function(Map<int, List<MyTask>> myTaskDetailMap)
        loadMyTaskDetail,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Noti> notiList)? loadNoti,
    TResult? Function(List<MyTask> myTaskList)? loadMyTask,
    TResult? Function(Map<int, List<MyTask>> myTaskDetailMap)? loadMyTaskDetail,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Noti> notiList)? loadNoti,
    TResult Function(List<MyTask> myTaskList)? loadMyTask,
    TResult Function(Map<int, List<MyTask>> myTaskDetailMap)? loadMyTaskDetail,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotiList value) loadNoti,
    required TResult Function(MyTaskList value) loadMyTask,
    required TResult Function(MyTaskDetailMap value) loadMyTaskDetail,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotiList value)? loadNoti,
    TResult? Function(MyTaskList value)? loadMyTask,
    TResult? Function(MyTaskDetailMap value)? loadMyTaskDetail,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotiList value)? loadNoti,
    TResult Function(MyTaskList value)? loadMyTask,
    TResult Function(MyTaskDetailMap value)? loadMyTaskDetail,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotiListImplCopyWith<$Res> {
  factory _$$NotiListImplCopyWith(
          _$NotiListImpl value, $Res Function(_$NotiListImpl) then) =
      __$$NotiListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Noti> notiList});
}

/// @nodoc
class __$$NotiListImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$NotiListImpl>
    implements _$$NotiListImplCopyWith<$Res> {
  __$$NotiListImplCopyWithImpl(
      _$NotiListImpl _value, $Res Function(_$NotiListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notiList = null,
  }) {
    return _then(_$NotiListImpl(
      null == notiList
          ? _value._notiList
          : notiList // ignore: cast_nullable_to_non_nullable
              as List<Noti>,
    ));
  }
}

/// @nodoc

class _$NotiListImpl implements NotiList {
  const _$NotiListImpl(final List<Noti> notiList) : _notiList = notiList;

  final List<Noti> _notiList;
  @override
  List<Noti> get notiList {
    if (_notiList is EqualUnmodifiableListView) return _notiList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notiList);
  }

  @override
  String toString() {
    return 'HomeState.loadNoti(notiList: $notiList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotiListImpl &&
            const DeepCollectionEquality().equals(other._notiList, _notiList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_notiList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotiListImplCopyWith<_$NotiListImpl> get copyWith =>
      __$$NotiListImplCopyWithImpl<_$NotiListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Noti> notiList) loadNoti,
    required TResult Function(List<MyTask> myTaskList) loadMyTask,
    required TResult Function(Map<int, List<MyTask>> myTaskDetailMap)
        loadMyTaskDetail,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadNoti(notiList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Noti> notiList)? loadNoti,
    TResult? Function(List<MyTask> myTaskList)? loadMyTask,
    TResult? Function(Map<int, List<MyTask>> myTaskDetailMap)? loadMyTaskDetail,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadNoti?.call(notiList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Noti> notiList)? loadNoti,
    TResult Function(List<MyTask> myTaskList)? loadMyTask,
    TResult Function(Map<int, List<MyTask>> myTaskDetailMap)? loadMyTaskDetail,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadNoti != null) {
      return loadNoti(notiList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotiList value) loadNoti,
    required TResult Function(MyTaskList value) loadMyTask,
    required TResult Function(MyTaskDetailMap value) loadMyTaskDetail,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadNoti(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotiList value)? loadNoti,
    TResult? Function(MyTaskList value)? loadMyTask,
    TResult? Function(MyTaskDetailMap value)? loadMyTaskDetail,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadNoti?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotiList value)? loadNoti,
    TResult Function(MyTaskList value)? loadMyTask,
    TResult Function(MyTaskDetailMap value)? loadMyTaskDetail,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadNoti != null) {
      return loadNoti(this);
    }
    return orElse();
  }
}

abstract class NotiList implements HomeState {
  const factory NotiList(final List<Noti> notiList) = _$NotiListImpl;

  List<Noti> get notiList;
  @JsonKey(ignore: true)
  _$$NotiListImplCopyWith<_$NotiListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MyTaskListImplCopyWith<$Res> {
  factory _$$MyTaskListImplCopyWith(
          _$MyTaskListImpl value, $Res Function(_$MyTaskListImpl) then) =
      __$$MyTaskListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MyTask> myTaskList});
}

/// @nodoc
class __$$MyTaskListImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$MyTaskListImpl>
    implements _$$MyTaskListImplCopyWith<$Res> {
  __$$MyTaskListImplCopyWithImpl(
      _$MyTaskListImpl _value, $Res Function(_$MyTaskListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myTaskList = null,
  }) {
    return _then(_$MyTaskListImpl(
      null == myTaskList
          ? _value._myTaskList
          : myTaskList // ignore: cast_nullable_to_non_nullable
              as List<MyTask>,
    ));
  }
}

/// @nodoc

class _$MyTaskListImpl implements MyTaskList {
  const _$MyTaskListImpl(final List<MyTask> myTaskList)
      : _myTaskList = myTaskList;

  final List<MyTask> _myTaskList;
  @override
  List<MyTask> get myTaskList {
    if (_myTaskList is EqualUnmodifiableListView) return _myTaskList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myTaskList);
  }

  @override
  String toString() {
    return 'HomeState.loadMyTask(myTaskList: $myTaskList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTaskListImpl &&
            const DeepCollectionEquality()
                .equals(other._myTaskList, _myTaskList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_myTaskList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyTaskListImplCopyWith<_$MyTaskListImpl> get copyWith =>
      __$$MyTaskListImplCopyWithImpl<_$MyTaskListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Noti> notiList) loadNoti,
    required TResult Function(List<MyTask> myTaskList) loadMyTask,
    required TResult Function(Map<int, List<MyTask>> myTaskDetailMap)
        loadMyTaskDetail,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadMyTask(myTaskList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Noti> notiList)? loadNoti,
    TResult? Function(List<MyTask> myTaskList)? loadMyTask,
    TResult? Function(Map<int, List<MyTask>> myTaskDetailMap)? loadMyTaskDetail,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadMyTask?.call(myTaskList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Noti> notiList)? loadNoti,
    TResult Function(List<MyTask> myTaskList)? loadMyTask,
    TResult Function(Map<int, List<MyTask>> myTaskDetailMap)? loadMyTaskDetail,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadMyTask != null) {
      return loadMyTask(myTaskList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotiList value) loadNoti,
    required TResult Function(MyTaskList value) loadMyTask,
    required TResult Function(MyTaskDetailMap value) loadMyTaskDetail,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadMyTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotiList value)? loadNoti,
    TResult? Function(MyTaskList value)? loadMyTask,
    TResult? Function(MyTaskDetailMap value)? loadMyTaskDetail,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadMyTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotiList value)? loadNoti,
    TResult Function(MyTaskList value)? loadMyTask,
    TResult Function(MyTaskDetailMap value)? loadMyTaskDetail,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadMyTask != null) {
      return loadMyTask(this);
    }
    return orElse();
  }
}

abstract class MyTaskList implements HomeState {
  const factory MyTaskList(final List<MyTask> myTaskList) = _$MyTaskListImpl;

  List<MyTask> get myTaskList;
  @JsonKey(ignore: true)
  _$$MyTaskListImplCopyWith<_$MyTaskListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MyTaskDetailMapImplCopyWith<$Res> {
  factory _$$MyTaskDetailMapImplCopyWith(_$MyTaskDetailMapImpl value,
          $Res Function(_$MyTaskDetailMapImpl) then) =
      __$$MyTaskDetailMapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<int, List<MyTask>> myTaskDetailMap});
}

/// @nodoc
class __$$MyTaskDetailMapImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$MyTaskDetailMapImpl>
    implements _$$MyTaskDetailMapImplCopyWith<$Res> {
  __$$MyTaskDetailMapImplCopyWithImpl(
      _$MyTaskDetailMapImpl _value, $Res Function(_$MyTaskDetailMapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myTaskDetailMap = null,
  }) {
    return _then(_$MyTaskDetailMapImpl(
      null == myTaskDetailMap
          ? _value._myTaskDetailMap
          : myTaskDetailMap // ignore: cast_nullable_to_non_nullable
              as Map<int, List<MyTask>>,
    ));
  }
}

/// @nodoc

class _$MyTaskDetailMapImpl implements MyTaskDetailMap {
  const _$MyTaskDetailMapImpl(final Map<int, List<MyTask>> myTaskDetailMap)
      : _myTaskDetailMap = myTaskDetailMap;

  final Map<int, List<MyTask>> _myTaskDetailMap;
  @override
  Map<int, List<MyTask>> get myTaskDetailMap {
    if (_myTaskDetailMap is EqualUnmodifiableMapView) return _myTaskDetailMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_myTaskDetailMap);
  }

  @override
  String toString() {
    return 'HomeState.loadMyTaskDetail(myTaskDetailMap: $myTaskDetailMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTaskDetailMapImpl &&
            const DeepCollectionEquality()
                .equals(other._myTaskDetailMap, _myTaskDetailMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_myTaskDetailMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyTaskDetailMapImplCopyWith<_$MyTaskDetailMapImpl> get copyWith =>
      __$$MyTaskDetailMapImplCopyWithImpl<_$MyTaskDetailMapImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Noti> notiList) loadNoti,
    required TResult Function(List<MyTask> myTaskList) loadMyTask,
    required TResult Function(Map<int, List<MyTask>> myTaskDetailMap)
        loadMyTaskDetail,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loadMyTaskDetail(myTaskDetailMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Noti> notiList)? loadNoti,
    TResult? Function(List<MyTask> myTaskList)? loadMyTask,
    TResult? Function(Map<int, List<MyTask>> myTaskDetailMap)? loadMyTaskDetail,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loadMyTaskDetail?.call(myTaskDetailMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Noti> notiList)? loadNoti,
    TResult Function(List<MyTask> myTaskList)? loadMyTask,
    TResult Function(Map<int, List<MyTask>> myTaskDetailMap)? loadMyTaskDetail,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loadMyTaskDetail != null) {
      return loadMyTaskDetail(myTaskDetailMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotiList value) loadNoti,
    required TResult Function(MyTaskList value) loadMyTask,
    required TResult Function(MyTaskDetailMap value) loadMyTaskDetail,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loadMyTaskDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotiList value)? loadNoti,
    TResult? Function(MyTaskList value)? loadMyTask,
    TResult? Function(MyTaskDetailMap value)? loadMyTaskDetail,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loadMyTaskDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotiList value)? loadNoti,
    TResult Function(MyTaskList value)? loadMyTask,
    TResult Function(MyTaskDetailMap value)? loadMyTaskDetail,
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loadMyTaskDetail != null) {
      return loadMyTaskDetail(this);
    }
    return orElse();
  }
}

abstract class MyTaskDetailMap implements HomeState {
  const factory MyTaskDetailMap(final Map<int, List<MyTask>> myTaskDetailMap) =
      _$MyTaskDetailMapImpl;

  Map<int, List<MyTask>> get myTaskDetailMap;
  @JsonKey(ignore: true)
  _$$MyTaskDetailMapImplCopyWith<_$MyTaskDetailMapImpl> get copyWith =>
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
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'HomeState.initial()';
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
    required TResult Function(List<Noti> notiList) loadNoti,
    required TResult Function(List<MyTask> myTaskList) loadMyTask,
    required TResult Function(Map<int, List<MyTask>> myTaskDetailMap)
        loadMyTaskDetail,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Noti> notiList)? loadNoti,
    TResult? Function(List<MyTask> myTaskList)? loadMyTask,
    TResult? Function(Map<int, List<MyTask>> myTaskDetailMap)? loadMyTaskDetail,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Noti> notiList)? loadNoti,
    TResult Function(List<MyTask> myTaskList)? loadMyTask,
    TResult Function(Map<int, List<MyTask>> myTaskDetailMap)? loadMyTaskDetail,
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
    required TResult Function(NotiList value) loadNoti,
    required TResult Function(MyTaskList value) loadMyTask,
    required TResult Function(MyTaskDetailMap value) loadMyTaskDetail,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotiList value)? loadNoti,
    TResult? Function(MyTaskList value)? loadMyTask,
    TResult? Function(MyTaskDetailMap value)? loadMyTaskDetail,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotiList value)? loadNoti,
    TResult Function(MyTaskList value)? loadMyTask,
    TResult Function(MyTaskDetailMap value)? loadMyTaskDetail,
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

abstract class Initial implements HomeState {
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
    extends _$HomeStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'HomeState.loading()';
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
    required TResult Function(List<Noti> notiList) loadNoti,
    required TResult Function(List<MyTask> myTaskList) loadMyTask,
    required TResult Function(Map<int, List<MyTask>> myTaskDetailMap)
        loadMyTaskDetail,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Noti> notiList)? loadNoti,
    TResult? Function(List<MyTask> myTaskList)? loadMyTask,
    TResult? Function(Map<int, List<MyTask>> myTaskDetailMap)? loadMyTaskDetail,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Noti> notiList)? loadNoti,
    TResult Function(List<MyTask> myTaskList)? loadMyTask,
    TResult Function(Map<int, List<MyTask>> myTaskDetailMap)? loadMyTaskDetail,
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
    required TResult Function(NotiList value) loadNoti,
    required TResult Function(MyTaskList value) loadMyTask,
    required TResult Function(MyTaskDetailMap value) loadMyTaskDetail,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotiList value)? loadNoti,
    TResult? Function(MyTaskList value)? loadMyTask,
    TResult? Function(MyTaskDetailMap value)? loadMyTaskDetail,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotiList value)? loadNoti,
    TResult Function(MyTaskList value)? loadMyTask,
    TResult Function(MyTaskDetailMap value)? loadMyTaskDetail,
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

abstract class Loading implements HomeState {
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
    extends _$HomeStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'HomeState.error(error: $error)';
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
    required TResult Function(List<Noti> notiList) loadNoti,
    required TResult Function(List<MyTask> myTaskList) loadMyTask,
    required TResult Function(Map<int, List<MyTask>> myTaskDetailMap)
        loadMyTaskDetail,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Noti> notiList)? loadNoti,
    TResult? Function(List<MyTask> myTaskList)? loadMyTask,
    TResult? Function(Map<int, List<MyTask>> myTaskDetailMap)? loadMyTaskDetail,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Noti> notiList)? loadNoti,
    TResult Function(List<MyTask> myTaskList)? loadMyTask,
    TResult Function(Map<int, List<MyTask>> myTaskDetailMap)? loadMyTaskDetail,
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
    required TResult Function(NotiList value) loadNoti,
    required TResult Function(MyTaskList value) loadMyTask,
    required TResult Function(MyTaskDetailMap value) loadMyTaskDetail,
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotiList value)? loadNoti,
    TResult? Function(MyTaskList value)? loadMyTask,
    TResult? Function(MyTaskDetailMap value)? loadMyTaskDetail,
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotiList value)? loadNoti,
    TResult Function(MyTaskList value)? loadMyTask,
    TResult Function(MyTaskDetailMap value)? loadMyTaskDetail,
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

abstract class Error implements HomeState {
  const factory Error({final String? error}) = _$ErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
