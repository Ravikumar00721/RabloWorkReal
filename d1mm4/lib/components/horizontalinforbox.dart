import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Component4 extends StatelessWidget {
  const Component4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10), // Fixed spacing (10 pixels)
        GestureDetector(
          onTap: () {
            // Handle the click event here
            print("SVG clicked!");
            // You can navigate or perform other actions as needed
          },
          child: Container(
            width: 370, // Set the width here (370 pixels)
            child: SvgPicture.asset(
              'assets/HorizontalInforBox.svg',
              height: 80, // Fixed height (80 pixels)
              fit: BoxFit.contain, // Ensures proper scaling
            ),
          ),
        ),
        SizedBox(height: 10), // Fixed spacing (10 pixels)
      ],
    );
  }
}
