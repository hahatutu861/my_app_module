// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FloorModel {

 String get id; String get floorName; int get zoneCount; DateTime get createdAt; DateTime? get updatedAt; List<RoomModel> get rooms; String? get deviceId;
/// Create a copy of FloorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FloorModelCopyWith<FloorModel> get copyWith => _$FloorModelCopyWithImpl<FloorModel>(this as FloorModel, _$identity);

  /// Serializes this FloorModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.floorName, floorName) || other.floorName == floorName)&&(identical(other.zoneCount, zoneCount) || other.zoneCount == zoneCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.rooms, rooms)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,floorName,zoneCount,createdAt,updatedAt,const DeepCollectionEquality().hash(rooms),deviceId);

@override
String toString() {
  return 'FloorModel(id: $id, floorName: $floorName, zoneCount: $zoneCount, createdAt: $createdAt, updatedAt: $updatedAt, rooms: $rooms, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $FloorModelCopyWith<$Res>  {
  factory $FloorModelCopyWith(FloorModel value, $Res Function(FloorModel) _then) = _$FloorModelCopyWithImpl;
@useResult
$Res call({
 String id, String floorName, int zoneCount, DateTime createdAt, DateTime? updatedAt, List<RoomModel> rooms, String? deviceId
});




}
/// @nodoc
class _$FloorModelCopyWithImpl<$Res>
    implements $FloorModelCopyWith<$Res> {
  _$FloorModelCopyWithImpl(this._self, this._then);

  final FloorModel _self;
  final $Res Function(FloorModel) _then;

/// Create a copy of FloorModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? floorName = null,Object? zoneCount = null,Object? createdAt = null,Object? updatedAt = freezed,Object? rooms = null,Object? deviceId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,floorName: null == floorName ? _self.floorName : floorName // ignore: cast_nullable_to_non_nullable
as String,zoneCount: null == zoneCount ? _self.zoneCount : zoneCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<RoomModel>,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FloorModel].
extension FloorModelPatterns on FloorModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FloorModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FloorModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FloorModel value)  $default,){
final _that = this;
switch (_that) {
case _FloorModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FloorModel value)?  $default,){
final _that = this;
switch (_that) {
case _FloorModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String floorName,  int zoneCount,  DateTime createdAt,  DateTime? updatedAt,  List<RoomModel> rooms,  String? deviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FloorModel() when $default != null:
return $default(_that.id,_that.floorName,_that.zoneCount,_that.createdAt,_that.updatedAt,_that.rooms,_that.deviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String floorName,  int zoneCount,  DateTime createdAt,  DateTime? updatedAt,  List<RoomModel> rooms,  String? deviceId)  $default,) {final _that = this;
switch (_that) {
case _FloorModel():
return $default(_that.id,_that.floorName,_that.zoneCount,_that.createdAt,_that.updatedAt,_that.rooms,_that.deviceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String floorName,  int zoneCount,  DateTime createdAt,  DateTime? updatedAt,  List<RoomModel> rooms,  String? deviceId)?  $default,) {final _that = this;
switch (_that) {
case _FloorModel() when $default != null:
return $default(_that.id,_that.floorName,_that.zoneCount,_that.createdAt,_that.updatedAt,_that.rooms,_that.deviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FloorModel implements FloorModel {
  const _FloorModel({required this.id, required this.floorName, this.zoneCount = 0, required this.createdAt, this.updatedAt, final  List<RoomModel> rooms = const [], this.deviceId}): _rooms = rooms;
  factory _FloorModel.fromJson(Map<String, dynamic> json) => _$FloorModelFromJson(json);

@override final  String id;
@override final  String floorName;
@override@JsonKey() final  int zoneCount;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
 final  List<RoomModel> _rooms;
@override@JsonKey() List<RoomModel> get rooms {
  if (_rooms is EqualUnmodifiableListView) return _rooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rooms);
}

@override final  String? deviceId;

/// Create a copy of FloorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FloorModelCopyWith<_FloorModel> get copyWith => __$FloorModelCopyWithImpl<_FloorModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FloorModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FloorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.floorName, floorName) || other.floorName == floorName)&&(identical(other.zoneCount, zoneCount) || other.zoneCount == zoneCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._rooms, _rooms)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,floorName,zoneCount,createdAt,updatedAt,const DeepCollectionEquality().hash(_rooms),deviceId);

@override
String toString() {
  return 'FloorModel(id: $id, floorName: $floorName, zoneCount: $zoneCount, createdAt: $createdAt, updatedAt: $updatedAt, rooms: $rooms, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class _$FloorModelCopyWith<$Res> implements $FloorModelCopyWith<$Res> {
  factory _$FloorModelCopyWith(_FloorModel value, $Res Function(_FloorModel) _then) = __$FloorModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String floorName, int zoneCount, DateTime createdAt, DateTime? updatedAt, List<RoomModel> rooms, String? deviceId
});




}
/// @nodoc
class __$FloorModelCopyWithImpl<$Res>
    implements _$FloorModelCopyWith<$Res> {
  __$FloorModelCopyWithImpl(this._self, this._then);

  final _FloorModel _self;
  final $Res Function(_FloorModel) _then;

/// Create a copy of FloorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? floorName = null,Object? zoneCount = null,Object? createdAt = null,Object? updatedAt = freezed,Object? rooms = null,Object? deviceId = freezed,}) {
  return _then(_FloorModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,floorName: null == floorName ? _self.floorName : floorName // ignore: cast_nullable_to_non_nullable
as String,zoneCount: null == zoneCount ? _self.zoneCount : zoneCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rooms: null == rooms ? _self._rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<RoomModel>,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
