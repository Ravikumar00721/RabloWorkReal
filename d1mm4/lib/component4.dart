import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui'; // To use ImageFilter.blur

class Component4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Adjust the blur intensity here
            child: Container(
              width: 344,
              height: 72,
              decoration: BoxDecoration(
                color: const Color(0x1AFFFFFF), // Semi-transparent background
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFF666666), 
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: SvgPicture.asset(
                  'assets/locked.svg',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
