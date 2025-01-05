import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';

class Component4 extends StatelessWidget {
  const Component4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 7), // Fixed spacing (10 pixels)
        GestureDetector(
          onTap: () {
            // Handle the click event here
            print("SVG clicked!");
            // You can navigate or perform other actions as needed
          },
          child: Container(
            width: 365, // Set the width here (370 pixels)
            child: Stack(
              children: [
                // SVG image with blur effect
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // 50% blur effect
                    child: SvgPicture.asset(
                      'assets/HorizontalInforBox.svg',
                      height: 80, // Fixed height (80 pixels)
                      fit: BoxFit.contain, 
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 304, // 90% of the screen width
          height: 2,
          decoration: BoxDecoration(
            color: const Color(0xFF2F5B6C),
            border: Border.all(
              color: const Color(0xFF2F5B6C),
              width: 2,
            ),
          ),
        ), // Fixed spacing (10 pixels)
      ],
    );
  }
}
