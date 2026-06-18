// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoomModel {

 int get index; String get roomType; String get roomName; bool? get isGateway; DateTime? get updatedAt; List<SpeedTestRecord> get records;
/// Create a copy of RoomModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomModelCopyWith<RoomModel> get copyWith => _$RoomModelCopyWithImpl<RoomModel>(this as RoomModel, _$identity);

  /// Serializes this RoomModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomModel&&(identical(other.index, index) || other.index == index)&&(identical(other.roomType, roomType) || other.roomType == roomType)&&(identical(other.roomName, roomName) || other.roomName == roomName)&&(identical(other.isGateway, isGateway) || other.isGateway == isGateway)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.records, records));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,roomType,roomName,isGateway,updatedAt,const DeepCollectionEquality().hash(records));

@override
String toString() {
  return 'RoomModel(index: $index, roomType: $roomType, roomName: $roomName, isGateway: $isGateway, updatedAt: $updatedAt, records: $records)';
}


}

/// @nodoc
abstract mixin class $RoomModelCopyWith<$Res>  {
  factory $RoomModelCopyWith(RoomModel value, $Res Function(RoomModel) _then) = _$RoomModelCopyWithImpl;
@useResult
$Res call({
 int index, String roomType, String roomName, bool? isGateway, DateTime? updatedAt, List<SpeedTestRecord> records
});




}
/// @nodoc
class _$RoomModelCopyWithImpl<$Res>
    implements $RoomModelCopyWith<$Res> {
  _$RoomModelCopyWithImpl(this._self, this._then);

  final RoomModel _self;
  final $Res Function(RoomModel) _then;

/// Create a copy of RoomModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? roomType = null,Object? roomName = null,Object? isGateway = freezed,Object? updatedAt = freezed,Object? records = null,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,roomType: null == roomType ? _self.roomType : roomType // ignore: cast_nullable_to_non_nullable
as String,roomName: null == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String,isGateway: freezed == isGateway ? _self.isGateway : isGateway // ignore: cast_nullable_to_non_nullable
as bool?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as List<SpeedTestRecord>,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomModel].
extension RoomModelPatterns on RoomModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomModel value)  $default,){
final _that = this;
switch (_that) {
case _RoomModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoomModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  String roomType,  String roomName,  bool? isGateway,  DateTime? updatedAt,  List<SpeedTestRecord> records)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomModel() when $default != null:
return $default(_that.index,_that.roomType,_that.roomName,_that.isGateway,_that.updatedAt,_that.records);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  String roomType,  String roomName,  bool? isGateway,  DateTime? updatedAt,  List<SpeedTestRecord> records)  $default,) {final _that = this;
switch (_that) {
case _RoomModel():
return $default(_that.index,_that.roomType,_that.roomName,_that.isGateway,_that.updatedAt,_that.records);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  String roomType,  String roomName,  bool? isGateway,  DateTime? updatedAt,  List<SpeedTestRecord> records)?  $default,) {final _that = this;
switch (_that) {
case _RoomModel() when $default != null:
return $default(_that.index,_that.roomType,_that.roomName,_that.isGateway,_that.updatedAt,_that.records);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomModel implements RoomModel {
  const _RoomModel({required this.index, required this.roomType, required this.roomName, this.isGateway, this.updatedAt, final  List<SpeedTestRecord> records = const []}): _records = records;
  factory _RoomModel.fromJson(Map<String, dynamic> json) => _$RoomModelFromJson(json);

@override final  int index;
@override final  String roomType;
@override final  String roomName;
@override final  bool? isGateway;
@override final  DateTime? updatedAt;
 final  List<SpeedTestRecord> _records;
@override@JsonKey() List<SpeedTestRecord> get records {
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_records);
}


/// Create a copy of RoomModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomModelCopyWith<_RoomModel> get copyWith => __$RoomModelCopyWithImpl<_RoomModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomModel&&(identical(other.index, index) || other.index == index)&&(identical(other.roomType, roomType) || other.roomType == roomType)&&(identical(other.roomName, roomName) || other.roomName == roomName)&&(identical(other.isGateway, isGateway) || other.isGateway == isGateway)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._records, _records));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,roomType,roomName,isGateway,updatedAt,const DeepCollectionEquality().hash(_records));

@override
String toString() {
  return 'RoomModel(index: $index, roomType: $roomType, roomName: $roomName, isGateway: $isGateway, updatedAt: $updatedAt, records: $records)';
}


}

/// @nodoc
abstract mixin class _$RoomModelCopyWith<$Res> implements $RoomModelCopyWith<$Res> {
  factory _$RoomModelCopyWith(_RoomModel value, $Res Function(_RoomModel) _then) = __$RoomModelCopyWithImpl;
@override @useResult
$Res call({
 int index, String roomType, String roomName, bool? isGateway, DateTime? updatedAt, List<SpeedTestRecord> records
});




}
/// @nodoc
class __$RoomModelCopyWithImpl<$Res>
    implements _$RoomModelCopyWith<$Res> {
  __$RoomModelCopyWithImpl(this._self, this._then);

  final _RoomModel _self;
  final $Res Function(_RoomModel) _then;

/// Create a copy of RoomModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? roomType = null,Object? roomName = null,Object? isGateway = freezed,Object? updatedAt = freezed,Object? records = null,}) {
  return _then(_RoomModel(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,roomType: null == roomType ? _self.roomType : roomType // ignore: cast_nullable_to_non_nullable
as String,roomName: null == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String,isGateway: freezed == isGateway ? _self.isGateway : isGateway // ignore: cast_nullable_to_non_nullable
as bool?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,records: null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<SpeedTestRecord>,
  ));
}


}

// dart format on
