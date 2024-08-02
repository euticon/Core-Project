import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stockreturncalculator/stockcalculatorscreen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id='registrationscreen.dart';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final auth=FirebaseAuth.instance;
  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text('Registration Screen')
        ),
        body:Container(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: ('Enter email')
                ),
                onChanged: (value)
                {
                  email=value;
                },
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: ('Enter password')
                ),
                onChanged: (value)
                {
                  password=value;
                },
              ),
              TextButton(
                  onPressed:()async
                  {
                    try{
                    final user=await auth.createUserWithEmailAndPassword(email: email, password: password);
                    if(user!=null)
                      {
                        Navigator.pushNamed(context, stockcalculator.id);
                      }
                  }
                  catch(e)
                  {print (e);
                  }

                  }, child:Text('Register'))
            ],
          ),
        )
    );
  }
}
