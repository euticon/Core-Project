import 'package:http/http.dart'as http;
import 'dart:convert';

Stockcalculator(){
void getdata(String value_sym,String value_buy,String value_sell,String value_size)async
{
  http.Response response=
  await http.get(Uri.parse('https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=$value_sym&outputsize=full&apikey=1NMZ5NY2RL6RQLLN'));
      String data = response.body;
  double buy_price=(jsonDecode(data)['Time Series (Daily)']['$value_buy']['2.high']+jsonDecode(data)['Time Series (Daily)']['$value_buy']['2.low'])/2;
  double sell_price=(jsonDecode(data)['Time Series (Daily)']['$value_sell']['2.high']+jsonDecode(data)['Time Series (Daily)']['$value_buy']['2.low'])/2;
  double ret=(sell_price-buy_price)*double.parse(value_size);
}
}