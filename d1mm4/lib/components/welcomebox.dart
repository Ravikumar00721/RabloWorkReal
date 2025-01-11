import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/card_controller.dart';

class CustomCard extends StatelessWidget {
  final CardController controller;

  const CustomCard({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: const Color(0xFF2F5B6C),
      child: SizedBox(
        width: double.infinity,
        height: deviceHeight * 0.25,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // "Welcome Back!" with less italic effect
                  Transform(
                    transform: Matrix4.skewX(-0.1), // Less italic effect
                    child: const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFFFFFFF),
                        fontFamily: 'Barlow Semi Condensed',
                        fontStyle: FontStyle.normal,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'You are One-Step Closer to creating your App',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // Steps
                  Expanded(
                    child: Row(
                      children: List.generate(5, (index) {
                        return Row(
                          children: [
                            Obx(() => CircleAvatar(
                              backgroundColor:
                              controller.currentStep.value >= index
                                  ? const Color.fromRGBO(184, 254, 34, 1)
                                  : Colors.grey,
                              child: SvgPicture.asset(
                                'assets/step${index + 1}.svg',
                                width: 14,
                                height: 14,
                                color: controller.currentStep.value >= index
                                    ? const Color(0xFF003366)
                                    : Colors.white,
                              ),
                            )),
                            if (index < 4)
                              Obx(() => SizedBox(
                                width: 24,
                                child: Container(
                                  height: 6,
                                  color: controller.currentStep.value > index
                                      ? const Color.fromRGBO(
                                      184, 254, 34, 1)
                                      : Colors.grey,
                                ),
                              )),
                          ],
                        );
                      }),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '|',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Percentage Text with less italic effect
                  Obx(() => Transform(
                    transform: Matrix4.skewX(-0.1), // Less italic effect
                    child: Text(
                      '${controller.currentPercentage}%',
                      style: const TextStyle(
                        fontFamily: 'Barlow Semi Condensed',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        height: 1.2,
                        color: Colors.white,
                      ),
                    ),
                  )),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (controller.currentStep.value < 4) {
                    controller.changeStep(controller.currentStep.value + 1);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(184, 254, 34, 1),
                  minimumSize: Size(double.infinity, deviceHeight * 0.05),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Obx(() => Text(
                  controller.currentButtonText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                    color: Color(0xFF121212),
                    fontFamily: 'Poppins',
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
