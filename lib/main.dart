import 'package:eccomerce_app/AdminScreen/addproduct.dart';
import 'package:eccomerce_app/screen/Main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';
import 'login.dart';
import 'splash_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // ye upar code status bar ko transparent karta he
  runApp(eccomerceApp());
}

class eccomerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: initSplashScreen(),
      home: AddProduct(),
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        Loginpage.id: (context) => Loginpage(),
        profileInitPage.id: (context) => profileInitPage(),
        MainPage.id: (context) => MainPage(),
        AddProduct.id: (context) => AddProduct(),
      },
    );
  }
}
