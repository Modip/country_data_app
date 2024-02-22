import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
      final hasConnected = await InternetConnectionChecker().hasConnection;
      if (hasConnected) {
        var countryData = await ApiService().fetchCountryData();
        allCountryList.addAll(countryData);
        displayCountry = List.from(allCountryList);
      } else {
        Get.snackbar("You are", "OFFLINE");
        var localCountries = await ApiService().getLocalData();
        allCountryList.addAll(localCountries);
        displayCountry = List.from(allCountryList);
      }
    } catch (e) {
      // ignore: avoid_print
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

  @override
  void onClose() {}
  void onTextChanged(String text) {
    var searchList = <Country>[];
    if (text.isEmpty) {
      searchList = allCountryList;
    } else {
      searchList = allCountryList
          .where((element) =>
              element.nameCommon.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }

    displayCountry = List.from(searchList);
  }
}
