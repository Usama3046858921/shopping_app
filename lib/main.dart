import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/bottom_navigation_bar.dart';
import 'package:shopping_app/screens/enter_otp.dart';
import 'package:shopping_app/screens/otp.dart';

void main() async{
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'phone',
      routes: {
        'phone': (context) => EnterOTP(),
        'otp': (context) => OTP(),
      },
      // home: EnterOTP(),
    );
  }
}
