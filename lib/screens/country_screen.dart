import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mme_teranga/controller/country_controller.dart';

class CountryScreen extends StatelessWidget {
  CountryScreen({Key? key}) : super(key: key);
  var countryController = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 233, 233),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Counry Screen",
          style: TextStyle(color: Colors.green),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.grey),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: width * .9,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: 1.2, color: const Color.fromARGB(255, 17, 5, 45)),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 8,
                        color: Colors.white,
                        spreadRadius: -4)
                  ]),
              child: Center(
                child: TextField(
                  onChanged: (value) => countryController.updateCountry(value),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Find your ...",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 17, 5, 45),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 17, 5, 45),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Obx(() {
              if (countryController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                height: height,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: countryController.displayCountry.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                countryController
                                    .displayCountry[index].nameCommon,
                                style: const TextStyle(fontSize: 13),
                              ),
                              Text(
                                countryController.displayCountry[index].capital,
                                style: const TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                          subtitle: Text(
                            countryController
                                .displayCountry[index].nameOfficial,
                            style: const TextStyle(fontSize: 10),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(countryController
                                .displayCountry[index].flagPng),
                          ),
                        ),
                      );
                    }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
