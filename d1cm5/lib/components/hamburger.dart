import 'package:flutter/material.dart';

class Hamburger extends StatefulWidget {
  const Hamburger({
    super.key,
    required this.isVisible,
    required this.onBackgroundTap,
  });

  final bool isVisible; // Control visibility from the parent
  final VoidCallback onBackgroundTap; // Function to hide the hamburger

  @override
  _HamburgerState createState() => _HamburgerState();
}

class _HamburgerState extends State<Hamburger> {
  @override
  Widget build(BuildContext context) {
    final List<String> containerTexts = [
      "Membership",
      "Gym Tour",
      "Schedule",
      "Check-ins",
      "Payments",
      "Help and Support",
      "Settings"
    ];

    final double menuWidth = 200; // Width of the menu
    final double menuHeight = 322; // Height of the menu
    final double appBarHeight = 119; // Top padding for positioning

    return Stack(
      children: [
        // Background overlay that only appears when the menu is visible
        if (widget.isVisible)
          GestureDetector(
            onTap: widget.onBackgroundTap, // Close menu on background tap
            child: Container(
              color: Colors.transparent, // Semi-transparent background
              width: double.infinity,
              height: double.infinity,
            ),
          ),

        // Hamburger menu with sliding effect
        AnimatedPositioned(
          duration:
              const Duration(milliseconds: 300), // Duration of the animation
          curve: Curves.easeInOut, // Smooth animation curve
          top: appBarHeight,
          right: widget.isVisible
              ? 20
              : -menuWidth, // Slide in/out based on visibility
          child: Container(
            width: menuWidth,
            height: menuHeight,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(6, 52, 52, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.only(
              top: 35,
              right: 8,
              bottom: 40,
              left: 8,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: containerTexts.map((text) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      width: double.infinity,
                      height: 26,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromRGBO(184, 254, 34, 1),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          text,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 21 / 14,
                            color: Color.fromRGBO(184, 254, 34, 1),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
