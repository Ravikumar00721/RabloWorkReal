import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/welcome_card_controller.dart';

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
                      children: List.generate(5, (index) {
                        return Row(
                          children: [
                            Obx(() {
                              final double deviceWidth =
                                  MediaQuery.of(context).size.width;
                              final double circleRadius = deviceWidth *
                                  0.05; // 5% of the screen width for radius
                              final double containerHeight = deviceWidth *
                                  0.10; // 8% of the screen width for container height

                              if (index == 2) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius:
                                          circleRadius, // Dynamic radius for CircleAvatar
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: containerHeight,
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
                                        Container(
                                          width: 20,
                                          height: containerHeight,
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
                                  radius:
                                      circleRadius, // Dynamic radius for CircleAvatar
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
                            if (index < 4)
                              Obx(() {
                                bool isStepCompleted =
                                    controller.currentStep.value > index;
                                if (index == 2 &&
                                    controller.currentStep.value == 2.5) {
                                  isStepCompleted = false;
                                }
                                return SizedBox(
                                  width: deviceWidth *
                                      0.045, // 6% of the screen width for spacing
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
                  // Adjusted width for proper spacing between steps and the divider
                  SizedBox(
                      width: deviceWidth *
                          0.02), // 3% of the screen width for spacing

                  // Vertical Divider (adjustable thickness)
                  const SizedBox(
                    height: 25,
                    child: VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                      width: 10,
                    ),
                  ),
                  // Adjusted width for spacing between the divider and percentage text
                  SizedBox(
                      width: deviceWidth *
                          0.02), // 3% of the screen width for spacing

                  // Percentage Text (adjust font size dynamically)
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
                          fontSize: deviceWidth *
                              0.06, // 6% of screen width for font size
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
