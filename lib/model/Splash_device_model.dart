// device_model.dart
import 'package:flutter/material.dart';
class DeviceInfo {
  final String deviceType;
  final String deviceId;
  final String deviceName;
  final String deviceOSVersion;
  final String deviceIPAddress;
  final double lat;
  final double long;
  final String buyerGcmid;
  final String buyerPemid;
  final AppInfo app;

  DeviceInfo({
    required this.deviceType,
    required this.deviceId,
    required this.deviceName,
    required this.deviceOSVersion,
    required this.deviceIPAddress,
    required this.lat,
    required this.long,
    required this.buyerGcmid,
    required this.buyerPemid,
    required this.app,
  });

  Map<String, dynamic> toJson() {
    return {
      "deviceType": deviceType,
      "deviceId": deviceId,
      "deviceName": deviceName,
      "deviceOSVersion": deviceOSVersion,
      "deviceIPAddress": deviceIPAddress,
      "lat": lat,
      "long": long,
      "buyer_gcmid": buyerGcmid,
      "buyer_pemid": buyerPemid,
      "app": app.toJson(),
    };
  }
}

class AppInfo {
  final String version;
  final String installTimeStamp;
  final String uninstallTimeStamp;
  final String downloadTimeStamp;

  AppInfo({
    required this.version,
    required this.installTimeStamp,
    required this.uninstallTimeStamp,
    required this.downloadTimeStamp,
  });

  Map<String, dynamic> toJson() {
    return {
      "version": version,
      "installTimeStamp": installTimeStamp,
      "uninstallTimeStamp": uninstallTimeStamp,
      "downloadTimeStamp": downloadTimeStamp,
    };
  }
}
