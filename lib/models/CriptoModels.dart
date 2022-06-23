
class CriptoList {
  late String id;
  late String symbol;
  late String name;

  CriptoList(){
    this.id = '';
    this.name = '';
    this.symbol = '';
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'symbol': symbol,
  };

  CriptoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
  }
}