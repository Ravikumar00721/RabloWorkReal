import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'scanning_unavailable.dart';

class Component5 extends StatelessWidget {
  const Component5({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none, // Ensures elements outside are visible
          children: [
            Container(
              width: deviceWidth * 0.7, // Reduced to 70% of the screen width
              height: deviceHeight * 0.06, // Reduced to 6% of the screen height
              decoration: BoxDecoration(
                color: const Color(0xFF2F5B6C), // Background color
                borderRadius: BorderRadius.circular(
                    12), // Slightly smaller rounded corners
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth *
                      0.08), // Reduced padding to 8% on left and right
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Action for the first icon
                      debugPrint("HomeYes icon clicked");
                    },
                    child: SvgPicture.asset(
                      'assets/homeyes.svg',
                      width: deviceWidth *
                          0.07, // Reduced to 7% of the screen width
                      height: deviceWidth *
                          0.07, // Reduced to 7% of the screen width
                      color: const Color.fromRGBO(
                          184, 254, 34, 1), // Updated color
                    ),
                  ),
                  const SizedBox(
                      width: 30), // Reduced the space between the icons
                  GestureDetector(
                    onTap: () {
                      // Action for the second icon
                      debugPrint("PersonNo icon clicked");
                    },
                    child: SvgPicture.asset(
                      'assets/personno.svg',
                      width: deviceWidth *
                          0.07, // Reduced to 7% of the screen width
                      height: deviceWidth *
                          0.07, // Reduced to 7% of the screen width
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -(deviceHeight *
                  0.04), // Adjusted to align the larger circle slightly above
              left: (deviceWidth * 0.7 - deviceWidth * 0.16) /
                  2, // Adjusted to center the circular button
              child: GestureDetector(
                onTap: () {
                  // Action for the circular icon, show the ExitDialog when clicked
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ScanningUnavailable(); // Show ExitDialog
                    },
                  );
                },
                child: Container(
                  width: deviceWidth *
                      0.16, // Reduced to 16% of the screen width for the circular boundary
                  height:
                      deviceWidth * 0.16, // Reduced to 16% of the screen width
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF2F5B6C), // Blue boundary color
                      width: 3, // Thickness of the boundary
                    ),
                    color: const Color(0xFF063434), // Background color
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icon.svg',
                      width: deviceWidth *
                          0.09, // Reduced icon size to 9% of screen width
                      height: deviceWidth *
                          0.09, // Reduced icon size to 9% of screen width
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
