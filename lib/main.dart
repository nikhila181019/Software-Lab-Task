import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:software_lab_task/Screens/businessHoursPage.dart';
import 'package:software_lab_task/Screens/farmInfo.dart';
import 'package:software_lab_task/Screens/forgotPassword.dart';
import 'package:software_lab_task/Screens/loginPage.dart';
import 'package:software_lab_task/Screens/resetPasswordPage.dart';
import 'package:software_lab_task/Screens/verificationPage.dart';
import 'package:software_lab_task/Screens/verifyOtpPage.dart';
  import 'Screens/allDonePage.dart';
import 'Screens/boardingPage.dart';
import 'Screens/welcomePage.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),

        routes: {
          "fromOnBoarding":(context)=>LoginPage(),
          "fromLogin":(context)=>ForgotPassword(),
          "fromForgotPassword":(context)=>VerifyOtp(),
          "fromVerifyOtp":(context)=>ResetPassword(),
          "AfterSuccessfulLogin":(context)=>AllDone(),
          "fromWelcomePage":(context)=>FarmInfo(),
          "fromFarmInfo":(context)=>Verification(),
          "fromVerification":(context)=>BusinessHours(),
          "fromBusinessHours":(context)=>AllDone(),
          "fromLoginn":(context)=>WelcomePage(),
        },
      );
    }
  }
