import 'package:test_mme_teranga/models/country.dart';

import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Country>> fetchCountryData() async {
    var uri = Uri.parse('https://restcountries.com/v3.1/all');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;

      return countryFromJson(json);
    } else {
      throw Exception("Network Error");
    }
  }
}
