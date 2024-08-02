import 'package:flutter/material.dart';
import 'package:stockreturncalculator/loginscreen.dart';
import 'package:stockreturncalculator/registrationscreen.dart';
import 'package:stockreturncalculator/stockcalculatorscreen.dart';
import 'package:stockreturncalculator/welcomescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform,);

  runApp(
    MaterialApp(
    initialRoute: WelcomeScreen.id,
    routes:{
      LoginScreen.id:(context)=>LoginScreen(),
      WelcomeScreen.id:(context)=>WelcomeScreen(),
      RegistrationScreen.id:(context)=>RegistrationScreen(),
      stockcalculator.id:(context)=>stockcalculator(),

    } ,),
  );
}


