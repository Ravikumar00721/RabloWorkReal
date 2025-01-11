import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:d1mm4/components/app_bar.dart';
import 'package:d1mm4/components/custom_bottom_navigation_bar.dart';
import 'controllers/card_controller.dart';
import 'controllers/btm_navigation_bar_controller.dart';
import 'components/welcomebox.dart';
import 'components/accessiblitybox.dart';
import 'components/quickinfo.dart';
import 'components/horizontalinforbox.dart';

void main() {
  // Initialize GetX controllers globally
  Get.put(NavigationController()); // Initialize NavigationController
  Get.put(CardController()); // Initialize CardController
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'D1MM4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(deviceWidth, 60), // Adjust app bar height if needed
        child: Padding(
          padding: const EdgeInsets.only(top: 19), // Set 19px padding from the top
          child: CustomAppBar(
            deviceWidth: deviceWidth,
            deviceHeight: deviceHeight,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background layers
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: const Color(0x12121233),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: const Color(0xFF063434).withOpacity(0.8),
            ),
          ),
          // Main content
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            bottom: 0, // Adjust for the navigation bar
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(8, 119, 8, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomCard(
                    controller: Get.find<CardController>(),
                  ),
                  const SizedBox(height: 10),
                  Component2(),
                  const Component3(),
                  const Component4(),
                  // Container below Component4 with margin and Component5 inside it
                  Container(
                    margin: const EdgeInsets.only(top: 59),
                    child: Component5(),
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

