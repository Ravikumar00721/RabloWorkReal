import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/welcome_card_controller.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    final CardController controller =
        Get.find<CardController>(); // Get the instance of CardController

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
                  Transform(
                    transform: Matrix4.skewX(-0.1),
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
                  Expanded(
                    child: Row(
                      children: List.generate(5, (index) {
                        return Row(
                          children: [
                            Obx(() {
                              // Handle the special styling for verification (step 2) and KYC (step 3)
                              if (index == 2) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 20,
                                    ),
                                    Row(
                                      children: [
                                        // Left half of the circle (green color for verification)
                                        Container(
                                          width: 20,
                                          height: 38,
                                          decoration: BoxDecoration(
                                            color:
                                                controller.currentStep.value >=
                                                        2
                                                    ? const Color.fromRGBO(
                                                        184, 254, 34, 1)
                                                    : Colors.grey,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              bottomLeft: Radius.circular(16),
                                            ),
                                          ),
                                        ),
                                        // Right half of the circle (blue color for KYC)
                                        Container(
                                          width: 20,
                                          height: 38,
                                          decoration: BoxDecoration(
                                            color:
                                                controller.currentStep.value >=
                                                        2.5
                                                    ? const Color.fromRGBO(
                                                        184, 254, 34, 1)
                                                    : Colors.grey,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(16),
                                              bottomRight: Radius.circular(16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                      'assets/step${index + 1}.svg',
                                      width: 14,
                                      height: 14,
                                      color:
                                          controller.currentStep.value >= index
                                              ? const Color(0xFF003366)
                                              : Colors.white,
                                    ),
                                  ],
                                );
                              } else {
                                return CircleAvatar(
                                  backgroundColor: controller
                                              .currentStep.value >=
                                          index
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
                                );
                              }
                            }),
                            //this is bars between steps
                            if (index < 4)
                              Obx(() {
                                bool isStepCompleted =
                                    controller.currentStep.value > index;

                                // Special case for step 2 to 2.5 transition
                                if (index == 2 &&
                                    controller.currentStep.value == 2.5) {
                                  isStepCompleted =
                                      false; // Prevent color change until fully completed
                                }

                                return SizedBox(
                                  width: 24,
                                  child: Container(
                                    height: 6,
                                    color: isStepCompleted
                                        ? const Color.fromRGBO(184, 254, 34, 1)
                                        : Colors.grey,
                                  ),
                                );
                              }),
                          ],
                        );
                      }),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const SizedBox(
                    height: 25,
                    child: VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                      width: 10,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Obx(() => Transform(
                        transform: Matrix4.skewX(-0.1),
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
                  controller.changeStep();
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
