import 'package:get/get.dart';
import 'package:test_mme_teranga/models/country.dart';
import 'package:test_mme_teranga/services/remote_country_service.dart';

class CountryController extends GetxController {
  ApiService apiService = ApiService();
  var isLoading = true.obs;

  var allCountryList = <Country>[].obs;
  var displayCountry = <Country>[];

  fetchCountries() async {
    try {
      isLoading(true);
      var countryData = await ApiService().fetchCountryData();
      allCountryList.addAll(countryData);
      displayCountry = List.from(allCountryList);
    } catch (e) {
      print("Error fetching country $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchCountries();

    super.onInit();
  }

  void updateCountry(String value) {
    displayCountry = allCountryList
        .where((element) =>
            element.nameOfficial.toLowerCase().contains(value.toLowerCase()))
        .toList();
    ;
  }
}
