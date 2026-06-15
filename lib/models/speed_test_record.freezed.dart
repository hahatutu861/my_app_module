// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speed_test_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpeedTestRecord {

 double get speed; String? get band; int? get channel; int? get rssi; DateTime get timestamp;
/// Create a copy of SpeedTestRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeedTestRecordCopyWith<SpeedTestRecord> get copyWith => _$SpeedTestRecordCopyWithImpl<SpeedTestRecord>(this as SpeedTestRecord, _$identity);

  /// Serializes this SpeedTestRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeedTestRecord&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.band, band) || other.band == band)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,speed,band,channel,rssi,timestamp);

@override
String toString() {
  return 'SpeedTestRecord(speed: $speed, band: $band, channel: $channel, rssi: $rssi, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $SpeedTestRecordCopyWith<$Res>  {
  factory $SpeedTestRecordCopyWith(SpeedTestRecord value, $Res Function(SpeedTestRecord) _then) = _$SpeedTestRecordCopyWithImpl;
@useResult
$Res call({
 double speed, String? band, int? channel, int? rssi, DateTime timestamp
});




}
/// @nodoc
class _$SpeedTestRecordCopyWithImpl<$Res>
    implements $SpeedTestRecordCopyWith<$Res> {
  _$SpeedTestRecordCopyWithImpl(this._self, this._then);

  final SpeedTestRecord _self;
  final $Res Function(SpeedTestRecord) _then;

/// Create a copy of SpeedTestRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speed = null,Object? band = freezed,Object? channel = freezed,Object? rssi = freezed,Object? timestamp = null,}) {
  return _then(_self.copyWith(
speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,band: freezed == band ? _self.band : band // ignore: cast_nullable_to_non_nullable
as String?,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as int?,rssi: freezed == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SpeedTestRecord].
extension SpeedTestRecordPatterns on SpeedTestRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpeedTestRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpeedTestRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpeedTestRecord value)  $default,){
final _that = this;
switch (_that) {
case _SpeedTestRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpeedTestRecord value)?  $default,){
final _that = this;
switch (_that) {
case _SpeedTestRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double speed,  String? band,  int? channel,  int? rssi,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpeedTestRecord() when $default != null:
return $default(_that.speed,_that.band,_that.channel,_that.rssi,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double speed,  String? band,  int? channel,  int? rssi,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _SpeedTestRecord():
return $default(_that.speed,_that.band,_that.channel,_that.rssi,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double speed,  String? band,  int? channel,  int? rssi,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _SpeedTestRecord() when $default != null:
return $default(_that.speed,_that.band,_that.channel,_that.rssi,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpeedTestRecord implements SpeedTestRecord {
  const _SpeedTestRecord({required this.speed, this.band, this.channel, this.rssi, required this.timestamp});
  factory _SpeedTestRecord.fromJson(Map<String, dynamic> json) => _$SpeedTestRecordFromJson(json);

@override final  double speed;
@override final  String? band;
@override final  int? channel;
@override final  int? rssi;
@override final  DateTime timestamp;

/// Create a copy of SpeedTestRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeedTestRecordCopyWith<_SpeedTestRecord> get copyWith => __$SpeedTestRecordCopyWithImpl<_SpeedTestRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeedTestRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeedTestRecord&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.band, band) || other.band == band)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,speed,band,channel,rssi,timestamp);

@override
String toString() {
  return 'SpeedTestRecord(speed: $speed, band: $band, channel: $channel, rssi: $rssi, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$SpeedTestRecordCopyWith<$Res> implements $SpeedTestRecordCopyWith<$Res> {
  factory _$SpeedTestRecordCopyWith(_SpeedTestRecord value, $Res Function(_SpeedTestRecord) _then) = __$SpeedTestRecordCopyWithImpl;
@override @useResult
$Res call({
 double speed, String? band, int? channel, int? rssi, DateTime timestamp
});




}
/// @nodoc
class __$SpeedTestRecordCopyWithImpl<$Res>
    implements _$SpeedTestRecordCopyWith<$Res> {
  __$SpeedTestRecordCopyWithImpl(this._self, this._then);

  final _SpeedTestRecord _self;
  final $Res Function(_SpeedTestRecord) _then;

/// Create a copy of SpeedTestRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speed = null,Object? band = freezed,Object? channel = freezed,Object? rssi = freezed,Object? timestamp = null,}) {
  return _then(_SpeedTestRecord(
speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,band: freezed == band ? _self.band : band // ignore: cast_nullable_to_non_nullable
as String?,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as int?,rssi: freezed == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
