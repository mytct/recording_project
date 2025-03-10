import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:app_core/config/init_protocol.dart';
import 'package:app_core/config/logs_config.dart';
import 'package:app_core/data/apple_product_name.dart';
import 'package:app_core/data/device_info_model.dart';

abstract interface class DeviceConfigProtocols implements InitProtocols {
  Future<String?> getDeviceId();
  Future<DeviceInfoModel?> getDeviceInfo();
  Future<String> getAppVersion();
}

@injectable
class DeviceConfig with LogsConfig implements DeviceConfigProtocols {
  @override
  String tag = 'DeviceConfig';

  @override
  Future<void> init() async {}

  @override
  Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  Future<DeviceInfoModel?> getDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    final String appVersion = await getAppVersion();
    if (kIsWeb) {
      final webDeviceInfo = await deviceInfo.webBrowserInfo;
      final DeviceInfoModel info = DeviceInfoModel(
        osVersion: webDeviceInfo.appVersion ?? '',
        deviceType: 'Web',
        deviceModel: webDeviceInfo.browserName.name,
        deviceId: '',
        appVersion: appVersion,
        brand: webDeviceInfo.product ?? '',
      );
      return info;
    }
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      final DeviceInfoModel info = DeviceInfoModel(
        osVersion: iosDeviceInfo.systemVersion,
        deviceType: 'IOS',
        deviceModel: AppleProductName.lookup(iosDeviceInfo.utsname.machine),
        deviceId: iosDeviceInfo.identifierForVendor ?? '',
        appVersion: appVersion,
        brand: iosDeviceInfo.model,
      );
      return info;
    }
    if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      final DeviceInfoModel info = DeviceInfoModel(
        osVersion: androidDeviceInfo.version.release,
        deviceType: 'Android',
        deviceModel: androidDeviceInfo.model,
        deviceId: androidDeviceInfo.id,
        appVersion: appVersion,
        brand: androidDeviceInfo.brand,
      );
      return info;
    }
    return null;
  }

  @override
  Future<String?> getDeviceId() async {
    if (kIsWeb) return null;
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    }
    if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id;
    }
    return null;
  }
}
