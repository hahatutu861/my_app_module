// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WifiMapState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiMapState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WifiMapState()';
}


}

/// @nodoc
class $WifiMapStateCopyWith<$Res>  {
$WifiMapStateCopyWith(WifiMapState _, $Res Function(WifiMapState) __);
}


/// Adds pattern-matching-related methods to [WifiMapState].
extension WifiMapStatePatterns on WifiMapState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WifiMapStateInitial value)?  initial,TResult Function( WifiMapStateLoading value)?  loading,TResult Function( WifiMapStateLoaded value)?  loaded,TResult Function( WifiMapStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WifiMapStateInitial() when initial != null:
return initial(_that);case WifiMapStateLoading() when loading != null:
return loading(_that);case WifiMapStateLoaded() when loaded != null:
return loaded(_that);case WifiMapStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WifiMapStateInitial value)  initial,required TResult Function( WifiMapStateLoading value)  loading,required TResult Function( WifiMapStateLoaded value)  loaded,required TResult Function( WifiMapStateError value)  error,}){
final _that = this;
switch (_that) {
case WifiMapStateInitial():
return initial(_that);case WifiMapStateLoading():
return loading(_that);case WifiMapStateLoaded():
return loaded(_that);case WifiMapStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WifiMapStateInitial value)?  initial,TResult? Function( WifiMapStateLoading value)?  loading,TResult? Function( WifiMapStateLoaded value)?  loaded,TResult? Function( WifiMapStateError value)?  error,}){
final _that = this;
switch (_that) {
case WifiMapStateInitial() when initial != null:
return initial(_that);case WifiMapStateLoading() when loading != null:
return loading(_that);case WifiMapStateLoaded() when loaded != null:
return loaded(_that);case WifiMapStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<HostModel> hosts)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WifiMapStateInitial() when initial != null:
return initial();case WifiMapStateLoading() when loading != null:
return loading();case WifiMapStateLoaded() when loaded != null:
return loaded(_that.hosts);case WifiMapStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<HostModel> hosts)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case WifiMapStateInitial():
return initial();case WifiMapStateLoading():
return loading();case WifiMapStateLoaded():
return loaded(_that.hosts);case WifiMapStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<HostModel> hosts)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case WifiMapStateInitial() when initial != null:
return initial();case WifiMapStateLoading() when loading != null:
return loading();case WifiMapStateLoaded() when loaded != null:
return loaded(_that.hosts);case WifiMapStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class WifiMapStateInitial implements WifiMapState {
  const WifiMapStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiMapStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WifiMapState.initial()';
}


}




/// @nodoc


class WifiMapStateLoading implements WifiMapState {
  const WifiMapStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiMapStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WifiMapState.loading()';
}


}




/// @nodoc


class WifiMapStateLoaded implements WifiMapState {
  const WifiMapStateLoaded({required final  List<HostModel> hosts}): _hosts = hosts;
  

 final  List<HostModel> _hosts;
 List<HostModel> get hosts {
  if (_hosts is EqualUnmodifiableListView) return _hosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hosts);
}


/// Create a copy of WifiMapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiMapStateLoadedCopyWith<WifiMapStateLoaded> get copyWith => _$WifiMapStateLoadedCopyWithImpl<WifiMapStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiMapStateLoaded&&const DeepCollectionEquality().equals(other._hosts, _hosts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hosts));

@override
String toString() {
  return 'WifiMapState.loaded(hosts: $hosts)';
}


}

/// @nodoc
abstract mixin class $WifiMapStateLoadedCopyWith<$Res> implements $WifiMapStateCopyWith<$Res> {
  factory $WifiMapStateLoadedCopyWith(WifiMapStateLoaded value, $Res Function(WifiMapStateLoaded) _then) = _$WifiMapStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<HostModel> hosts
});




}
/// @nodoc
class _$WifiMapStateLoadedCopyWithImpl<$Res>
    implements $WifiMapStateLoadedCopyWith<$Res> {
  _$WifiMapStateLoadedCopyWithImpl(this._self, this._then);

  final WifiMapStateLoaded _self;
  final $Res Function(WifiMapStateLoaded) _then;

/// Create a copy of WifiMapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hosts = null,}) {
  return _then(WifiMapStateLoaded(
hosts: null == hosts ? _self._hosts : hosts // ignore: cast_nullable_to_non_nullable
as List<HostModel>,
  ));
}


}

/// @nodoc


class WifiMapStateError implements WifiMapState {
  const WifiMapStateError({required this.message});
  

 final  String message;

/// Create a copy of WifiMapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiMapStateErrorCopyWith<WifiMapStateError> get copyWith => _$WifiMapStateErrorCopyWithImpl<WifiMapStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiMapStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WifiMapState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $WifiMapStateErrorCopyWith<$Res> implements $WifiMapStateCopyWith<$Res> {
  factory $WifiMapStateErrorCopyWith(WifiMapStateError value, $Res Function(WifiMapStateError) _then) = _$WifiMapStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$WifiMapStateErrorCopyWithImpl<$Res>
    implements $WifiMapStateErrorCopyWith<$Res> {
  _$WifiMapStateErrorCopyWithImpl(this._self, this._then);

  final WifiMapStateError _self;
  final $Res Function(WifiMapStateError) _then;

/// Create a copy of WifiMapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(WifiMapStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
