// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_speed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WifiSpeedState {

 bool get isTesting; double? get speed; bool get isSuccess; String? get errorMessage; int get progress; List<double> get samples;
/// Create a copy of WifiSpeedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiSpeedStateCopyWith<WifiSpeedState> get copyWith => _$WifiSpeedStateCopyWithImpl<WifiSpeedState>(this as WifiSpeedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiSpeedState&&(identical(other.isTesting, isTesting) || other.isTesting == isTesting)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other.samples, samples));
}


@override
int get hashCode => Object.hash(runtimeType,isTesting,speed,isSuccess,errorMessage,progress,const DeepCollectionEquality().hash(samples));

@override
String toString() {
  return 'WifiSpeedState(isTesting: $isTesting, speed: $speed, isSuccess: $isSuccess, errorMessage: $errorMessage, progress: $progress, samples: $samples)';
}


}

/// @nodoc
abstract mixin class $WifiSpeedStateCopyWith<$Res>  {
  factory $WifiSpeedStateCopyWith(WifiSpeedState value, $Res Function(WifiSpeedState) _then) = _$WifiSpeedStateCopyWithImpl;
@useResult
$Res call({
 bool isTesting, double? speed, bool isSuccess, String? errorMessage, int progress, List<double> samples
});




}
/// @nodoc
class _$WifiSpeedStateCopyWithImpl<$Res>
    implements $WifiSpeedStateCopyWith<$Res> {
  _$WifiSpeedStateCopyWithImpl(this._self, this._then);

  final WifiSpeedState _self;
  final $Res Function(WifiSpeedState) _then;

/// Create a copy of WifiSpeedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isTesting = null,Object? speed = freezed,Object? isSuccess = null,Object? errorMessage = freezed,Object? progress = null,Object? samples = null,}) {
  return _then(_self.copyWith(
isTesting: null == isTesting ? _self.isTesting : isTesting // ignore: cast_nullable_to_non_nullable
as bool,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,samples: null == samples ? _self.samples : samples // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// Adds pattern-matching-related methods to [WifiSpeedState].
extension WifiSpeedStatePatterns on WifiSpeedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WifiSpeedState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WifiSpeedState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WifiSpeedState value)  $default,){
final _that = this;
switch (_that) {
case _WifiSpeedState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WifiSpeedState value)?  $default,){
final _that = this;
switch (_that) {
case _WifiSpeedState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isTesting,  double? speed,  bool isSuccess,  String? errorMessage,  int progress,  List<double> samples)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WifiSpeedState() when $default != null:
return $default(_that.isTesting,_that.speed,_that.isSuccess,_that.errorMessage,_that.progress,_that.samples);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isTesting,  double? speed,  bool isSuccess,  String? errorMessage,  int progress,  List<double> samples)  $default,) {final _that = this;
switch (_that) {
case _WifiSpeedState():
return $default(_that.isTesting,_that.speed,_that.isSuccess,_that.errorMessage,_that.progress,_that.samples);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isTesting,  double? speed,  bool isSuccess,  String? errorMessage,  int progress,  List<double> samples)?  $default,) {final _that = this;
switch (_that) {
case _WifiSpeedState() when $default != null:
return $default(_that.isTesting,_that.speed,_that.isSuccess,_that.errorMessage,_that.progress,_that.samples);case _:
  return null;

}
}

}

/// @nodoc


class _WifiSpeedState extends WifiSpeedState {
  const _WifiSpeedState({this.isTesting = false, this.speed = null, this.isSuccess = true, this.errorMessage = null, this.progress = 0, final  List<double> samples = const []}): _samples = samples,super._();
  

@override@JsonKey() final  bool isTesting;
@override@JsonKey() final  double? speed;
@override@JsonKey() final  bool isSuccess;
@override@JsonKey() final  String? errorMessage;
@override@JsonKey() final  int progress;
 final  List<double> _samples;
@override@JsonKey() List<double> get samples {
  if (_samples is EqualUnmodifiableListView) return _samples;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_samples);
}


/// Create a copy of WifiSpeedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WifiSpeedStateCopyWith<_WifiSpeedState> get copyWith => __$WifiSpeedStateCopyWithImpl<_WifiSpeedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WifiSpeedState&&(identical(other.isTesting, isTesting) || other.isTesting == isTesting)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other._samples, _samples));
}


@override
int get hashCode => Object.hash(runtimeType,isTesting,speed,isSuccess,errorMessage,progress,const DeepCollectionEquality().hash(_samples));

@override
String toString() {
  return 'WifiSpeedState(isTesting: $isTesting, speed: $speed, isSuccess: $isSuccess, errorMessage: $errorMessage, progress: $progress, samples: $samples)';
}


}

/// @nodoc
abstract mixin class _$WifiSpeedStateCopyWith<$Res> implements $WifiSpeedStateCopyWith<$Res> {
  factory _$WifiSpeedStateCopyWith(_WifiSpeedState value, $Res Function(_WifiSpeedState) _then) = __$WifiSpeedStateCopyWithImpl;
@override @useResult
$Res call({
 bool isTesting, double? speed, bool isSuccess, String? errorMessage, int progress, List<double> samples
});




}
/// @nodoc
class __$WifiSpeedStateCopyWithImpl<$Res>
    implements _$WifiSpeedStateCopyWith<$Res> {
  __$WifiSpeedStateCopyWithImpl(this._self, this._then);

  final _WifiSpeedState _self;
  final $Res Function(_WifiSpeedState) _then;

/// Create a copy of WifiSpeedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isTesting = null,Object? speed = freezed,Object? isSuccess = null,Object? errorMessage = freezed,Object? progress = null,Object? samples = null,}) {
  return _then(_WifiSpeedState(
isTesting: null == isTesting ? _self.isTesting : isTesting // ignore: cast_nullable_to_non_nullable
as bool,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,samples: null == samples ? _self._samples : samples // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}

// dart format on
