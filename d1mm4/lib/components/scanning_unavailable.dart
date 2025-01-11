import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import for SVG support

class ScanningUnavailable extends StatelessWidget {
  const ScanningUnavailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.fromLTRB(20, 40, 20, 100),
      backgroundColor: const Color(0xFF2F5B6C),  // Background color for the dialog
      child: Container(
        width: 350,
        height: 337,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Vertically center content
          crossAxisAlignment: CrossAxisAlignment.center, // Center align horizontally
          children: [
            // Warning icon inside a circular container
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(244, 223, 9, 39),  // Custom background color
                  shape: BoxShape.circle,  // Circle shape
                ),
                child: SvgPicture.asset(
                  'assets/warning.svg',  // Path to your warning SVG file
                  width: 20,  // Icon width
                  height: 18,  // Icon height
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Title Text
            Transform(
              transform: Matrix4.skewX(-0.1),  // Skew effect to simulate italic-like slant
              child: const Text(
                'Profile Incomplete!',
                style: TextStyle(
                  fontFamily: 'Barlow Semi Condensed',  // Custom font
                  fontWeight: FontWeight.w700,  // Bold weight
                  fontSize: 25,  // Font size
                  height: 1.2,  // Line height
                  color: Colors.white,  // Text color
                ),
                textAlign: TextAlign.center,  // Center alignment
              ),
            ),
            const SizedBox(height: 10),
            // Explanation Text
            Text(
              'You Haven’t Completed necessary step to access this feature. Please complete your profile.',
              style: TextStyle(fontSize: 14, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Buttons for Continue and Confirm
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Continue Button as ElevatedButton
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);  // Close the dialog
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(72, 45), // Same width and height for both buttons
                    backgroundColor: Colors.transparent,  // Transparent background
                    side: const BorderSide(color: Colors.white, width: 2), // Border color and width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),  // Rounded corners
                    ),
                    padding: const EdgeInsets.all(10),  // Padding inside button
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.white), // White text color
                  ),
                ),
                const SizedBox(width: 10),
                // Confirm Button as Filled Button (Red and White Combo)
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);  // Close the dialog and exit
                    // Perform the desired action, e.g., exit the form
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size(138, 45), // Same width and height for both buttons
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFFDF0030),  // White text color, Red background
                    padding: const EdgeInsets.all(10),  // Padding inside button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),  // Rounded corners
                    ),
                  ),
                  child: const Text(
                    'Back To Home',
                    style: TextStyle(color: Colors.white), // White text color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
