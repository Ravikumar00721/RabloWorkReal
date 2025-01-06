import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Component3 extends StatelessWidget {
  const Component3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10), // Fixed spacing
        // Divider
        Container(
          width: 390,
          height: 2,
          decoration: BoxDecoration(
            color: const Color(0xFF2F5B6C),
            border: Border.all(
              color: const Color(0xFF2F5B6C),
              width: 2,
            ),
          ),
        ),
        SizedBox(height: 8), // Fixed spacing
        // Parent Container
        Container(
          width: 400,
          height: 150, // Fixed height in pixels
          decoration: const BoxDecoration(
            color: Color.fromARGB(0, 85, 166, 196),
          ),
          child: Row(
            children: [
              // First clickable SVG with blur
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Handle the tap event here for the first image
                    print("First image clicked");
                  },
                  child: Container(
                    child: Center(
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur effect
                          child: SvgPicture.asset(
                            'assets/QuickInfo.svg',
                            width: 255, // Fixed width in pixels
                            height: 180, // Fixed height in pixels
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Add spacing between the two images
              SizedBox(width: 8), // Fixed spacing in pixels
              // Second clickable SVG with blur
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Handle the tap event here for the second image
                    print("Second image clicked");
                  },
                  child: Container(
                    child: Center(
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur effect
                          child: SvgPicture.asset(
                            'assets/QuickInfo.svg',
                            width: 255, // Fixed width in pixels
                            height: 180, // Fixed height in pixels
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
