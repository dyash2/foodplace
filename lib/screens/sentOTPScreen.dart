import 'package:flutter/material.dart';

class SendOTPScreen extends StatefulWidget {
  static const routeName = "/sendOTP";
  @override
  _SendOTPScreenState createState() => _SendOTPScreenState();
}

class _SendOTPScreenState extends State<SendOTPScreen> {
  final TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter the 4-digit OTP',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 4,
                decoration: InputDecoration(
                  labelText: 'OTP',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String otp = otpController.text;
                if (otp.length == 4) {
                  // You can add your OTP verification logic here.
                  print('Entered OTP: $otp');
                } else {
                  // Display an error message if the OTP is not 4 digits.
                  print('Invalid OTP');
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
