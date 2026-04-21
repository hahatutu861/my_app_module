// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'host_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HostModel _$HostModelFromJson(Map<String, dynamic> json) {
  return _HostModel.fromJson(json);
}

/// @nodoc
mixin _$HostModel {
  String get id => throw _privateConstructorUsedError;
  String get mac => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get defaultName => throw _privateConstructorUsedError;
  String? get deviceType => throw _privateConstructorUsedError;
  String? get defaultDeviceType => throw _privateConstructorUsedError;
  String? get ipv4 => throw _privateConstructorUsedError;
  String? get ipv6 => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  String? get activeLastTime => throw _privateConstructorUsedError;
  bool? get isBlocked => throw _privateConstructorUsedError;
  String? get linkTo => throw _privateConstructorUsedError;
  String? get linkType => throw _privateConstructorUsedError;
  String? get linkSpeed => throw _privateConstructorUsedError;
  String? get linkWifiStandard => throw _privateConstructorUsedError;
  String? get linkSsidId => throw _privateConstructorUsedError;
  String? get linkRssi => throw _privateConstructorUsedError;
  bool? get allowAccess => throw _privateConstructorUsedError;
  List<dynamic> get denyAccessSchedules => throw _privateConstructorUsedError;
  dynamic get tempAccessControl => throw _privateConstructorUsedError;

  /// Serializes this HostModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HostModelCopyWith<HostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostModelCopyWith<$Res> {
  factory $HostModelCopyWith(HostModel value, $Res Function(HostModel) then) =
      _$HostModelCopyWithImpl<$Res, HostModel>;
  @useResult
  $Res call({
    String id,
    String mac,
    String name,
    String? defaultName,
    String? deviceType,
    String? defaultDeviceType,
    String? ipv4,
    String? ipv6,
    bool? active,
    String? activeLastTime,
    bool? isBlocked,
    String? linkTo,
    String? linkType,
    String? linkSpeed,
    String? linkWifiStandard,
    String? linkSsidId,
    String? linkRssi,
    bool? allowAccess,
    List<dynamic> denyAccessSchedules,
    dynamic tempAccessControl,
  });
}

/// @nodoc
class _$HostModelCopyWithImpl<$Res, $Val extends HostModel>
    implements $HostModelCopyWith<$Res> {
  _$HostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mac = null,
    Object? name = null,
    Object? defaultName = freezed,
    Object? deviceType = freezed,
    Object? defaultDeviceType = freezed,
    Object? ipv4 = freezed,
    Object? ipv6 = freezed,
    Object? active = freezed,
    Object? activeLastTime = freezed,
    Object? isBlocked = freezed,
    Object? linkTo = freezed,
    Object? linkType = freezed,
    Object? linkSpeed = freezed,
    Object? linkWifiStandard = freezed,
    Object? linkSsidId = freezed,
    Object? linkRssi = freezed,
    Object? allowAccess = freezed,
    Object? denyAccessSchedules = null,
    Object? tempAccessControl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            mac: null == mac
                ? _value.mac
                : mac // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            defaultName: freezed == defaultName
                ? _value.defaultName
                : defaultName // ignore: cast_nullable_to_non_nullable
                      as String?,
            deviceType: freezed == deviceType
                ? _value.deviceType
                : deviceType // ignore: cast_nullable_to_non_nullable
                      as String?,
            defaultDeviceType: freezed == defaultDeviceType
                ? _value.defaultDeviceType
                : defaultDeviceType // ignore: cast_nullable_to_non_nullable
                      as String?,
            ipv4: freezed == ipv4
                ? _value.ipv4
                : ipv4 // ignore: cast_nullable_to_non_nullable
                      as String?,
            ipv6: freezed == ipv6
                ? _value.ipv6
                : ipv6 // ignore: cast_nullable_to_non_nullable
                      as String?,
            active: freezed == active
                ? _value.active
                : active // ignore: cast_nullable_to_non_nullable
                      as bool?,
            activeLastTime: freezed == activeLastTime
                ? _value.activeLastTime
                : activeLastTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            isBlocked: freezed == isBlocked
                ? _value.isBlocked
                : isBlocked // ignore: cast_nullable_to_non_nullable
                      as bool?,
            linkTo: freezed == linkTo
                ? _value.linkTo
                : linkTo // ignore: cast_nullable_to_non_nullable
                      as String?,
            linkType: freezed == linkType
                ? _value.linkType
                : linkType // ignore: cast_nullable_to_non_nullable
                      as String?,
            linkSpeed: freezed == linkSpeed
                ? _value.linkSpeed
                : linkSpeed // ignore: cast_nullable_to_non_nullable
                      as String?,
            linkWifiStandard: freezed == linkWifiStandard
                ? _value.linkWifiStandard
                : linkWifiStandard // ignore: cast_nullable_to_non_nullable
                      as String?,
            linkSsidId: freezed == linkSsidId
                ? _value.linkSsidId
                : linkSsidId // ignore: cast_nullable_to_non_nullable
                      as String?,
            linkRssi: freezed == linkRssi
                ? _value.linkRssi
                : linkRssi // ignore: cast_nullable_to_non_nullable
                      as String?,
            allowAccess: freezed == allowAccess
                ? _value.allowAccess
                : allowAccess // ignore: cast_nullable_to_non_nullable
                      as bool?,
            denyAccessSchedules: null == denyAccessSchedules
                ? _value.denyAccessSchedules
                : denyAccessSchedules // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            tempAccessControl: freezed == tempAccessControl
                ? _value.tempAccessControl
                : tempAccessControl // ignore: cast_nullable_to_non_nullable
                      as dynamic,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HostModelImplCopyWith<$Res>
    implements $HostModelCopyWith<$Res> {
  factory _$$HostModelImplCopyWith(
    _$HostModelImpl value,
    $Res Function(_$HostModelImpl) then,
  ) = __$$HostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String mac,
    String name,
    String? defaultName,
    String? deviceType,
    String? defaultDeviceType,
    String? ipv4,
    String? ipv6,
    bool? active,
    String? activeLastTime,
    bool? isBlocked,
    String? linkTo,
    String? linkType,
    String? linkSpeed,
    String? linkWifiStandard,
    String? linkSsidId,
    String? linkRssi,
    bool? allowAccess,
    List<dynamic> denyAccessSchedules,
    dynamic tempAccessControl,
  });
}

/// @nodoc
class __$$HostModelImplCopyWithImpl<$Res>
    extends _$HostModelCopyWithImpl<$Res, _$HostModelImpl>
    implements _$$HostModelImplCopyWith<$Res> {
  __$$HostModelImplCopyWithImpl(
    _$HostModelImpl _value,
    $Res Function(_$HostModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mac = null,
    Object? name = null,
    Object? defaultName = freezed,
    Object? deviceType = freezed,
    Object? defaultDeviceType = freezed,
    Object? ipv4 = freezed,
    Object? ipv6 = freezed,
    Object? active = freezed,
    Object? activeLastTime = freezed,
    Object? isBlocked = freezed,
    Object? linkTo = freezed,
    Object? linkType = freezed,
    Object? linkSpeed = freezed,
    Object? linkWifiStandard = freezed,
    Object? linkSsidId = freezed,
    Object? linkRssi = freezed,
    Object? allowAccess = freezed,
    Object? denyAccessSchedules = null,
    Object? tempAccessControl = freezed,
  }) {
    return _then(
      _$HostModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        mac: null == mac
            ? _value.mac
            : mac // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        defaultName: freezed == defaultName
            ? _value.defaultName
            : defaultName // ignore: cast_nullable_to_non_nullable
                  as String?,
        deviceType: freezed == deviceType
            ? _value.deviceType
            : deviceType // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultDeviceType: freezed == defaultDeviceType
            ? _value.defaultDeviceType
            : defaultDeviceType // ignore: cast_nullable_to_non_nullable
                  as String?,
        ipv4: freezed == ipv4
            ? _value.ipv4
            : ipv4 // ignore: cast_nullable_to_non_nullable
                  as String?,
        ipv6: freezed == ipv6
            ? _value.ipv6
            : ipv6 // ignore: cast_nullable_to_non_nullable
                  as String?,
        active: freezed == active
            ? _value.active
            : active // ignore: cast_nullable_to_non_nullable
                  as bool?,
        activeLastTime: freezed == activeLastTime
            ? _value.activeLastTime
            : activeLastTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        isBlocked: freezed == isBlocked
            ? _value.isBlocked
            : isBlocked // ignore: cast_nullable_to_non_nullable
                  as bool?,
        linkTo: freezed == linkTo
            ? _value.linkTo
            : linkTo // ignore: cast_nullable_to_non_nullable
                  as String?,
        linkType: freezed == linkType
            ? _value.linkType
            : linkType // ignore: cast_nullable_to_non_nullable
                  as String?,
        linkSpeed: freezed == linkSpeed
            ? _value.linkSpeed
            : linkSpeed // ignore: cast_nullable_to_non_nullable
                  as String?,
        linkWifiStandard: freezed == linkWifiStandard
            ? _value.linkWifiStandard
            : linkWifiStandard // ignore: cast_nullable_to_non_nullable
                  as String?,
        linkSsidId: freezed == linkSsidId
            ? _value.linkSsidId
            : linkSsidId // ignore: cast_nullable_to_non_nullable
                  as String?,
        linkRssi: freezed == linkRssi
            ? _value.linkRssi
            : linkRssi // ignore: cast_nullable_to_non_nullable
                  as String?,
        allowAccess: freezed == allowAccess
            ? _value.allowAccess
            : allowAccess // ignore: cast_nullable_to_non_nullable
                  as bool?,
        denyAccessSchedules: null == denyAccessSchedules
            ? _value._denyAccessSchedules
            : denyAccessSchedules // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        tempAccessControl: freezed == tempAccessControl
            ? _value.tempAccessControl
            : tempAccessControl // ignore: cast_nullable_to_non_nullable
                  as dynamic,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HostModelImpl implements _HostModel {
  const _$HostModelImpl({
    required this.id,
    required this.mac,
    required this.name,
    this.defaultName,
    this.deviceType,
    this.defaultDeviceType,
    this.ipv4,
    this.ipv6,
    this.active,
    this.activeLastTime,
    this.isBlocked,
    this.linkTo,
    this.linkType,
    this.linkSpeed,
    this.linkWifiStandard,
    this.linkSsidId,
    this.linkRssi,
    this.allowAccess,
    final List<dynamic> denyAccessSchedules = const [],
    this.tempAccessControl,
  }) : _denyAccessSchedules = denyAccessSchedules;

  factory _$HostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HostModelImplFromJson(json);

  @override
  final String id;
  @override
  final String mac;
  @override
  final String name;
  @override
  final String? defaultName;
  @override
  final String? deviceType;
  @override
  final String? defaultDeviceType;
  @override
  final String? ipv4;
  @override
  final String? ipv6;
  @override
  final bool? active;
  @override
  final String? activeLastTime;
  @override
  final bool? isBlocked;
  @override
  final String? linkTo;
  @override
  final String? linkType;
  @override
  final String? linkSpeed;
  @override
  final String? linkWifiStandard;
  @override
  final String? linkSsidId;
  @override
  final String? linkRssi;
  @override
  final bool? allowAccess;
  final List<dynamic> _denyAccessSchedules;
  @override
  @JsonKey()
  List<dynamic> get denyAccessSchedules {
    if (_denyAccessSchedules is EqualUnmodifiableListView)
      return _denyAccessSchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_denyAccessSchedules);
  }

  @override
  final dynamic tempAccessControl;

  @override
  String toString() {
    return 'HostModel(id: $id, mac: $mac, name: $name, defaultName: $defaultName, deviceType: $deviceType, defaultDeviceType: $defaultDeviceType, ipv4: $ipv4, ipv6: $ipv6, active: $active, activeLastTime: $activeLastTime, isBlocked: $isBlocked, linkTo: $linkTo, linkType: $linkType, linkSpeed: $linkSpeed, linkWifiStandard: $linkWifiStandard, linkSsidId: $linkSsidId, linkRssi: $linkRssi, allowAccess: $allowAccess, denyAccessSchedules: $denyAccessSchedules, tempAccessControl: $tempAccessControl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HostModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.defaultName, defaultName) ||
                other.defaultName == defaultName) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.defaultDeviceType, defaultDeviceType) ||
                other.defaultDeviceType == defaultDeviceType) &&
            (identical(other.ipv4, ipv4) || other.ipv4 == ipv4) &&
            (identical(other.ipv6, ipv6) || other.ipv6 == ipv6) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.activeLastTime, activeLastTime) ||
                other.activeLastTime == activeLastTime) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.linkTo, linkTo) || other.linkTo == linkTo) &&
            (identical(other.linkType, linkType) ||
                other.linkType == linkType) &&
            (identical(other.linkSpeed, linkSpeed) ||
                other.linkSpeed == linkSpeed) &&
            (identical(other.linkWifiStandard, linkWifiStandard) ||
                other.linkWifiStandard == linkWifiStandard) &&
            (identical(other.linkSsidId, linkSsidId) ||
                other.linkSsidId == linkSsidId) &&
            (identical(other.linkRssi, linkRssi) ||
                other.linkRssi == linkRssi) &&
            (identical(other.allowAccess, allowAccess) ||
                other.allowAccess == allowAccess) &&
            const DeepCollectionEquality().equals(
              other._denyAccessSchedules,
              _denyAccessSchedules,
            ) &&
            const DeepCollectionEquality().equals(
              other.tempAccessControl,
              tempAccessControl,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    mac,
    name,
    defaultName,
    deviceType,
    defaultDeviceType,
    ipv4,
    ipv6,
    active,
    activeLastTime,
    isBlocked,
    linkTo,
    linkType,
    linkSpeed,
    linkWifiStandard,
    linkSsidId,
    linkRssi,
    allowAccess,
    const DeepCollectionEquality().hash(_denyAccessSchedules),
    const DeepCollectionEquality().hash(tempAccessControl),
  ]);

  /// Create a copy of HostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HostModelImplCopyWith<_$HostModelImpl> get copyWith =>
      __$$HostModelImplCopyWithImpl<_$HostModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HostModelImplToJson(this);
  }
}

abstract class _HostModel implements HostModel {
  const factory _HostModel({
    required final String id,
    required final String mac,
    required final String name,
    final String? defaultName,
    final String? deviceType,
    final String? defaultDeviceType,
    final String? ipv4,
    final String? ipv6,
    final bool? active,
    final String? activeLastTime,
    final bool? isBlocked,
    final String? linkTo,
    final String? linkType,
    final String? linkSpeed,
    final String? linkWifiStandard,
    final String? linkSsidId,
    final String? linkRssi,
    final bool? allowAccess,
    final List<dynamic> denyAccessSchedules,
    final dynamic tempAccessControl,
  }) = _$HostModelImpl;

  factory _HostModel.fromJson(Map<String, dynamic> json) =
      _$HostModelImpl.fromJson;

  @override
  String get id;
  @override
  String get mac;
  @override
  String get name;
  @override
  String? get defaultName;
  @override
  String? get deviceType;
  @override
  String? get defaultDeviceType;
  @override
  String? get ipv4;
  @override
  String? get ipv6;
  @override
  bool? get active;
  @override
  String? get activeLastTime;
  @override
  bool? get isBlocked;
  @override
  String? get linkTo;
  @override
  String? get linkType;
  @override
  String? get linkSpeed;
  @override
  String? get linkWifiStandard;
  @override
  String? get linkSsidId;
  @override
  String? get linkRssi;
  @override
  bool? get allowAccess;
  @override
  List<dynamic> get denyAccessSchedules;
  @override
  dynamic get tempAccessControl;

  /// Create a copy of HostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HostModelImplCopyWith<_$HostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetHostsResponse _$GetHostsResponseFromJson(Map<String, dynamic> json) {
  return _GetHostsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetHostsResponse {
  List<HostModel> get hosts => throw _privateConstructorUsedError;

  /// Serializes this GetHostsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetHostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetHostsResponseCopyWith<GetHostsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetHostsResponseCopyWith<$Res> {
  factory $GetHostsResponseCopyWith(
    GetHostsResponse value,
    $Res Function(GetHostsResponse) then,
  ) = _$GetHostsResponseCopyWithImpl<$Res, GetHostsResponse>;
  @useResult
  $Res call({List<HostModel> hosts});
}

/// @nodoc
class _$GetHostsResponseCopyWithImpl<$Res, $Val extends GetHostsResponse>
    implements $GetHostsResponseCopyWith<$Res> {
  _$GetHostsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetHostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hosts = null}) {
    return _then(
      _value.copyWith(
            hosts: null == hosts
                ? _value.hosts
                : hosts // ignore: cast_nullable_to_non_nullable
                      as List<HostModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetHostsResponseImplCopyWith<$Res>
    implements $GetHostsResponseCopyWith<$Res> {
  factory _$$GetHostsResponseImplCopyWith(
    _$GetHostsResponseImpl value,
    $Res Function(_$GetHostsResponseImpl) then,
  ) = __$$GetHostsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<HostModel> hosts});
}

/// @nodoc
class __$$GetHostsResponseImplCopyWithImpl<$Res>
    extends _$GetHostsResponseCopyWithImpl<$Res, _$GetHostsResponseImpl>
    implements _$$GetHostsResponseImplCopyWith<$Res> {
  __$$GetHostsResponseImplCopyWithImpl(
    _$GetHostsResponseImpl _value,
    $Res Function(_$GetHostsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetHostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hosts = null}) {
    return _then(
      _$GetHostsResponseImpl(
        hosts: null == hosts
            ? _value._hosts
            : hosts // ignore: cast_nullable_to_non_nullable
                  as List<HostModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GetHostsResponseImpl implements _GetHostsResponse {
  const _$GetHostsResponseImpl({required final List<HostModel> hosts})
    : _hosts = hosts;

  factory _$GetHostsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetHostsResponseImplFromJson(json);

  final List<HostModel> _hosts;
  @override
  List<HostModel> get hosts {
    if (_hosts is EqualUnmodifiableListView) return _hosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hosts);
  }

  @override
  String toString() {
    return 'GetHostsResponse(hosts: $hosts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHostsResponseImpl &&
            const DeepCollectionEquality().equals(other._hosts, _hosts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_hosts));

  /// Create a copy of GetHostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetHostsResponseImplCopyWith<_$GetHostsResponseImpl> get copyWith =>
      __$$GetHostsResponseImplCopyWithImpl<_$GetHostsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GetHostsResponseImplToJson(this);
  }
}

abstract class _GetHostsResponse implements GetHostsResponse {
  const factory _GetHostsResponse({required final List<HostModel> hosts}) =
      _$GetHostsResponseImpl;

  factory _GetHostsResponse.fromJson(Map<String, dynamic> json) =
      _$GetHostsResponseImpl.fromJson;

  @override
  List<HostModel> get hosts;

  /// Create a copy of GetHostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetHostsResponseImplCopyWith<_$GetHostsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
