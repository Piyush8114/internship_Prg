// signup_model.dart
class SignUpData {
  final String email;
  final String password;
  final int referralCode;
  final String userId;

  SignUpData({
    required this.email,
    required this.password,
    required this.referralCode,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'referralCode': referralCode,
      'userId': userId,
    };
  }
}
