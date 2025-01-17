import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget dropdownContent(String timeFilter) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10), // Balanced horizontal padding
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: Color.fromRGBO(22, 48, 58, 1.0), // Blue border color
              width: 0.5,
            ),
          ),
          margin: EdgeInsets.zero, // Removed unnecessary margin
          child: Container(
            width: double.infinity, // Adjusts to parent width
            constraints: const BoxConstraints(
              minHeight: 109, // Ensures the height remains consistent
            ),
            padding: const EdgeInsets.all(
                12), // Consistent padding inside the container
            decoration: BoxDecoration(
              color: Colors.transparent, // Background color set to blue
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container 1
                Container(
                  width: double.infinity,
                  height: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left Circular Body with Icon
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .blue, // Background color of the circular body
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/usercheck.svg', // Replace with your SVG asset path
                                width: 8,
                                height: 8,
                                color: Colors.white, // Set icon color if needed
                              ),
                            ),
                          ),
                          const SizedBox(
                              width: 8), // Space between the circle and text
                          const Text(
                            "Accounts Update - Time",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),

                      // Right-side SVG Icon
                      SvgPicture.asset(
                        'assets/Vector.svg', // Replace with your SVG asset path
                        width: 2,
                        height: 12,
                        color: Colors.white, // Set icon color if needed
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8), // Gap between containers

                // Container 2
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    minHeight: 34,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title Of The Notification",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Poopins',
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Description of the notification",
                        style: TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8), // Gap between containers

                // Container 3
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    minHeight: 23,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left Side Buttons
                      Row(
                        children: [
                          // Button 1
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(184, 254, 34,
                                  1), // Background color of the button
                              borderRadius:
                                  BorderRadius.circular(999), // Circular shape
                            ),
                            child: const Text(
                              'CTA1',
                              style: TextStyle(
                                color: Colors.black, // Text color
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10), // Gap between the buttons
                          // Button 2
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.transparent, // No fill
                              border: Border.all(
                                color: Colors.white, // White border color
                                width: 1.5, // Border width
                              ),
                              borderRadius:
                                  BorderRadius.circular(999), // Circular shape
                            ),
                            child: const Text(
                              'CTA2',
                              style: TextStyle(
                                color: Colors.white, // Text color
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Right Side Text
                      const Text(
                        'Unread',
                        style: TextStyle(
                          color: const Color.fromRGBO(
                              184, 254, 34, 1), // Text color
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
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
    ],
  );
}
