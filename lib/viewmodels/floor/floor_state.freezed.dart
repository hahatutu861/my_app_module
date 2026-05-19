// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FloorState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FloorState()';
}


}

/// @nodoc
class $FloorStateCopyWith<$Res>  {
$FloorStateCopyWith(FloorState _, $Res Function(FloorState) __);
}


/// Adds pattern-matching-related methods to [FloorState].
extension FloorStatePatterns on FloorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FloorStateInitial value)?  initial,TResult Function( FloorStateLoading value)?  loading,TResult Function( FloorStateLoaded value)?  loaded,TResult Function( FloorStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FloorStateInitial() when initial != null:
return initial(_that);case FloorStateLoading() when loading != null:
return loading(_that);case FloorStateLoaded() when loaded != null:
return loaded(_that);case FloorStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FloorStateInitial value)  initial,required TResult Function( FloorStateLoading value)  loading,required TResult Function( FloorStateLoaded value)  loaded,required TResult Function( FloorStateError value)  error,}){
final _that = this;
switch (_that) {
case FloorStateInitial():
return initial(_that);case FloorStateLoading():
return loading(_that);case FloorStateLoaded():
return loaded(_that);case FloorStateError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FloorStateInitial value)?  initial,TResult? Function( FloorStateLoading value)?  loading,TResult? Function( FloorStateLoaded value)?  loaded,TResult? Function( FloorStateError value)?  error,}){
final _that = this;
switch (_that) {
case FloorStateInitial() when initial != null:
return initial(_that);case FloorStateLoading() when loading != null:
return loading(_that);case FloorStateLoaded() when loaded != null:
return loaded(_that);case FloorStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( FloorModel? floor,  int? selectedRoomIndex,  bool isReferenceEnabled,  int bubbleTrigger)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FloorStateInitial() when initial != null:
return initial();case FloorStateLoading() when loading != null:
return loading();case FloorStateLoaded() when loaded != null:
return loaded(_that.floor,_that.selectedRoomIndex,_that.isReferenceEnabled,_that.bubbleTrigger);case FloorStateError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( FloorModel? floor,  int? selectedRoomIndex,  bool isReferenceEnabled,  int bubbleTrigger)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case FloorStateInitial():
return initial();case FloorStateLoading():
return loading();case FloorStateLoaded():
return loaded(_that.floor,_that.selectedRoomIndex,_that.isReferenceEnabled,_that.bubbleTrigger);case FloorStateError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( FloorModel? floor,  int? selectedRoomIndex,  bool isReferenceEnabled,  int bubbleTrigger)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case FloorStateInitial() when initial != null:
return initial();case FloorStateLoading() when loading != null:
return loading();case FloorStateLoaded() when loaded != null:
return loaded(_that.floor,_that.selectedRoomIndex,_that.isReferenceEnabled,_that.bubbleTrigger);case FloorStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class FloorStateInitial implements FloorState {
  const FloorStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FloorState.initial()';
}


}




/// @nodoc


class FloorStateLoading implements FloorState {
  const FloorStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FloorState.loading()';
}


}




/// @nodoc


class FloorStateLoaded implements FloorState {
  const FloorStateLoaded({this.floor, this.selectedRoomIndex, this.isReferenceEnabled = false, this.bubbleTrigger = 0});
  

 final  FloorModel? floor;
 final  int? selectedRoomIndex;
@JsonKey() final  bool isReferenceEnabled;
@JsonKey() final  int bubbleTrigger;

/// Create a copy of FloorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FloorStateLoadedCopyWith<FloorStateLoaded> get copyWith => _$FloorStateLoadedCopyWithImpl<FloorStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorStateLoaded&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.selectedRoomIndex, selectedRoomIndex) || other.selectedRoomIndex == selectedRoomIndex)&&(identical(other.isReferenceEnabled, isReferenceEnabled) || other.isReferenceEnabled == isReferenceEnabled)&&(identical(other.bubbleTrigger, bubbleTrigger) || other.bubbleTrigger == bubbleTrigger));
}


@override
int get hashCode => Object.hash(runtimeType,floor,selectedRoomIndex,isReferenceEnabled,bubbleTrigger);

@override
String toString() {
  return 'FloorState.loaded(floor: $floor, selectedRoomIndex: $selectedRoomIndex, isReferenceEnabled: $isReferenceEnabled, bubbleTrigger: $bubbleTrigger)';
}


}

/// @nodoc
abstract mixin class $FloorStateLoadedCopyWith<$Res> implements $FloorStateCopyWith<$Res> {
  factory $FloorStateLoadedCopyWith(FloorStateLoaded value, $Res Function(FloorStateLoaded) _then) = _$FloorStateLoadedCopyWithImpl;
@useResult
$Res call({
 FloorModel? floor, int? selectedRoomIndex, bool isReferenceEnabled, int bubbleTrigger
});


$FloorModelCopyWith<$Res>? get floor;

}
/// @nodoc
class _$FloorStateLoadedCopyWithImpl<$Res>
    implements $FloorStateLoadedCopyWith<$Res> {
  _$FloorStateLoadedCopyWithImpl(this._self, this._then);

  final FloorStateLoaded _self;
  final $Res Function(FloorStateLoaded) _then;

/// Create a copy of FloorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? floor = freezed,Object? selectedRoomIndex = freezed,Object? isReferenceEnabled = null,Object? bubbleTrigger = null,}) {
  return _then(FloorStateLoaded(
floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as FloorModel?,selectedRoomIndex: freezed == selectedRoomIndex ? _self.selectedRoomIndex : selectedRoomIndex // ignore: cast_nullable_to_non_nullable
as int?,isReferenceEnabled: null == isReferenceEnabled ? _self.isReferenceEnabled : isReferenceEnabled // ignore: cast_nullable_to_non_nullable
as bool,bubbleTrigger: null == bubbleTrigger ? _self.bubbleTrigger : bubbleTrigger // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of FloorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FloorModelCopyWith<$Res>? get floor {
    if (_self.floor == null) {
    return null;
  }

  return $FloorModelCopyWith<$Res>(_self.floor!, (value) {
    return _then(_self.copyWith(floor: value));
  });
}
}

/// @nodoc


class FloorStateError implements FloorState {
  const FloorStateError({required this.message});
  

 final  String message;

/// Create a copy of FloorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FloorStateErrorCopyWith<FloorStateError> get copyWith => _$FloorStateErrorCopyWithImpl<FloorStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'FloorState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $FloorStateErrorCopyWith<$Res> implements $FloorStateCopyWith<$Res> {
  factory $FloorStateErrorCopyWith(FloorStateError value, $Res Function(FloorStateError) _then) = _$FloorStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FloorStateErrorCopyWithImpl<$Res>
    implements $FloorStateErrorCopyWith<$Res> {
  _$FloorStateErrorCopyWithImpl(this._self, this._then);

  final FloorStateError _self;
  final $Res Function(FloorStateError) _then;

/// Create a copy of FloorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(FloorStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
