import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui'; // To use ImageFilter.blur

class Component4 extends StatelessWidget {
  const Component4({super.key});

  @override
  Widget build(BuildContext context) {
    // Get device dimensions
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: deviceHeight * 0.01), // 1% of screen height
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: deviceWidth * 0.9, // 90% of screen width
              height: deviceHeight * 0.09, // 9% of screen height
              decoration: BoxDecoration(
                color: const Color(0x1AFFFFFF),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFF666666),
                  width: 2,
                ),
              ),
              padding: EdgeInsets.all(deviceWidth * 0.03), // 3% of screen width
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
        SizedBox(height: deviceHeight * 0.01), // 1% of screen height
      ],
    );
  }
}
