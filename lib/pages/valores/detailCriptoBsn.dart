
import 'dart:convert';

import 'package:econodata/providers/criptoProvider.dart';

class DetailCriptoBsn{
  static String title = '';
  static String symbol = '';
  static String urlimagen = '';
  static String valorusd = '';
  static String valorbtc = '';
  static String twitterfollowers = '';
  static Map<String,dynamic> infoCripto = {};

  static Future trabajarData(String id) async {
    DetailCriptoBsn.infoCripto = await CriptoProvider.getCoinInfo(id);
    urlimagen = infoCripto["image"]["large"];
    valorusd = infoCripto["market_data"]["current_price"]["usd"].toString();
    valorbtc = infoCripto["market_data"]["current_price"]["btc"].toString();
    twitterfollowers = infoCripto["community_data"]["twitter_followers"].toString();
  } 
}