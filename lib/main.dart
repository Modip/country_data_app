import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mme_teranga/screens/country_screen.dart';
import 'package:test_mme_teranga/screens/detail_country.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Country App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => CountryScreen()),
        GetPage(name: "/detail", page: () => DetailCountry())
      ],
    
    );
  }
}
