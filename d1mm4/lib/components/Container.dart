import 'package:flutter/material.dart';
import 'dart:ui'; // For BackdropFilter
import 'package:d1mm4/components/app_bar_1.dart'; // Replace with correct path

class SlidingContainerExample extends StatefulWidget {
  @override
  _SlidingContainerExampleState createState() =>
      _SlidingContainerExampleState();
}

class _SlidingContainerExampleState extends State<SlidingContainerExample> {
  double _top = -650; // Initial position outside the screen
  bool _isContainerVisible = false; // Boolean to control visibility

  // Toggle visibility of the sliding container when Frame.svg is clicked
  void _toggleSlidingContainer() {
    setState(() {
      _isContainerVisible = !_isContainerVisible;
      _top = _isContainerVisible ? 200.0 : -650; // 200px from the bottom
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onFrameTap: _toggleSlidingContainer,  // Pass the function as a callback
        onHamburgerTap: () {
          // Add your hamburger menu logic here
        },
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 2), // Duration of the slide animation
            top: _top,
            left: 413,
            child: Container(
              width: 350,
              height: 650,
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                color: Color(0x5575A6C4), // rgba(85, 166, 196, 0.3)
              ),
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: Container(
                      color: Colors.black.withOpacity(0.3), // Apply a subtle background color after blur
                    ),
                  ),
                  Column(
                    children: [
                      // Add your content inside the container here
                      Text(
                        "Sliding Container",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
