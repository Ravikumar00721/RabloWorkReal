
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/card_controller.dart';
import 'components/welcomebox.dart';
import 'components/accessiblitybox.dart';
import 'components/quickinfo.dart';
import 'components/horizontalinforbox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'D1CM5',
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
    final controller = Get.put(CardController());

    return Scaffold(
      body: Stack(
        children: [
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
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, left: 8, right: 8),
                    child: CustomCard(
                      controller: controller, 
                    ),
                  ),
                  const SizedBox(height: 10),
                  Component2(),
                  Component3(),
              
                  Component4(),                
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}
