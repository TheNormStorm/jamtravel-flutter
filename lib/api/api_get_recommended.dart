import 'dart:convert';
import 'package:http/http.dart' as http;

class JamData {
  final String name, parish, rating, site, id;
  JamData(
      {required this.name,
      required this.parish,
      required this.rating,
      required this.site,
      required this.id});
}

Future<List<JamData>> getPhotos() async {
  late List<JamData> dataList = [];
  final response = await http.get(Uri.parse('http://10.0.0.67:3000/recomendationdata'));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    for (Map i in data) {
      JamData photos = JamData(
          name: i['name'],
          parish: i['parish'],
          site: i['site'],
          rating: i['rating'],
          id: i['id']);

      dataList.add(photos);
    }
    return dataList;
  } else {
    return dataList;
  }
}
