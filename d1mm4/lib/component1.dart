// lib/component1.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  final int currentStep;
  final List<int> stepProgress;
  final List<String> stepIcons;
  final List<String> stepTexts;
  final Function(int) onStepChange;

  const CustomCard({
    Key? key,
    required this.currentStep,
    required this.stepProgress,
    required this.stepIcons,
    required this.stepTexts,
    required this.onStepChange,
  }) : super(key: key);

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
                children: const [
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'You are One-Step Closer to creating your App',
                    style: TextStyle(fontSize: 14, color: Colors.white),
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
                                  onStepChange(index);
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: currentStep >= index
                                          ? const Color.fromRGBO(184, 254, 34, 1)
                                          : Colors.grey,
                                      child: SvgPicture.asset(
                                        stepIcons[index],
                                        width: 14,
                                        height: 14,
                                        color: currentStep >= index
                                            ? const Color(0xFF003366)
                                            : Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (index < 4)
                                Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 8,
                                    height: 6,
                                    color: currentStep > index
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
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        '${stepProgress[currentStep]}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (currentStep < 4) {
                    onStepChange(currentStep + 1);
                  }
                },
                child: Text(
                  stepTexts[currentStep],
                  style: const TextStyle(fontSize: 18),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(184, 254, 34, 1),
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
