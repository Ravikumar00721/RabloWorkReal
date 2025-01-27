import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Component4 extends StatelessWidget {
  const Component4({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the device width and height using MediaQuery
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Handle the click event here
            print("SVG clicked!");
            // You can navigate or perform other actions as needed
          },
          child: Container(
            width: deviceWidth, // Full width of the screen
            child: ClipRRect(
              child: BackdropFilter(
                filter:
                    ImageFilter.blur(sigmaX: 10, sigmaY: 10), // 50% blur effect
                child: SvgPicture.asset(
                  'assets/HorizontalInforBox.svg',
                  height: deviceHeight *
                      0.1, // 10% of screen height for the SVG height
                  width: deviceWidth *
                      0.9, // 90% of screen width for the SVG width
                  // fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
            height: deviceHeight * 0.01), // 1% of screen height for spacing
        Container(
          width: deviceWidth * 0.85, // 85% of the screen width
          height: 2,
          decoration: BoxDecoration(
            color: const Color(0xFF2F5B6C),
            border: Border.all(
              color: const Color(0xFF2F5B6C),
              width: 2,
            ),
          ),
        ),
      ],
    );
  }
}
