// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CounterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CounterState()';
}


}

/// @nodoc
class $CounterStateCopyWith<$Res>  {
$CounterStateCopyWith(CounterState _, $Res Function(CounterState) __);
}


/// Adds pattern-matching-related methods to [CounterState].
extension CounterStatePatterns on CounterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CounterStateInitial value)?  initial,TResult Function( CounterStateLoading value)?  loading,TResult Function( CounterStateLoaded value)?  loaded,TResult Function( CounterStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CounterStateInitial() when initial != null:
return initial(_that);case CounterStateLoading() when loading != null:
return loading(_that);case CounterStateLoaded() when loaded != null:
return loaded(_that);case CounterStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CounterStateInitial value)  initial,required TResult Function( CounterStateLoading value)  loading,required TResult Function( CounterStateLoaded value)  loaded,required TResult Function( CounterStateError value)  error,}){
final _that = this;
switch (_that) {
case CounterStateInitial():
return initial(_that);case CounterStateLoading():
return loading(_that);case CounterStateLoaded():
return loaded(_that);case CounterStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CounterStateInitial value)?  initial,TResult? Function( CounterStateLoading value)?  loading,TResult? Function( CounterStateLoaded value)?  loaded,TResult? Function( CounterStateError value)?  error,}){
final _that = this;
switch (_that) {
case CounterStateInitial() when initial != null:
return initial(_that);case CounterStateLoading() when loading != null:
return loading(_that);case CounterStateLoaded() when loaded != null:
return loaded(_that);case CounterStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( CounterModel counter)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CounterStateInitial() when initial != null:
return initial();case CounterStateLoading() when loading != null:
return loading();case CounterStateLoaded() when loaded != null:
return loaded(_that.counter);case CounterStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( CounterModel counter)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CounterStateInitial():
return initial();case CounterStateLoading():
return loading();case CounterStateLoaded():
return loaded(_that.counter);case CounterStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( CounterModel counter)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CounterStateInitial() when initial != null:
return initial();case CounterStateLoading() when loading != null:
return loading();case CounterStateLoaded() when loaded != null:
return loaded(_that.counter);case CounterStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CounterStateInitial implements CounterState {
  const CounterStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CounterState.initial()';
}


}




/// @nodoc


class CounterStateLoading implements CounterState {
  const CounterStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CounterState.loading()';
}


}




/// @nodoc


class CounterStateLoaded implements CounterState {
  const CounterStateLoaded({required this.counter});
  

 final  CounterModel counter;

/// Create a copy of CounterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterStateLoadedCopyWith<CounterStateLoaded> get copyWith => _$CounterStateLoadedCopyWithImpl<CounterStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterStateLoaded&&(identical(other.counter, counter) || other.counter == counter));
}


@override
int get hashCode => Object.hash(runtimeType,counter);

@override
String toString() {
  return 'CounterState.loaded(counter: $counter)';
}


}

/// @nodoc
abstract mixin class $CounterStateLoadedCopyWith<$Res> implements $CounterStateCopyWith<$Res> {
  factory $CounterStateLoadedCopyWith(CounterStateLoaded value, $Res Function(CounterStateLoaded) _then) = _$CounterStateLoadedCopyWithImpl;
@useResult
$Res call({
 CounterModel counter
});


$CounterModelCopyWith<$Res> get counter;

}
/// @nodoc
class _$CounterStateLoadedCopyWithImpl<$Res>
    implements $CounterStateLoadedCopyWith<$Res> {
  _$CounterStateLoadedCopyWithImpl(this._self, this._then);

  final CounterStateLoaded _self;
  final $Res Function(CounterStateLoaded) _then;

/// Create a copy of CounterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? counter = null,}) {
  return _then(CounterStateLoaded(
counter: null == counter ? _self.counter : counter // ignore: cast_nullable_to_non_nullable
as CounterModel,
  ));
}

/// Create a copy of CounterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CounterModelCopyWith<$Res> get counter {
  
  return $CounterModelCopyWith<$Res>(_self.counter, (value) {
    return _then(_self.copyWith(counter: value));
  });
}
}

/// @nodoc


class CounterStateError implements CounterState {
  const CounterStateError({required this.message});
  

 final  String message;

/// Create a copy of CounterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterStateErrorCopyWith<CounterStateError> get copyWith => _$CounterStateErrorCopyWithImpl<CounterStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CounterState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CounterStateErrorCopyWith<$Res> implements $CounterStateCopyWith<$Res> {
  factory $CounterStateErrorCopyWith(CounterStateError value, $Res Function(CounterStateError) _then) = _$CounterStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CounterStateErrorCopyWithImpl<$Res>
    implements $CounterStateErrorCopyWith<$Res> {
  _$CounterStateErrorCopyWithImpl(this._self, this._then);

  final CounterStateError _self;
  final $Res Function(CounterStateError) _then;

/// Create a copy of CounterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CounterStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
