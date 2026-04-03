// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubTask {

 int get tabIndex; String? get taskId; String? get subTaskId; String get value;
/// Create a copy of SubTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubTaskCopyWith<SubTask> get copyWith => _$SubTaskCopyWithImpl<SubTask>(this as SubTask, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubTask&&(identical(other.tabIndex, tabIndex) || other.tabIndex == tabIndex)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.subTaskId, subTaskId) || other.subTaskId == subTaskId)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,tabIndex,taskId,subTaskId,value);

@override
String toString() {
  return 'SubTask(tabIndex: $tabIndex, taskId: $taskId, subTaskId: $subTaskId, value: $value)';
}


}

/// @nodoc
abstract mixin class $SubTaskCopyWith<$Res>  {
  factory $SubTaskCopyWith(SubTask value, $Res Function(SubTask) _then) = _$SubTaskCopyWithImpl;
@useResult
$Res call({
 int tabIndex, String? taskId, String? subTaskId, String value
});




}
/// @nodoc
class _$SubTaskCopyWithImpl<$Res>
    implements $SubTaskCopyWith<$Res> {
  _$SubTaskCopyWithImpl(this._self, this._then);

  final SubTask _self;
  final $Res Function(SubTask) _then;

/// Create a copy of SubTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tabIndex = null,Object? taskId = freezed,Object? subTaskId = freezed,Object? value = null,}) {
  return _then(_self.copyWith(
tabIndex: null == tabIndex ? _self.tabIndex : tabIndex // ignore: cast_nullable_to_non_nullable
as int,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,subTaskId: freezed == subTaskId ? _self.subTaskId : subTaskId // ignore: cast_nullable_to_non_nullable
as String?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SubTask].
extension SubTaskPatterns on SubTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubTask value)  $default,){
final _that = this;
switch (_that) {
case _SubTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubTask value)?  $default,){
final _that = this;
switch (_that) {
case _SubTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tabIndex,  String? taskId,  String? subTaskId,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubTask() when $default != null:
return $default(_that.tabIndex,_that.taskId,_that.subTaskId,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tabIndex,  String? taskId,  String? subTaskId,  String value)  $default,) {final _that = this;
switch (_that) {
case _SubTask():
return $default(_that.tabIndex,_that.taskId,_that.subTaskId,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tabIndex,  String? taskId,  String? subTaskId,  String value)?  $default,) {final _that = this;
switch (_that) {
case _SubTask() when $default != null:
return $default(_that.tabIndex,_that.taskId,_that.subTaskId,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _SubTask implements SubTask {
  const _SubTask({this.tabIndex = -1, this.taskId, this.subTaskId, this.value = ""});
  

@override@JsonKey() final  int tabIndex;
@override final  String? taskId;
@override final  String? subTaskId;
@override@JsonKey() final  String value;

/// Create a copy of SubTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubTaskCopyWith<_SubTask> get copyWith => __$SubTaskCopyWithImpl<_SubTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubTask&&(identical(other.tabIndex, tabIndex) || other.tabIndex == tabIndex)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.subTaskId, subTaskId) || other.subTaskId == subTaskId)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,tabIndex,taskId,subTaskId,value);

@override
String toString() {
  return 'SubTask(tabIndex: $tabIndex, taskId: $taskId, subTaskId: $subTaskId, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SubTaskCopyWith<$Res> implements $SubTaskCopyWith<$Res> {
  factory _$SubTaskCopyWith(_SubTask value, $Res Function(_SubTask) _then) = __$SubTaskCopyWithImpl;
@override @useResult
$Res call({
 int tabIndex, String? taskId, String? subTaskId, String value
});




}
/// @nodoc
class __$SubTaskCopyWithImpl<$Res>
    implements _$SubTaskCopyWith<$Res> {
  __$SubTaskCopyWithImpl(this._self, this._then);

  final _SubTask _self;
  final $Res Function(_SubTask) _then;

/// Create a copy of SubTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tabIndex = null,Object? taskId = freezed,Object? subTaskId = freezed,Object? value = null,}) {
  return _then(_SubTask(
tabIndex: null == tabIndex ? _self.tabIndex : tabIndex // ignore: cast_nullable_to_non_nullable
as int,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,subTaskId: freezed == subTaskId ? _self.subTaskId : subTaskId // ignore: cast_nullable_to_non_nullable
as String?,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
