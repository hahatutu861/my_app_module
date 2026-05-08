// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) {
  return _RoomModel.fromJson(json);
}

/// @nodoc
mixin _$RoomModel {
  int get index => throw _privateConstructorUsedError;
  String get roomType => throw _privateConstructorUsedError;
  String get roomName => throw _privateConstructorUsedError;
  bool? get isGateway => throw _privateConstructorUsedError;

  /// Serializes this RoomModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoomModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoomModelCopyWith<RoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomModelCopyWith<$Res> {
  factory $RoomModelCopyWith(RoomModel value, $Res Function(RoomModel) then) =
      _$RoomModelCopyWithImpl<$Res, RoomModel>;
  @useResult
  $Res call({int index, String roomType, String roomName, bool? isGateway});
}

/// @nodoc
class _$RoomModelCopyWithImpl<$Res, $Val extends RoomModel>
    implements $RoomModelCopyWith<$Res> {
  _$RoomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoomModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? roomType = null,
    Object? roomName = null,
    Object? isGateway = freezed,
  }) {
    return _then(
      _value.copyWith(
            index: null == index
                ? _value.index
                : index // ignore: cast_nullable_to_non_nullable
                      as int,
            roomType: null == roomType
                ? _value.roomType
                : roomType // ignore: cast_nullable_to_non_nullable
                      as String,
            roomName: null == roomName
                ? _value.roomName
                : roomName // ignore: cast_nullable_to_non_nullable
                      as String,
            isGateway: freezed == isGateway
                ? _value.isGateway
                : isGateway // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RoomModelImplCopyWith<$Res>
    implements $RoomModelCopyWith<$Res> {
  factory _$$RoomModelImplCopyWith(
    _$RoomModelImpl value,
    $Res Function(_$RoomModelImpl) then,
  ) = __$$RoomModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, String roomType, String roomName, bool? isGateway});
}

/// @nodoc
class __$$RoomModelImplCopyWithImpl<$Res>
    extends _$RoomModelCopyWithImpl<$Res, _$RoomModelImpl>
    implements _$$RoomModelImplCopyWith<$Res> {
  __$$RoomModelImplCopyWithImpl(
    _$RoomModelImpl _value,
    $Res Function(_$RoomModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? roomType = null,
    Object? roomName = null,
    Object? isGateway = freezed,
  }) {
    return _then(
      _$RoomModelImpl(
        index: null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
        roomType: null == roomType
            ? _value.roomType
            : roomType // ignore: cast_nullable_to_non_nullable
                  as String,
        roomName: null == roomName
            ? _value.roomName
            : roomName // ignore: cast_nullable_to_non_nullable
                  as String,
        isGateway: freezed == isGateway
            ? _value.isGateway
            : isGateway // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomModelImpl implements _RoomModel {
  const _$RoomModelImpl({
    required this.index,
    required this.roomType,
    required this.roomName,
    this.isGateway,
  });

  factory _$RoomModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomModelImplFromJson(json);

  @override
  final int index;
  @override
  final String roomType;
  @override
  final String roomName;
  @override
  final bool? isGateway;

  @override
  String toString() {
    return 'RoomModel(index: $index, roomType: $roomType, roomName: $roomName, isGateway: $isGateway)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomModelImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.roomType, roomType) ||
                other.roomType == roomType) &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            (identical(other.isGateway, isGateway) ||
                other.isGateway == isGateway));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, index, roomType, roomName, isGateway);

  /// Create a copy of RoomModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomModelImplCopyWith<_$RoomModelImpl> get copyWith =>
      __$$RoomModelImplCopyWithImpl<_$RoomModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomModelImplToJson(this);
  }
}

abstract class _RoomModel implements RoomModel {
  const factory _RoomModel({
    required final int index,
    required final String roomType,
    required final String roomName,
    final bool? isGateway,
  }) = _$RoomModelImpl;

  factory _RoomModel.fromJson(Map<String, dynamic> json) =
      _$RoomModelImpl.fromJson;

  @override
  int get index;
  @override
  String get roomType;
  @override
  String get roomName;
  @override
  bool? get isGateway;

  /// Create a copy of RoomModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomModelImplCopyWith<_$RoomModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
