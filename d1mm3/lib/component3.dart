import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui'; // To use ImageFilter.blur

class Component3 extends StatelessWidget {
  const Component3({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the device's dimensions
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: deviceHeight * 0.01), // 1% of screen height
        // This is Divider
        Container(
          width: deviceWidth * 0.9, // 90% of the screen width
          height: 2,
          decoration: BoxDecoration(
            color: const Color(0xFF2F5B6C),
            border: Border.all(
              color: const Color(0xFF2F5B6C),
              width: 2,
            ),
          ),
        ),
        SizedBox(height: deviceHeight * 0.01), // 1% of screen height
        // Parent Container
        Container(
          width: deviceWidth * 0.9, // 90% of the screen width
          height: deviceHeight * 0.15, // 15% of the screen height
          decoration: const BoxDecoration(
            color: Color.fromARGB(0, 85, 166, 196),
          ),
          child: Row(
            children: [
              // First container with background blur
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      margin: EdgeInsets.only(right: deviceWidth * 0.02), // 2% of screen width
                      decoration: BoxDecoration(
                        color: const Color(0x1AFFFFFF),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF666666),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/locked.svg',
                          width: deviceWidth * 0.06, // 6% of screen width
                          height: deviceWidth * 0.06, // 6% of screen width
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Second container with background blur
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      margin: EdgeInsets.only(left: deviceWidth * 0.02), // 2% of screen width
                      decoration: BoxDecoration(
                        color: const Color(0x1AFFFFFF),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF666666),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/locked.svg',
                          width: deviceWidth * 0.06, // 6% of screen width
                          height: deviceWidth * 0.06, // 6% of screen width
                          color: Colors.white,
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
