import 'dart:convert';
import 'package:http/http.dart' as http;

class NearbyData {
  final String name, price, rating, site, description;
  NearbyData(
      {required this.name,
      required this.price,
      required this.rating,
      required this.site,
      required this.description});
}

Future<List<NearbyData>> getNearbyData() async {
  late List<NearbyData> dataList = [];
  final response =
      await http.get(Uri.parse('http://10.0.0.67:3000/nearbyplacesdata'));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    for (Map i in data) {
      NearbyData nearby = NearbyData(
          name: i['name'],
          price: i['price'],
          site: i['site'],
          rating: i['rating'],
          description: i['description'],);

      dataList.add(nearby);
    }
    return dataList;
  } else {
    return dataList;
  }
}
