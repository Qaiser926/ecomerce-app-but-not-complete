import 'package:eccomerce_app/home_page.dart';
import 'package:eccomerce_app/screen/Main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthProvider {
  loginwithPhone(BuildContext context, String phone) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    TextEditingController otpC = TextEditingController();
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (AuthCredential credential) async {
          UserCredential result = await _auth.signInWithCredential(credential);
          Navigator.pop(context);
          User? user = result.user;
          if (user != null) {
            Navigator.pushReplacementNamed(context, MainPage.id);
          } else {
            Fluttertoast.showToast(msg: 'User does not exist');
          }
        },
        verificationFailed: (FirebaseException e) {
          Fluttertoast.showToast(msg: e.toString());
        },
        codeSent: (String verificationcode, int) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text('enter OTP'),
                  content: Column(
                    children: [
                      TextField(
                        controller: otpC,
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () async {
                          final code = otpC.text;
                          AuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationcode,
                                  smsCode: code);
                          UserCredential result =
                              await _auth.signInWithCredential(credential);
                          User? user = result.user;
                          if (user != null) {
                            Navigator.pushReplacementNamed(
                                context, profileInitPage.id);
                            print('success');
                          } else {
                            Fluttertoast.showToast(msg: 'Error');
                          }
                        },
                        child: Text('varify'))
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (id) => {});
  }
}
