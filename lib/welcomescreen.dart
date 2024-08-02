import 'package:flutter/material.dart';
import 'package:stockreturncalculator/loginscreen.dart';
import 'package:stockreturncalculator/registrationscreen.dart';
import 'package:stockreturncalculator/stockcalculatorscreen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcomescreen.dart';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Welcome')),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
          color: Colors.cyan,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 200,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.white),
                    ),
                    child: Text('Login'),
                  ),
                ),
                SizedBox(
                  height:50,
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll<Color>(Colors.white),
                      ),
                      child: Text('Register')),
                ),
                // TextButton(
                //     onPressed: () {
                //       Navigator.pushNamed(context, stockcalculator.id);
                //     },
                //     style: ButtonStyle(
                //       backgroundColor:
                //           WidgetStatePropertyAll<Color>(Colors.white),
                //     ),
                //     child: Text('Directly go to app')),
              ],
            ),
          )),
    );
  }
}
