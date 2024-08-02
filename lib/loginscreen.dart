import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stockreturncalculator/stockcalculatorscreen.dart';
class LoginScreen extends StatefulWidget {
  static const String id='loginscreen.dart';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth=FirebaseAuth.instance;
  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title:Text('Login Screen')
      ),
      body:Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: ('Enter email')
              ),
              onChanged: (value)
              {
                email=value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: ('Enter password')
              ),
              onChanged: (value)
              {
                password=value;
              },
            ),
            TextButton(onPressed:()async
            {
              try {
                final newUser = await auth.signInWithEmailAndPassword(
                    email: email, password: password);
                if (newUser != null) {
                  Navigator.pushNamed(context, stockcalculator.id);
                }
              }
              catch (e) {
                print(e);
              }
            },
              child: Text('Login'),
            ),],
        ),
      )
    );
  }
}
