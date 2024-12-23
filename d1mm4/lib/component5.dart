import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Component5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 304, // Reduced width by 20px (344px - 20px = 304px)
          height: 2, // Height of the divider (just a line)
          decoration: BoxDecoration(
            color: const Color(0xFF2F5B6C), // Primary Blue (Dark) color
            border: Border.all(
              color: const Color(0xFF2F5B6C), // Border color
              width: 2, // Border width
            ),
          ),
        ),
        const SizedBox(height: 30), // Gap between containers
        Stack(
          clipBehavior: Clip.none, // Ensures elements outside are visible
          children: [
            Container(
              width: 280, // Fixed width
              height: 50, // Height
              decoration: BoxDecoration(
                color: const Color(0xFF2F5B6C), // Background color
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40), // Padding left and right
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/homeyes.svg',
                    width: 24,
                    height: 24,
                    color: const Color.fromRGBO(184, 254, 34, 1), // Updated color
                  ),
                  const SizedBox(width: 24), // Placeholder for the middle icon
                  SvgPicture.asset(
                    'assets/personno.svg',
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -20, // Adjusted to align the circular boundary
              left: 120, // Centers the icon horizontally
              child: Container(
                width: 50, // Size of the circular boundary
                height: 50,
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
                    width: 24,
                    height: 24,
                    color: Colors.white,
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
