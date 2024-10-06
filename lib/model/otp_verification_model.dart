// otp_verification_model.dart
class OtpVerificationRequest {
  final String otp;
  final String deviceId;
  final String userId;

  OtpVerificationRequest({
    required this.otp,
    required this.deviceId,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'otp': otp,
      'deviceId': deviceId,
      'userId': userId,
    };
  }
}
