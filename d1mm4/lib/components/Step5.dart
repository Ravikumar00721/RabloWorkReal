import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/card_controller.dart';

class Step5 extends StatelessWidget {
  const Step5({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Step5"),
        backgroundColor: const Color(0xFF2F5B6C),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Step5',
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
              child: const Text("Done"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50), backgroundColor: const Color.fromRGBO(184, 254, 34, 1), // Button color
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
