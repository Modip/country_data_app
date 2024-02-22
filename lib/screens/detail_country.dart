import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mme_teranga/constant.dart';

import '../controller/country_controller.dart';

class DetailCountry extends StatelessWidget {
  DetailCountry({Key? key}) : super(key: key);
  var countryController = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Country App",
          style: TextStyle(color: kBackgroundColor),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new, color: kBackgroundColor),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 25,
            left: 100,
            right: 100,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(Get.arguments['flagPng']),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black),
              height: 80,
            ),
          ),
          Positioned(
            top: 110,
            left: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.transparent),
              height: 50,
              child: Center(
                child: Text(Get.arguments['nameCommon'],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Positioned(
            top: height * .3,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              //height: height * .5,
              child: Column(
                children: [
                  SizedBox(
                    height: height * .06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Capital", style: TextStyle(fontSize: 18)),
                      Text(Get.arguments['capital'],
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  SizedBox(
                    height: height * .06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Population", style: TextStyle(fontSize: 18)),
                      Text(Get.arguments['population'],
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  SizedBox(
                    height: height * .06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Area", style: TextStyle(fontSize: 18)),
                      Text(Get.arguments['area'],
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child:
                            Text("SubRegion", style: TextStyle(fontSize: 18)),
                      ),
                      Expanded(
                        child: Text(Get.arguments['subregion'],
                            style: const TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
