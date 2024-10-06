// otp_model.dart
class OtpRequest {
  final String mobileNumber;
  final String deviceId;

  OtpRequest({
    required this.mobileNumber,
    required this.deviceId,
  });

  Map<String, dynamic> toJson() {
    return {
      'mobileNumber': mobileNumber,
      'deviceId': deviceId,
    };
  }
}
