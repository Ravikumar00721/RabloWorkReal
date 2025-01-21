import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/welcome_card_controller.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    final CardController controller = Get.find<CardController>();

    return WillPopScope(
      onWillPop: () async {
        // Decrement current step on back navigation
        if (controller.currentStep.value > 0) {
          controller.currentStep.value--;
          print("Step decremented: ${controller.currentStep.value}");
        }
        return true; // Allow navigation
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Verification"),
          backgroundColor: const Color(0xFF2F5B6C),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Verification',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  backgroundColor:
                      const Color.fromRGBO(184, 254, 34, 1), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Done"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
