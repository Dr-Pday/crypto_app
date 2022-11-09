class Crypto {
  String id;
  int rank;
  String symbol;
  String name;
  double marketCapUsd;
  double volumeUsd24Hr;
  double priceUsd;
  double changePercent24Hr;
  var explorer;

  Crypto(
    this.id,
    this.rank,
    this.symbol,
    this.name,
    this.marketCapUsd,
    this.volumeUsd24Hr,
    this.priceUsd,
    this.changePercent24Hr,
    this.explorer,
  );
  factory Crypto.fromMapJson(Map<String, dynamic> jsonMapObject) {
    return Crypto(
      jsonMapObject['id'],
      int.parse(jsonMapObject['rank']),
      jsonMapObject['symbol'],
      jsonMapObject['name'],
      double.parse(jsonMapObject['marketCapUsd']),
      double.parse(jsonMapObject['volumeUsd24Hr']),
      double.parse(jsonMapObject['priceUsd']),
      double.parse(jsonMapObject['changePercent24Hr']),
      (jsonMapObject['explorer']),
    );
  }
}
