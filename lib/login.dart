import 'package:flutter/material.dart';
import 'package:internship/otp.dart';
import 'package:internship/service/api_login_service.dart';

import 'model/otp_model.dart';

class PhoneEmailToggleScreen extends StatefulWidget {
  @override
  _PhoneEmailToggleScreenState createState() => _PhoneEmailToggleScreenState();
}

class _PhoneEmailToggleScreenState extends State<PhoneEmailToggleScreen> {
  bool isPhoneSelected = true;
  final TextEditingController _inputController = TextEditingController();
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // Logo Section
                Center(
                  child: Column(
                    children: [
                      Image.network(
                        'https://via.placeholder.com/100x100.png?text=DealsDray+Logo', // Placeholder for DealsDray logo
                        height: 100,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'DealsDray',
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                // Toggle Buttons for Phone and Email
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ToggleButton(
                          text: 'Phone',
                          isSelected: isPhoneSelected,
                          onTap: () {
                            setState(() {
                              isPhoneSelected = true;
                            });
                          },
                        ),
                        ToggleButton(
                          text: 'Email',
                          isSelected: !isPhoneSelected,
                          onTap: () {
                            setState(() {
                              isPhoneSelected = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Heading Text
                Text(
                  'Glad to see you!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Please provide your ${isPhoneSelected ? 'phone number' : 'email'}',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                // Input Field for Phone/Email
                TextFormField(
                  controller: _inputController,
                  decoration: InputDecoration(
                    labelText: isPhoneSelected ? 'Phone' : 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: isPhoneSelected ? TextInputType.phone : TextInputType.emailAddress,
                ),
                const SizedBox(height: 40),
                // Send Code Button
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _sendCode(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[100], // Light pink background
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'SEND CODE',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to send OTP or Email Verification Code
  Future<void> _sendCode() async {
    if (isPhoneSelected) {
      String phoneNumber = _inputController.text;
      OtpRequest otpRequest = OtpRequest(
        mobileNumber: phoneNumber,
        deviceId: "62b341aeb0ab5ebe28a758a3", // Replace with the actual device ID
      );

      bool success = await _apiService.sendOtp(otpRequest);
      if (success) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerificationScreen()));
      } else {
        // Handle error (optional: show error message to the user)
        print('Failed to send OTP');
      }
    } else {
      // Handle Email Verification Flow
      // If email, you could call a different API or handle accordingly
      print('Sending email verification code');
    }
  }
}

class ToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ToggleButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
