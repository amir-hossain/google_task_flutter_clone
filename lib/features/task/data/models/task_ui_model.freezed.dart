// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskUiModel {

  String get id; String get title; bool get isFavourite;
  /// Create a copy of TaskUiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskUiModelCopyWith<TaskUiModel> get copyWith => _$TaskUiModelCopyWithImpl<TaskUiModel>(this as TaskUiModel, _$identity);



  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite));
  }


  @override
  int get hashCode => Object.hash(runtimeType,id,title,isFavourite);

  @override
  String toString() {
    return 'TaskUiModel(id: $id, title: $title, isFavourite: $isFavourite)';
  }


}

/// @nodoc
abstract mixin class $TaskUiModelCopyWith<$Res>  {
  factory $TaskUiModelCopyWith(TaskUiModel value, $Res Function(TaskUiModel) _then) = _$TaskUiModelCopyWithImpl;
  @useResult
  $Res call({
    String id, String title, bool isFavourite
  });




}
/// @nodoc
class _$TaskUiModelCopyWithImpl<$Res>
    implements $TaskUiModelCopyWith<$Res> {
  _$TaskUiModelCopyWithImpl(this._self, this._then);

  final TaskUiModel _self;
  final $Res Function(TaskUiModel) _then;

  /// Create a copy of TaskUiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? isFavourite = null,}) {
    return _then(_self.copyWith(
      id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
      as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
    as String,isFavourite: null == isFavourite ? _self.isFavourite : isFavourite // ignore: cast_nullable_to_non_nullable
    as bool,
    ));
  }

}


/// Adds pattern-matching-related methods to [TaskUiModel].
extension TaskUiModelPatterns on TaskUiModel {
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

  @optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskUiModel value)?  $default,{required TResult orElse(),}){
  final _that = this;
  switch (_that) {
  case _TaskUiModel() when $default != null:
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

  @optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskUiModel value)  $default,){
  final _that = this;
  switch (_that) {
  case _TaskUiModel():
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

  @optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskUiModel value)?  $default,){
  final _that = this;
  switch (_that) {
  case _TaskUiModel() when $default != null:
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

  @optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  bool isFavourite)?  $default,{required TResult orElse(),}) {final _that = this;
  switch (_that) {
  case _TaskUiModel() when $default != null:
  return $default(_that.id,_that.title,_that.isFavourite);case _:
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

  @optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  bool isFavourite)  $default,) {final _that = this;
  switch (_that) {
  case _TaskUiModel():
  return $default(_that.id,_that.title,_that.isFavourite);case _:
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

  @optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  bool isFavourite)?  $default,) {final _that = this;
  switch (_that) {
  case _TaskUiModel() when $default != null:
  return $default(_that.id,_that.title,_that.isFavourite);case _:
  return null;

  }
  }

}

/// @nodoc


class _TaskUiModel implements TaskUiModel {
  const _TaskUiModel({required this.id, required this.title, this.isFavourite = false});


  @override final  String id;
  @override final  String title;
  @override@JsonKey() final  bool isFavourite;

  /// Create a copy of TaskUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskUiModelCopyWith<_TaskUiModel> get copyWith => __$TaskUiModelCopyWithImpl<_TaskUiModel>(this, _$identity);



  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite));
  }


  @override
  int get hashCode => Object.hash(runtimeType,id,title,isFavourite);

  @override
  String toString() {
    return 'TaskUiModel(id: $id, title: $title, isFavourite: $isFavourite)';
  }


}

/// @nodoc
abstract mixin class _$TaskUiModelCopyWith<$Res> implements $TaskUiModelCopyWith<$Res> {
  factory _$TaskUiModelCopyWith(_TaskUiModel value, $Res Function(_TaskUiModel) _then) = __$TaskUiModelCopyWithImpl;
  @override @useResult
  $Res call({
    String id, String title, bool isFavourite
  });




}
/// @nodoc
class __$TaskUiModelCopyWithImpl<$Res>
    implements _$TaskUiModelCopyWith<$Res> {
  __$TaskUiModelCopyWithImpl(this._self, this._then);

  final _TaskUiModel _self;
  final $Res Function(_TaskUiModel) _then;

  /// Create a copy of TaskUiModel
  /// with the given fields replaced by the non-null parameter values.
  @override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isFavourite = null,}) {
    return _then(_TaskUiModel(
      id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
      as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
    as String,isFavourite: null == isFavourite ? _self.isFavourite : isFavourite // ignore: cast_nullable_to_non_nullable
    as bool,
    ));
  }


}

// dart format on
