class CoinData {
  String name;
  double allTimeHigh;
  String imageUrl;
  DateTime lastUpdated;

  CoinData(
      {required this.name,
      required this.allTimeHigh,
      required this.imageUrl,
      required this.lastUpdated});

  factory CoinData.fromJson(Map<String, dynamic> json) {
    return CoinData(
      name: json['name'],
      allTimeHigh: json["atl"],
      imageUrl: json['image'],
      lastUpdated: DateTime.parse(json['last_updated']),
    );
  }
}
