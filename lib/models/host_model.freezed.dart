// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'host_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HostModel {

 String get id; String get mac; String get name; String? get defaultName; String? get deviceType; String? get defaultDeviceType; String? get ipv4; String? get ipv6; bool? get active; String? get activeLastTime; bool? get isBlocked; String? get linkTo; String? get linkType; String? get linkSpeed; String? get linkWifiStandard; String? get linkSsidId; String? get linkRssi; bool? get allowAccess; List<dynamic> get denyAccessSchedules; dynamic get tempAccessControl;
/// Create a copy of HostModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HostModelCopyWith<HostModel> get copyWith => _$HostModelCopyWithImpl<HostModel>(this as HostModel, _$identity);

  /// Serializes this HostModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HostModel&&(identical(other.id, id) || other.id == id)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.name, name) || other.name == name)&&(identical(other.defaultName, defaultName) || other.defaultName == defaultName)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.defaultDeviceType, defaultDeviceType) || other.defaultDeviceType == defaultDeviceType)&&(identical(other.ipv4, ipv4) || other.ipv4 == ipv4)&&(identical(other.ipv6, ipv6) || other.ipv6 == ipv6)&&(identical(other.active, active) || other.active == active)&&(identical(other.activeLastTime, activeLastTime) || other.activeLastTime == activeLastTime)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.linkTo, linkTo) || other.linkTo == linkTo)&&(identical(other.linkType, linkType) || other.linkType == linkType)&&(identical(other.linkSpeed, linkSpeed) || other.linkSpeed == linkSpeed)&&(identical(other.linkWifiStandard, linkWifiStandard) || other.linkWifiStandard == linkWifiStandard)&&(identical(other.linkSsidId, linkSsidId) || other.linkSsidId == linkSsidId)&&(identical(other.linkRssi, linkRssi) || other.linkRssi == linkRssi)&&(identical(other.allowAccess, allowAccess) || other.allowAccess == allowAccess)&&const DeepCollectionEquality().equals(other.denyAccessSchedules, denyAccessSchedules)&&const DeepCollectionEquality().equals(other.tempAccessControl, tempAccessControl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,mac,name,defaultName,deviceType,defaultDeviceType,ipv4,ipv6,active,activeLastTime,isBlocked,linkTo,linkType,linkSpeed,linkWifiStandard,linkSsidId,linkRssi,allowAccess,const DeepCollectionEquality().hash(denyAccessSchedules),const DeepCollectionEquality().hash(tempAccessControl)]);

@override
String toString() {
  return 'HostModel(id: $id, mac: $mac, name: $name, defaultName: $defaultName, deviceType: $deviceType, defaultDeviceType: $defaultDeviceType, ipv4: $ipv4, ipv6: $ipv6, active: $active, activeLastTime: $activeLastTime, isBlocked: $isBlocked, linkTo: $linkTo, linkType: $linkType, linkSpeed: $linkSpeed, linkWifiStandard: $linkWifiStandard, linkSsidId: $linkSsidId, linkRssi: $linkRssi, allowAccess: $allowAccess, denyAccessSchedules: $denyAccessSchedules, tempAccessControl: $tempAccessControl)';
}


}

/// @nodoc
abstract mixin class $HostModelCopyWith<$Res>  {
  factory $HostModelCopyWith(HostModel value, $Res Function(HostModel) _then) = _$HostModelCopyWithImpl;
@useResult
$Res call({
 String id, String mac, String name, String? defaultName, String? deviceType, String? defaultDeviceType, String? ipv4, String? ipv6, bool? active, String? activeLastTime, bool? isBlocked, String? linkTo, String? linkType, String? linkSpeed, String? linkWifiStandard, String? linkSsidId, String? linkRssi, bool? allowAccess, List<dynamic> denyAccessSchedules, dynamic tempAccessControl
});




}
/// @nodoc
class _$HostModelCopyWithImpl<$Res>
    implements $HostModelCopyWith<$Res> {
  _$HostModelCopyWithImpl(this._self, this._then);

  final HostModel _self;
  final $Res Function(HostModel) _then;

/// Create a copy of HostModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mac = null,Object? name = null,Object? defaultName = freezed,Object? deviceType = freezed,Object? defaultDeviceType = freezed,Object? ipv4 = freezed,Object? ipv6 = freezed,Object? active = freezed,Object? activeLastTime = freezed,Object? isBlocked = freezed,Object? linkTo = freezed,Object? linkType = freezed,Object? linkSpeed = freezed,Object? linkWifiStandard = freezed,Object? linkSsidId = freezed,Object? linkRssi = freezed,Object? allowAccess = freezed,Object? denyAccessSchedules = null,Object? tempAccessControl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,defaultName: freezed == defaultName ? _self.defaultName : defaultName // ignore: cast_nullable_to_non_nullable
as String?,deviceType: freezed == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String?,defaultDeviceType: freezed == defaultDeviceType ? _self.defaultDeviceType : defaultDeviceType // ignore: cast_nullable_to_non_nullable
as String?,ipv4: freezed == ipv4 ? _self.ipv4 : ipv4 // ignore: cast_nullable_to_non_nullable
as String?,ipv6: freezed == ipv6 ? _self.ipv6 : ipv6 // ignore: cast_nullable_to_non_nullable
as String?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,activeLastTime: freezed == activeLastTime ? _self.activeLastTime : activeLastTime // ignore: cast_nullable_to_non_nullable
as String?,isBlocked: freezed == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool?,linkTo: freezed == linkTo ? _self.linkTo : linkTo // ignore: cast_nullable_to_non_nullable
as String?,linkType: freezed == linkType ? _self.linkType : linkType // ignore: cast_nullable_to_non_nullable
as String?,linkSpeed: freezed == linkSpeed ? _self.linkSpeed : linkSpeed // ignore: cast_nullable_to_non_nullable
as String?,linkWifiStandard: freezed == linkWifiStandard ? _self.linkWifiStandard : linkWifiStandard // ignore: cast_nullable_to_non_nullable
as String?,linkSsidId: freezed == linkSsidId ? _self.linkSsidId : linkSsidId // ignore: cast_nullable_to_non_nullable
as String?,linkRssi: freezed == linkRssi ? _self.linkRssi : linkRssi // ignore: cast_nullable_to_non_nullable
as String?,allowAccess: freezed == allowAccess ? _self.allowAccess : allowAccess // ignore: cast_nullable_to_non_nullable
as bool?,denyAccessSchedules: null == denyAccessSchedules ? _self.denyAccessSchedules : denyAccessSchedules // ignore: cast_nullable_to_non_nullable
as List<dynamic>,tempAccessControl: freezed == tempAccessControl ? _self.tempAccessControl : tempAccessControl // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [HostModel].
extension HostModelPatterns on HostModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HostModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HostModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HostModel value)  $default,){
final _that = this;
switch (_that) {
case _HostModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HostModel value)?  $default,){
final _that = this;
switch (_that) {
case _HostModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String mac,  String name,  String? defaultName,  String? deviceType,  String? defaultDeviceType,  String? ipv4,  String? ipv6,  bool? active,  String? activeLastTime,  bool? isBlocked,  String? linkTo,  String? linkType,  String? linkSpeed,  String? linkWifiStandard,  String? linkSsidId,  String? linkRssi,  bool? allowAccess,  List<dynamic> denyAccessSchedules,  dynamic tempAccessControl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HostModel() when $default != null:
return $default(_that.id,_that.mac,_that.name,_that.defaultName,_that.deviceType,_that.defaultDeviceType,_that.ipv4,_that.ipv6,_that.active,_that.activeLastTime,_that.isBlocked,_that.linkTo,_that.linkType,_that.linkSpeed,_that.linkWifiStandard,_that.linkSsidId,_that.linkRssi,_that.allowAccess,_that.denyAccessSchedules,_that.tempAccessControl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String mac,  String name,  String? defaultName,  String? deviceType,  String? defaultDeviceType,  String? ipv4,  String? ipv6,  bool? active,  String? activeLastTime,  bool? isBlocked,  String? linkTo,  String? linkType,  String? linkSpeed,  String? linkWifiStandard,  String? linkSsidId,  String? linkRssi,  bool? allowAccess,  List<dynamic> denyAccessSchedules,  dynamic tempAccessControl)  $default,) {final _that = this;
switch (_that) {
case _HostModel():
return $default(_that.id,_that.mac,_that.name,_that.defaultName,_that.deviceType,_that.defaultDeviceType,_that.ipv4,_that.ipv6,_that.active,_that.activeLastTime,_that.isBlocked,_that.linkTo,_that.linkType,_that.linkSpeed,_that.linkWifiStandard,_that.linkSsidId,_that.linkRssi,_that.allowAccess,_that.denyAccessSchedules,_that.tempAccessControl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String mac,  String name,  String? defaultName,  String? deviceType,  String? defaultDeviceType,  String? ipv4,  String? ipv6,  bool? active,  String? activeLastTime,  bool? isBlocked,  String? linkTo,  String? linkType,  String? linkSpeed,  String? linkWifiStandard,  String? linkSsidId,  String? linkRssi,  bool? allowAccess,  List<dynamic> denyAccessSchedules,  dynamic tempAccessControl)?  $default,) {final _that = this;
switch (_that) {
case _HostModel() when $default != null:
return $default(_that.id,_that.mac,_that.name,_that.defaultName,_that.deviceType,_that.defaultDeviceType,_that.ipv4,_that.ipv6,_that.active,_that.activeLastTime,_that.isBlocked,_that.linkTo,_that.linkType,_that.linkSpeed,_that.linkWifiStandard,_that.linkSsidId,_that.linkRssi,_that.allowAccess,_that.denyAccessSchedules,_that.tempAccessControl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HostModel implements HostModel {
  const _HostModel({required this.id, required this.mac, required this.name, this.defaultName, this.deviceType, this.defaultDeviceType, this.ipv4, this.ipv6, this.active, this.activeLastTime, this.isBlocked, this.linkTo, this.linkType, this.linkSpeed, this.linkWifiStandard, this.linkSsidId, this.linkRssi, this.allowAccess, final  List<dynamic> denyAccessSchedules = const [], this.tempAccessControl}): _denyAccessSchedules = denyAccessSchedules;
  factory _HostModel.fromJson(Map<String, dynamic> json) => _$HostModelFromJson(json);

@override final  String id;
@override final  String mac;
@override final  String name;
@override final  String? defaultName;
@override final  String? deviceType;
@override final  String? defaultDeviceType;
@override final  String? ipv4;
@override final  String? ipv6;
@override final  bool? active;
@override final  String? activeLastTime;
@override final  bool? isBlocked;
@override final  String? linkTo;
@override final  String? linkType;
@override final  String? linkSpeed;
@override final  String? linkWifiStandard;
@override final  String? linkSsidId;
@override final  String? linkRssi;
@override final  bool? allowAccess;
 final  List<dynamic> _denyAccessSchedules;
@override@JsonKey() List<dynamic> get denyAccessSchedules {
  if (_denyAccessSchedules is EqualUnmodifiableListView) return _denyAccessSchedules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_denyAccessSchedules);
}

@override final  dynamic tempAccessControl;

/// Create a copy of HostModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HostModelCopyWith<_HostModel> get copyWith => __$HostModelCopyWithImpl<_HostModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HostModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HostModel&&(identical(other.id, id) || other.id == id)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.name, name) || other.name == name)&&(identical(other.defaultName, defaultName) || other.defaultName == defaultName)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.defaultDeviceType, defaultDeviceType) || other.defaultDeviceType == defaultDeviceType)&&(identical(other.ipv4, ipv4) || other.ipv4 == ipv4)&&(identical(other.ipv6, ipv6) || other.ipv6 == ipv6)&&(identical(other.active, active) || other.active == active)&&(identical(other.activeLastTime, activeLastTime) || other.activeLastTime == activeLastTime)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.linkTo, linkTo) || other.linkTo == linkTo)&&(identical(other.linkType, linkType) || other.linkType == linkType)&&(identical(other.linkSpeed, linkSpeed) || other.linkSpeed == linkSpeed)&&(identical(other.linkWifiStandard, linkWifiStandard) || other.linkWifiStandard == linkWifiStandard)&&(identical(other.linkSsidId, linkSsidId) || other.linkSsidId == linkSsidId)&&(identical(other.linkRssi, linkRssi) || other.linkRssi == linkRssi)&&(identical(other.allowAccess, allowAccess) || other.allowAccess == allowAccess)&&const DeepCollectionEquality().equals(other._denyAccessSchedules, _denyAccessSchedules)&&const DeepCollectionEquality().equals(other.tempAccessControl, tempAccessControl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,mac,name,defaultName,deviceType,defaultDeviceType,ipv4,ipv6,active,activeLastTime,isBlocked,linkTo,linkType,linkSpeed,linkWifiStandard,linkSsidId,linkRssi,allowAccess,const DeepCollectionEquality().hash(_denyAccessSchedules),const DeepCollectionEquality().hash(tempAccessControl)]);

@override
String toString() {
  return 'HostModel(id: $id, mac: $mac, name: $name, defaultName: $defaultName, deviceType: $deviceType, defaultDeviceType: $defaultDeviceType, ipv4: $ipv4, ipv6: $ipv6, active: $active, activeLastTime: $activeLastTime, isBlocked: $isBlocked, linkTo: $linkTo, linkType: $linkType, linkSpeed: $linkSpeed, linkWifiStandard: $linkWifiStandard, linkSsidId: $linkSsidId, linkRssi: $linkRssi, allowAccess: $allowAccess, denyAccessSchedules: $denyAccessSchedules, tempAccessControl: $tempAccessControl)';
}


}

/// @nodoc
abstract mixin class _$HostModelCopyWith<$Res> implements $HostModelCopyWith<$Res> {
  factory _$HostModelCopyWith(_HostModel value, $Res Function(_HostModel) _then) = __$HostModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String mac, String name, String? defaultName, String? deviceType, String? defaultDeviceType, String? ipv4, String? ipv6, bool? active, String? activeLastTime, bool? isBlocked, String? linkTo, String? linkType, String? linkSpeed, String? linkWifiStandard, String? linkSsidId, String? linkRssi, bool? allowAccess, List<dynamic> denyAccessSchedules, dynamic tempAccessControl
});




}
/// @nodoc
class __$HostModelCopyWithImpl<$Res>
    implements _$HostModelCopyWith<$Res> {
  __$HostModelCopyWithImpl(this._self, this._then);

  final _HostModel _self;
  final $Res Function(_HostModel) _then;

/// Create a copy of HostModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mac = null,Object? name = null,Object? defaultName = freezed,Object? deviceType = freezed,Object? defaultDeviceType = freezed,Object? ipv4 = freezed,Object? ipv6 = freezed,Object? active = freezed,Object? activeLastTime = freezed,Object? isBlocked = freezed,Object? linkTo = freezed,Object? linkType = freezed,Object? linkSpeed = freezed,Object? linkWifiStandard = freezed,Object? linkSsidId = freezed,Object? linkRssi = freezed,Object? allowAccess = freezed,Object? denyAccessSchedules = null,Object? tempAccessControl = freezed,}) {
  return _then(_HostModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,defaultName: freezed == defaultName ? _self.defaultName : defaultName // ignore: cast_nullable_to_non_nullable
as String?,deviceType: freezed == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String?,defaultDeviceType: freezed == defaultDeviceType ? _self.defaultDeviceType : defaultDeviceType // ignore: cast_nullable_to_non_nullable
as String?,ipv4: freezed == ipv4 ? _self.ipv4 : ipv4 // ignore: cast_nullable_to_non_nullable
as String?,ipv6: freezed == ipv6 ? _self.ipv6 : ipv6 // ignore: cast_nullable_to_non_nullable
as String?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,activeLastTime: freezed == activeLastTime ? _self.activeLastTime : activeLastTime // ignore: cast_nullable_to_non_nullable
as String?,isBlocked: freezed == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool?,linkTo: freezed == linkTo ? _self.linkTo : linkTo // ignore: cast_nullable_to_non_nullable
as String?,linkType: freezed == linkType ? _self.linkType : linkType // ignore: cast_nullable_to_non_nullable
as String?,linkSpeed: freezed == linkSpeed ? _self.linkSpeed : linkSpeed // ignore: cast_nullable_to_non_nullable
as String?,linkWifiStandard: freezed == linkWifiStandard ? _self.linkWifiStandard : linkWifiStandard // ignore: cast_nullable_to_non_nullable
as String?,linkSsidId: freezed == linkSsidId ? _self.linkSsidId : linkSsidId // ignore: cast_nullable_to_non_nullable
as String?,linkRssi: freezed == linkRssi ? _self.linkRssi : linkRssi // ignore: cast_nullable_to_non_nullable
as String?,allowAccess: freezed == allowAccess ? _self.allowAccess : allowAccess // ignore: cast_nullable_to_non_nullable
as bool?,denyAccessSchedules: null == denyAccessSchedules ? _self._denyAccessSchedules : denyAccessSchedules // ignore: cast_nullable_to_non_nullable
as List<dynamic>,tempAccessControl: freezed == tempAccessControl ? _self.tempAccessControl : tempAccessControl // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}


/// @nodoc
mixin _$GetHostsResponse {

 List<HostModel> get hosts;
/// Create a copy of GetHostsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetHostsResponseCopyWith<GetHostsResponse> get copyWith => _$GetHostsResponseCopyWithImpl<GetHostsResponse>(this as GetHostsResponse, _$identity);

  /// Serializes this GetHostsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetHostsResponse&&const DeepCollectionEquality().equals(other.hosts, hosts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(hosts));

@override
String toString() {
  return 'GetHostsResponse(hosts: $hosts)';
}


}

/// @nodoc
abstract mixin class $GetHostsResponseCopyWith<$Res>  {
  factory $GetHostsResponseCopyWith(GetHostsResponse value, $Res Function(GetHostsResponse) _then) = _$GetHostsResponseCopyWithImpl;
@useResult
$Res call({
 List<HostModel> hosts
});




}
/// @nodoc
class _$GetHostsResponseCopyWithImpl<$Res>
    implements $GetHostsResponseCopyWith<$Res> {
  _$GetHostsResponseCopyWithImpl(this._self, this._then);

  final GetHostsResponse _self;
  final $Res Function(GetHostsResponse) _then;

/// Create a copy of GetHostsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hosts = null,}) {
  return _then(_self.copyWith(
hosts: null == hosts ? _self.hosts : hosts // ignore: cast_nullable_to_non_nullable
as List<HostModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [GetHostsResponse].
extension GetHostsResponsePatterns on GetHostsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetHostsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetHostsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetHostsResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetHostsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetHostsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetHostsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HostModel> hosts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetHostsResponse() when $default != null:
return $default(_that.hosts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HostModel> hosts)  $default,) {final _that = this;
switch (_that) {
case _GetHostsResponse():
return $default(_that.hosts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HostModel> hosts)?  $default,) {final _that = this;
switch (_that) {
case _GetHostsResponse() when $default != null:
return $default(_that.hosts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetHostsResponse implements GetHostsResponse {
  const _GetHostsResponse({required final  List<HostModel> hosts}): _hosts = hosts;
  factory _GetHostsResponse.fromJson(Map<String, dynamic> json) => _$GetHostsResponseFromJson(json);

 final  List<HostModel> _hosts;
@override List<HostModel> get hosts {
  if (_hosts is EqualUnmodifiableListView) return _hosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hosts);
}


/// Create a copy of GetHostsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetHostsResponseCopyWith<_GetHostsResponse> get copyWith => __$GetHostsResponseCopyWithImpl<_GetHostsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetHostsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetHostsResponse&&const DeepCollectionEquality().equals(other._hosts, _hosts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hosts));

@override
String toString() {
  return 'GetHostsResponse(hosts: $hosts)';
}


}

/// @nodoc
abstract mixin class _$GetHostsResponseCopyWith<$Res> implements $GetHostsResponseCopyWith<$Res> {
  factory _$GetHostsResponseCopyWith(_GetHostsResponse value, $Res Function(_GetHostsResponse) _then) = __$GetHostsResponseCopyWithImpl;
@override @useResult
$Res call({
 List<HostModel> hosts
});




}
/// @nodoc
class __$GetHostsResponseCopyWithImpl<$Res>
    implements _$GetHostsResponseCopyWith<$Res> {
  __$GetHostsResponseCopyWithImpl(this._self, this._then);

  final _GetHostsResponse _self;
  final $Res Function(_GetHostsResponse) _then;

/// Create a copy of GetHostsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hosts = null,}) {
  return _then(_GetHostsResponse(
hosts: null == hosts ? _self._hosts : hosts // ignore: cast_nullable_to_non_nullable
as List<HostModel>,
  ));
}


}

// dart format on
