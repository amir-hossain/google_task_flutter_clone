// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TabUiModel {

 int? get id; String get tabName; List<TaskUiModel> get tasks;
/// Create a copy of TabUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabUiModelCopyWith<TabUiModel> get copyWith => _$TabUiModelCopyWithImpl<TabUiModel>(this as TabUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tabName, tabName) || other.tabName == tabName)&&const DeepCollectionEquality().equals(other.tasks, tasks));
}


@override
int get hashCode => Object.hash(runtimeType,id,tabName,const DeepCollectionEquality().hash(tasks));

@override
String toString() {
  return 'TabUiModel(id: $id, tabName: $tabName, tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class $TabUiModelCopyWith<$Res>  {
  factory $TabUiModelCopyWith(TabUiModel value, $Res Function(TabUiModel) _then) = _$TabUiModelCopyWithImpl;
@useResult
$Res call({
 int? id, String tabName, List<TaskUiModel> tasks
});




}
/// @nodoc
class _$TabUiModelCopyWithImpl<$Res>
    implements $TabUiModelCopyWith<$Res> {
  _$TabUiModelCopyWithImpl(this._self, this._then);

  final TabUiModel _self;
  final $Res Function(TabUiModel) _then;

/// Create a copy of TabUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tabName = null,Object? tasks = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,tabName: null == tabName ? _self.tabName : tabName // ignore: cast_nullable_to_non_nullable
as String,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskUiModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TabUiModel].
extension TabUiModelPatterns on TabUiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TabUiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TabUiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TabUiModel value)  $default,){
final _that = this;
switch (_that) {
case _TabUiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TabUiModel value)?  $default,){
final _that = this;
switch (_that) {
case _TabUiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String tabName,  List<TaskUiModel> tasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TabUiModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String tabName,  List<TaskUiModel> tasks)  $default,) {final _that = this;
switch (_that) {
case _TabUiModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String tabName,  List<TaskUiModel> tasks)?  $default,) {final _that = this;
switch (_that) {
case _TabUiModel() when $default != null:
return $default(_that.id,_that.tabName,_that.tasks);case _:
  return null;

}
}

}

/// @nodoc


class _TabUiModel implements TabUiModel {
  const _TabUiModel({this.id, required this.tabName, final  List<TaskUiModel> tasks = const <TaskUiModel>[]}): _tasks = tasks;
  

@override final  int? id;
@override final  String tabName;
 final  List<TaskUiModel> _tasks;
@override@JsonKey() List<TaskUiModel> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}


/// Create a copy of TabUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabUiModelCopyWith<_TabUiModel> get copyWith => __$TabUiModelCopyWithImpl<_TabUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tabName, tabName) || other.tabName == tabName)&&const DeepCollectionEquality().equals(other._tasks, _tasks));
}


@override
int get hashCode => Object.hash(runtimeType,id,tabName,const DeepCollectionEquality().hash(_tasks));

@override
String toString() {
  return 'TabUiModel(id: $id, tabName: $tabName, tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class _$TabUiModelCopyWith<$Res> implements $TabUiModelCopyWith<$Res> {
  factory _$TabUiModelCopyWith(_TabUiModel value, $Res Function(_TabUiModel) _then) = __$TabUiModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String tabName, List<TaskUiModel> tasks
});




}
/// @nodoc
class __$TabUiModelCopyWithImpl<$Res>
    implements _$TabUiModelCopyWith<$Res> {
  __$TabUiModelCopyWithImpl(this._self, this._then);

  final _TabUiModel _self;
  final $Res Function(_TabUiModel) _then;

/// Create a copy of TabUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tabName = null,Object? tasks = null,}) {
  return _then(_TabUiModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,tabName: null == tabName ? _self.tabName : tabName // ignore: cast_nullable_to_non_nullable
as String,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskUiModel>,
  ));
}


}

// dart format on
