import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/card_controller.dart';

class BusinessAccount extends StatelessWidget {
  const BusinessAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final CardController controller = Get.find<CardController>(); // Get the instance of CardController

    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Account"),
        backgroundColor: const Color(0xFF2F5B6C),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Business Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update step before navigating back
                controller.changeStep();  // Increment step here

                // Go back to the previous screen
                Get.back();
              },
              child: const Text("Done"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                backgroundColor: const Color.fromRGBO(184, 254, 34, 1), // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
