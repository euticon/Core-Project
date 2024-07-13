import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class stockcalculator extends StatefulWidget {
  static const String id='stockcalculatorscreen.dart';
  const stockcalculator({super.key});

  @override
  State<stockcalculator> createState() => _stockcalculatorState();
}

class _stockcalculatorState extends State<stockcalculator> {

  // final auth=FirebaseAuth.instance;
  // final firestore=FirebaseFirestore.instance;
  // User? loggedInUser;
  // String symbol='';
  // String buydate='';
  // String selldate='';
  // String returns='';
  //
  // void getCurrentUser()async{
  //   try {
  //     final user = auth.currentUser;
  //     if (user != null) {
  //       loggedInUser = user;
  //       print(loggedInUser!.email);
  //     }
  //   }
  //   catch(e)
  //   {
  //     print(e);
  //   }
  // }

  final TextEditingController symbolController=TextEditingController();
  final TextEditingController buyDateController = TextEditingController();
  final TextEditingController sellDateController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  double result=0;
  double sp=0,cp=0;


  String _error = '';

  void getData(String valueSym, String valueBuy, String valueSell, String valueSize) async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=$valueSym&outputsize=full&apikey=1NMZ5NY2RL6RQLLN'));
      if (response.statusCode == 200) {
        String data = response.body;
        final jsonData = jsonDecode(data);
        if (jsonData['Time Series (Daily)'] != null &&
            jsonData['Time Series (Daily)'][valueBuy] != null &&
            jsonData['Time Series (Daily)'][valueSell] != null) {
          final buyData = jsonData['Time Series (Daily)'][valueBuy];
          final sellData = jsonData['Time Series (Daily)'][valueSell];

          double buyPrice = (double.parse(buyData['2. high']) +
              double.parse(buyData['3. low'])) /
              2;
          double sellPrice = (double.parse(sellData['2. high']) +
              double.parse(sellData['3. low'])) /
              2;
          double ret = (sellPrice - buyPrice) * double.parse(valueSize);
          // print('Buy price: $buyPrice'); // Print the calculated buy price
          // print('Sell price: $sellPrice'); // Print the calculated sell price
          // print('Quantity: ${double.parse(valueSize)}'); // Print the quantity
          // print('Result: $ret'); // Print the result
          setState(() {
            result = ret;
            sp=sellPrice;
            cp=buyPrice;
            _error = '';
          });
        } else {
          setState(() {
            _error = 'Invalid data for the provided dates.';
          });
        }
      } else {
        setState(() {
          _error = 'Error fetching data: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Stock Return Calculator'),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(children: [
                Expanded(
                  child: SizedBox(height: 90,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter stock symbol in capital letters',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      controller: symbolController,
                      // onChanged: (value)
                      // {
                      //   symbol=value;
                      // },
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: SizedBox(height: 90,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter buy date in YYYY-MM-DD format',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      controller: buyDateController,
                      // onChanged: (value)
                      // {
                      //   buydate=value;
                      // },
                    ),
                  ),
                ),
              ]),
              Row(children: [
                Expanded(
                  child: SizedBox(height: 90,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter sell date in YYYY-MM-DD format',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      controller: sellDateController,
                      // onChanged: (value)
                      // {
                      //   selldate=value;
                      // },
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: SizedBox(height: 90,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter quantity',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      controller: quantityController,
                      // onChanged: (value)
                      // {
                      //   returns=value;
                      // },
                    ),
                  ),
                ),
              ]),
              SizedBox(height:90,width: 120,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    ),),
                  child: Text('Calculate profit/loss'),
                  onPressed: (){
                    getData(symbolController.text,buyDateController.text,sellDateController.text,quantityController.text);
                    // firestore.collection('stockdata').add(
                    //     {'symbol':symbol,
                    //     'buydate':buydate,
                    //     'selldate':selldate,
                    //     'return':returns,});
                  },
                ),
              ),
              SizedBox(height: 15,),
              if (_error.isNotEmpty)
                Text(
                  _error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              SizedBox(height: 120,
                child: Text(
                  'You made a profit/loss of $result dollars and your selling price was $sp dollars and cost price was $cp dollars',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
              ),
            ]),
      ),
    );
  }
}