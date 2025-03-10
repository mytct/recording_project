class DeviceInfoModel {
  final String osVersion;
  final String appVersion;
  final String deviceType;
  final String deviceModel;
  final String deviceId;
  final String brand;

  DeviceInfoModel({
    required this.osVersion,
    required this.deviceType,
    required this.deviceModel,
    required this.deviceId,
    required this.appVersion,
    required this.brand,
  });
}
