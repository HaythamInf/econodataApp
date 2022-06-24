
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

  static Future<List<CriptoList>> getCoinListLocal(String busqueda, String simbol) async {
    final path = 'assets/criptos.json';
    // list dynamic to list CriptoList
    List<CriptoList> retorno = [];
    List<dynamic> criptos = jsonDecode(await ApiProvider.getJson(path));
    if(busqueda != '' || simbol != ''){
      for (var i = 0; i < criptos.length; i++) {
        CriptoList cripto = CriptoList.fromJson(criptos[i]);
        if(simbol != ''){
          if(cripto.symbol == simbol){
            retorno.add(cripto);
          }else{
            continue;
          }
        }else{
          if (cripto.name.toLowerCase().contains(busqueda.toLowerCase())) {
            retorno.add(cripto);
          }else{
            continue;
          }    
        }
        
      }
      retorno.sort((a, b) => a.name.length.compareTo(b.name.length));
    }
    return retorno;
  }

  static Future<Map<String,dynamic>> getCoinInfo(String id) async {
    final url = '$API_COINGECKO/coins/$id';
    Map<String,dynamic> retorno = jsonDecode(await ApiProvider.get(url));
    return retorno;
  }

}