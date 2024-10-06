import 'package:flutter/material.dart';
import 'dart:async';

import 'package:internship/home.dart';

class OtpVerificationScreen extends StatefulWidget {
  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  int secondsRemaining = 120;
  bool enableResend = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  void resendCode() {
    // Logic to resend the OTP
    setState(() {
      secondsRemaining = 120;
      enableResend = false;
      startTimer();
    });
  }

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
                // Phone icon with a message bubble (placeholder for now)
                Center(
                  child: Icon(
                    Icons.sms,
                    size: 100,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20),
                // OTP Verification Text
                Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'We have sent a unique OTP number to your mobile +91-9765232817',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                // OTP Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _otpTextField(context),
                    _otpTextField(context),
                    _otpTextField(context),
                    _otpTextField(context),
                  ],
                ),
                const SizedBox(height: 20),
                // Countdown timer and Resend Code
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "01:${secondsRemaining < 10 ? '0$secondsRemaining' : secondsRemaining}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: enableResend ? resendCode : null,
                        child: Text(
                          'SEND AGAIN',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: enableResend ? Colors.red : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _otpTextField(BuildContext context) {
    return Container(
      width: 50,
      height: 65,
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        style: TextStyle(fontSize: 24),
        maxLength: 1,
        onChanged: (value) {
          // if (value.length == 1) {
          //   FocusScope.of(context).nextFocus();

            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
          }
        // },
      ),
    );
  }
}
