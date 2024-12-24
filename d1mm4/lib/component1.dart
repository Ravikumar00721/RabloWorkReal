import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class CustomCard extends StatelessWidget {
  final HomeController controller;

  const CustomCard({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: const Color(0xFF2F5B6C),
      child: SizedBox(
        width: 344,
        height: 199,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'Barlow Semi Condensed',
                      fontStyle: FontStyle.italic,
                      height: 1.2, 
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'You are One-Step Closer to creating your App',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      height: 1.5, 
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                },
                                child: Obx(() => Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: controller.currentStep.value >= index
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
                                    ),
                                  ],
                                )),
                              ),
                              if (index < 4)
                                Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 8,
                                    height: 6,
                                    color: controller.currentStep.value > index
                                        ? const Color.fromRGBO(184, 254, 34, 1)
                                        : Colors.grey,
                                  ),
                                ),
                            ],
                          );
                        }),
                      ),
                      const Text(
                        '|',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      Obx(() => Text(
                        '${controller.currentPercentage}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      )),
                    ],
                  ),
                ],
              ),
        
              ElevatedButton(
                onPressed: () {
                  if (controller.currentStep.value < 4) {
                    controller.changeStep(controller.currentStep.value + 1);
                  }
                },
                child: Obx(() => Text(
                  controller.currentButtonText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    color: const Color(0xFF121212),
                  ),
                )),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    controller.currentStep.value == 4
                        ? const Color.fromRGBO(184, 254, 34, 1) 
                        : const Color.fromRGBO(184, 254, 34, 1), 
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(320, 30)),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 8)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
