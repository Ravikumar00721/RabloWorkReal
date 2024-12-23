import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'component1.dart'; // Import CustomCard
import 'component2.dart'; // Import component2.dart
import 'component3.dart'; // Import component3.dart
import 'component4.dart'; // Import component4.dart
import 'component5.dart'; // Import component5.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentStep = 0;
  final List<int> stepProgress = [20, 40, 60, 80, 100];
  final List<String> stepIcons = [
    'assets/step1.svg',
    'assets/step2.svg',
    'assets/step3.svg',
    'assets/step4.svg',
    'assets/step5.svg',
  ];
  final List<String> stepTexts = [
    "Complete your profile",
    "Verify yourself",
    "Complete verification",
    "Create your plan",
    "Create website"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 80, left: 16, right: 16),
              child: Column(
                children: [
                  CustomCard(
                    // CustomCard is displayed as expected
                    currentStep: _currentStep,
                    stepProgress: stepProgress,
                    stepIcons: stepIcons,
                    stepTexts: stepTexts,
                    onStepChange: (newStep) {
                      setState(() {
                        _currentStep = newStep;
                      });
                    },
                  ),
                  const SizedBox(height: 10), // Spacer
                  const Component2(), // Display Component2
                  Component3(), // Display Component3
                  Component4(), // Display Component4
                  Component5(), // Display Component5
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
