import 'dart:async';
import 'package:eccomerce_app/login.dart';
import 'package:eccomerce_app/resuable/style.dart';
import 'package:eccomerce_app/screen/Main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class initSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // yaha par niche check kare ga k connection stat wait par he agr wiat par he to 'SplashScren ' ko return kare ga.

          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }
          // yaha par check kare ga k data agr nhe he or (ya ) null he to login screen par le ke jaye ga
          if (!snapshot.hasData || snapshot == null) {
            Loginpage();
          } // our jab data null nhe he to splash scren par jaye ga
          else if (snapshot.data != null) {}
          return SplashScreen();
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  static const id = '/login';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, MainPage.id);
    });
    super.initState();
  }

  // jab b kio splash screen create kare ge ya timer laga rahe he to (dispose ) zaror kare

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Expanded(child: Image.asset('photo/logopic.png')),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Text(
                'Shopiz',
                style: text_style,
              ),
            ),
            Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Timer>('_timer', _timer));
  }
}
