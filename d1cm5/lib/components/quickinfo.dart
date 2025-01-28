import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Component3 extends StatelessWidget {
  const Component3({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: 10), // 10px fixed margin for top spacing
        // Divider
        Container(
          width: deviceWidth * 0.9, // 90% of device width
          height: 2,
          decoration: BoxDecoration(
            color: const Color(0xFF2F5B6C),
            border: Border.all(
              color: const Color(0xFF2F5B6C),
              width: 2,
            ),
          ),
        ),
        // Parent Container with slightly reduced height
        Container(
          width: deviceWidth * 1.0, // Full width of the device
          height: deviceHeight * 0.18, // Reduced height (18% of device height)
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
                          filter: ImageFilter.blur(
                              sigmaX: 5.0, sigmaY: 5.0), // Reduced blur effect
                          child: SvgPicture.asset(
                            'assets/QuickInfo.svg',
                            width: deviceWidth * 0.6, // 60% of device width
                            height: deviceHeight *
                                0.22, // Adjusted height for the first image
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Add spacing between the two images
              SizedBox(
                  width: deviceWidth * 0.02), // 2% of device width for spacing
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
                          filter: ImageFilter.blur(
                              sigmaX: 5.0, sigmaY: 5.0), // Reduced blur effect
                          child: SvgPicture.asset(
                            'assets/QuickInfo.svg',
                            width: deviceWidth * 0.6, // 60% of device width
                            height: deviceHeight *
                                0.22, // Adjusted height for the second image
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
