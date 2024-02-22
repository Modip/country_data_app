import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:test_mme_teranga/models/country.dart';

import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Country>> fetchCountryData() async {
    var uri = Uri.parse('https://restcountries.com/v3.1/all');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      print("online data");
      return countryFromJson(json);
    } else {
      throw Exception("Network Error");
    }
  }

  Future<List<Country>> saveCountriesLocally() async {
    var isCacheExist =
        await APICacheManager().isAPICacheKeyExist("API_countries");
    var uri = Uri.parse('https://restcountries.com/v3.1/all');
    var response = await http.get(uri);
    if (!isCacheExist) {
      APICacheDBModel cacheDBModel =
          APICacheDBModel(key: "API_countries", syncData: response.body);
      await APICacheManager().addCacheData(cacheDBModel);
      var json = response.body;

      return countryFromJson(json);
    } else {
      throw Exception("Cache Error");
    }
  }

  Future<List<Country>> getLocalData() async {
    var cacheData = await APICacheManager().getCacheData("API_countries");
    // ignore: avoid_print
    print("CACHE: HIT");
    return countryFromJson(cacheData.syncData);
  }
}
