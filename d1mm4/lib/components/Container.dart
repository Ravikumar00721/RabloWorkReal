import 'dart:ui'; // Required for BackdropFilter
import 'package:flutter/material.dart';

class NotificationContainer extends StatefulWidget {
  const NotificationContainer({
    super.key,
    required this.isVisible,
    required this.onBackgroundTap,
  });

  final bool isVisible; // Control visibility from the parent
  final VoidCallback onBackgroundTap;

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<NotificationContainer> {
  @override
  Widget build(BuildContext context) {
    final double notiWidth = MediaQuery.of(context).size.width; // Full screen width
    final double notiHeight = 750; // Notification height
    final double startPosition = -notiHeight; // Hidden above the screen
    final double visiblePosition = 0; // Fully visible at the top of the screen

    return Stack(
      children: [
        if (widget.isVisible)
          GestureDetector(
            onTap: widget.onBackgroundTap, // Close menu on background tap
            child: Container(
              color: Colors.transparent, // Semi-transparent background
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300), // Duration of the animation
          curve: Curves.easeInOut, // Smooth animation curve
          top: widget.isVisible ? visiblePosition : startPosition, // Slide in/out from the top
          left: 0, // Align to the left edge of the screen
          child: Container(
            width: notiWidth,
            height: notiHeight,
            padding: const EdgeInsets.only(
              top: 40,
              right: 8,
              bottom: 20,
              left: 8,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(85, 166, 196, 0.3),
                  ),
                  child: Column(
                    children: [
                      // Header Container
                      Container(
                        margin: const EdgeInsets.only(
                          top: 40,
                          left: 8,
                          right: 8,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Notification",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Barlow Semi Condensed',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Add functionality for "Mark all as read" here
                                print("Mark all as read tapped");
                              },
                              child: const Text(
                                "Mark all as read",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(184, 254, 34, 1),
                                  fontFamily: 'Poppins'
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
