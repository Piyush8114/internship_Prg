import 'package:flutter/material.dart';
import 'package:internship/service/api_signUp_service.dart';
import 'model/signup_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();

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
                // Logo
                Center(
                  child: Column(
                    children: [
                      Image.network(
                        'https://via.placeholder.com/100x100.png?text=DealsDray+Logo',
                        height: 100,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'DealsDray',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                // Let's Begin Text
                Text(
                  "Let's Begin!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Please enter your credentials to proceed',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                // Email Field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Your Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                // Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Create Password',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
                const SizedBox(height: 20),
                // Referral Code (Optional)
                TextFormField(
                  controller: _referralCodeController,
                  decoration: InputDecoration(
                    labelText: 'Referral Code (Optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40),
                // Submit Button
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () => _submitSignUp(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Background color
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Icon(Icons.arrow_forward, color: Colors.white),
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

  // Function to submit sign-up data
  Future<void> _submitSignUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String referralCodeText = _referralCodeController.text;

    int referralCode = referralCodeText.isNotEmpty ? int.parse(referralCodeText) : 0;

    // Create an instance of SignUpData
    SignUpData signUpData = SignUpData(
      email: email,
      password: password,
      referralCode: referralCode,
      userId: "62a833766ec5dafd6780fc85", // Replace with actual user ID if necessary
    );

    try {
      // Call the API service to send data
      bool success = await _apiService.signUp(signUpData);

      if (success) {
        // Handle successful sign-up, navigate to another screen
        print('Sign-up successful');
        _showSnackBar('Sign-up successful', Colors.green);
        // Navigate to another screen or perform desired actions
      } else {
        // Handle failed sign-up
        _showSnackBar('Sign-up failed. Try again.', Colors.red);
        print('Sign-up failed');
      }
    } catch (error) {
      if (error.toString().contains('Email exists')) {
        // Show specific error message for existing email
        _showSnackBar('Email already exists. Please use another email.', Colors.red);
      } else {
        // Show general error message
        _showSnackBar('An error occurred. Please try again.', Colors.red);
      }
      print('Sign-up failed: $error');
    }
  }

  void _showSnackBar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


}
