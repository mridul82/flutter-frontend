import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  String phoneNo;
  String smsCode;
  String verificationId;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Phone Auth'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Enter Phone Number'),
                onChanged: (value) {
                  this.phoneNo = value;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                onPressed: verifyPhone,
                child: Text('Verify'),
                textColor: Colors.white,
                elevation: 7.0,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: this.phoneNo,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
