
import 'dart:convert';

import 'package:econodata/models/CriptoModels.dart';

import 'apiProvider.dart';

class CriptoProvider{
  static const String API_COINGECKO = 'https://api.coingecko.com/api/v3/';
  
  static Future<List<CriptoList>> getCoinList() async {
    final url = '$API_COINGECKO/coins/list';
    List<CriptoList> retorno = jsonDecode(await ApiProvider.get(url));
    return retorno;
  }

  static Future<List<CriptoList>> getCoinListLocal() async {
    final path = 'assets/criptos.json';
    // list dynamic to list CriptoList
    List<CriptoList> retorno = [];
    List<dynamic> criptos = jsonDecode(await ApiProvider.getJson(path));
    for (var i = 0; i < criptos.length; i++) {
      CriptoList cripto = CriptoList.fromJson(criptos[i]);
      retorno.add(cripto);
    }
    return retorno;
  }

  static Future<Map<String,Object>> getCoinInfo(String id) async {
    final url = '$API_COINGECKO/coins/$id';
    Map<String,Object> retorno = jsonDecode(await ApiProvider.get(url));
    return retorno;
  }

}