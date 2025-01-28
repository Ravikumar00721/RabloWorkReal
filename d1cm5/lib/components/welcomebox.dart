import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/card_controller.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    final CardController controller = Get.put(CardController());
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    // Calculate dynamic border radius
    final double borderRadius = deviceWidth * 0.05; // 5% of the screen width

    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      color: const Color(0xFF2F5B6C),
      child: SizedBox(
        width: deviceWidth * 1.0, // 90% of the screen width
        height: deviceHeight * 0.25, // 25% of the screen height
        child: Padding(
          padding: EdgeInsets.all(deviceWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform(
                    transform: Matrix4.skewX(-0.1),
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: deviceWidth * 0.065,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFFFFFFFF),
                        fontFamily: 'Barlow Semi Condensed',
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.01),
                  Text(
                    'You are One-Step Closer to creating your App',
                    style: TextStyle(
                      fontSize: deviceWidth * 0.035,
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
                      children: List.generate(3, (index) {
                        // Changed to 3 steps
                        return Row(
                          children: [
                            Obx(() {
                              final double deviceWidth =
                                  MediaQuery.of(context).size.width;
                              final double circleRadius = deviceWidth *
                                  0.05; // 5% of the screen width for radius
                              final double containerHeight = deviceWidth *
                                  0.10; // 8% of the screen width for container height

                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: controller
                                                .currentStep.value >=
                                            index
                                        ? const Color.fromRGBO(184, 254, 34, 1)
                                        : Colors.grey,
                                    radius: circleRadius,
                                  ),
                                  SvgPicture.asset(
                                    'assets/step${index + 1}.svg',
                                    width: 14,
                                    height: 14,
                                    color: controller.currentStep.value >= index
                                        ? const Color(0xFF003366)
                                        : Colors.white,
                                  ),
                                ],
                              );
                            }),
                            if (index <
                                2) // Adjusted to only have a divider between the steps
                              Obx(() {
                                bool isStepCompleted =
                                    controller.currentStep.value > index;
                                return SizedBox(
                                  width: deviceWidth *
                                      0.18, // 6% of the screen width for spacing
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
                  SizedBox(
                    width: deviceWidth *
                        0.02, // Adjusted width for proper spacing between steps and the divider
                  ),
                  const SizedBox(
                    height: 25,
                    child: VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                      width: 10,
                    ),
                  ),
                  SizedBox(
                    width: deviceWidth *
                        0.02, // Adjusted width for spacing between the divider and percentage text
                  ),
                  Obx(() {
                    final double deviceWidth =
                        MediaQuery.of(context).size.width;
                    return Transform(
                      transform: Matrix4.skewX(-0.1),
                      child: Text(
                        '${controller.currentPercentage}%',
                        style: TextStyle(
                          fontFamily: 'Barlow Semi Condensed',
                          fontWeight: FontWeight.w700,
                          fontSize: deviceWidth * 0.06,
                          height: 1.2,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  controller.changeStep();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(184, 254, 34, 1),
                  minimumSize: const Size(double.infinity, 40),
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
