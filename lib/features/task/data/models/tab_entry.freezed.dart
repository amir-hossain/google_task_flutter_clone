// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TabEntry {

 int? get id; String get tabName; List<TaskEntity> get tasks;
/// Create a copy of TabEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabEntryCopyWith<TabEntry> get copyWith => _$TabEntryCopyWithImpl<TabEntry>(this as TabEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.tabName, tabName) || other.tabName == tabName)&&const DeepCollectionEquality().equals(other.tasks, tasks));
}


@override
int get hashCode => Object.hash(runtimeType,id,tabName,const DeepCollectionEquality().hash(tasks));

@override
String toString() {
  return 'TabEntry(id: $id, tabName: $tabName, tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class $TabEntryCopyWith<$Res>  {
  factory $TabEntryCopyWith(TabEntry value, $Res Function(TabEntry) _then) = _$TabEntryCopyWithImpl;
@useResult
$Res call({
 int? id, String tabName, List<TaskEntity> tasks
});




}
/// @nodoc
class _$TabEntryCopyWithImpl<$Res>
    implements $TabEntryCopyWith<$Res> {
  _$TabEntryCopyWithImpl(this._self, this._then);

  final TabEntry _self;
  final $Res Function(TabEntry) _then;

/// Create a copy of TabEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tabName = null,Object? tasks = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,tabName: null == tabName ? _self.tabName : tabName // ignore: cast_nullable_to_non_nullable
as String,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [TabEntry].
extension TabEntryPatterns on TabEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TabEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TabEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TabEntry value)  $default,){
final _that = this;
switch (_that) {
case _TabEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TabEntry value)?  $default,){
final _that = this;
switch (_that) {
case _TabEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String tabName,  List<TaskEntity> tasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TabEntry() when $default != null:
return $default(_that.id,_that.tabName,_that.tasks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String tabName,  List<TaskEntity> tasks)  $default,) {final _that = this;
switch (_that) {
case _TabEntry():
return $default(_that.id,_that.tabName,_that.tasks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String tabName,  List<TaskEntity> tasks)?  $default,) {final _that = this;
switch (_that) {
case _TabEntry() when $default != null:
return $default(_that.id,_that.tabName,_that.tasks);case _:
  return null;

}
}

}

/// @nodoc


class _TabEntry implements TabEntry {
  const _TabEntry({this.id, required this.tabName, final  List<TaskEntity> tasks = const <TaskEntity>[]}): _tasks = tasks;
  

@override final  int? id;
@override final  String tabName;
 final  List<TaskEntity> _tasks;
@override@JsonKey() List<TaskEntity> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}


/// Create a copy of TabEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabEntryCopyWith<_TabEntry> get copyWith => __$TabEntryCopyWithImpl<_TabEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.tabName, tabName) || other.tabName == tabName)&&const DeepCollectionEquality().equals(other._tasks, _tasks));
}


@override
int get hashCode => Object.hash(runtimeType,id,tabName,const DeepCollectionEquality().hash(_tasks));

@override
String toString() {
  return 'TabEntry(id: $id, tabName: $tabName, tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class _$TabEntryCopyWith<$Res> implements $TabEntryCopyWith<$Res> {
  factory _$TabEntryCopyWith(_TabEntry value, $Res Function(_TabEntry) _then) = __$TabEntryCopyWithImpl;
@override @useResult
$Res call({
 int? id, String tabName, List<TaskEntity> tasks
});




}
/// @nodoc
class __$TabEntryCopyWithImpl<$Res>
    implements _$TabEntryCopyWith<$Res> {
  __$TabEntryCopyWithImpl(this._self, this._then);

  final _TabEntry _self;
  final $Res Function(_TabEntry) _then;

/// Create a copy of TabEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tabName = null,Object? tasks = null,}) {
  return _then(_TabEntry(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,tabName: null == tabName ? _self.tabName : tabName // ignore: cast_nullable_to_non_nullable
as String,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskEntity>,
  ));
}


}

// dart format on
