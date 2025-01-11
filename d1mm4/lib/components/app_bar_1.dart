import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensure space between elements
              children: [
                // Containerized first element (Icon) - Manually set PNG image
                Container(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    child: Image.asset(
                      'assets/girl.png', // Manually set PNG icon
                      height: 40,
                      width: 40,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                // Containerized second element (Title) inside a Column with two rows
                Expanded( // Make the column flexible with respect to available space
                  child: Container(
                    // padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First Row with "Hi John" and "unverified"
                        Row(
                          children: [
                            // First part of the title ("Hi John") aligned to the left
                            Container(
                              // padding: const EdgeInsets.all(20),
                              child: const Text(
                                'Hi John',  // First part of the title
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            const SizedBox(width:5),
                            // Second part of the title ("unverified") with custom styles
                            Container(
                              padding: const EdgeInsets.only(top: 2, right: 4, bottom: 2, left: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xDFB20006),  // Custom background color
                                borderRadius: BorderRadius.circular(999),  // Rounded corners
                              ),
                              child: const Text(
                                'unverified',  // Second part of the title
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2), // Space between the rows

                        // Second Row with "This is Rablo" - Applying the custom color only to "Rablo"
                        Row(
                          children: [
                            Transform(
                              transform: Matrix4.skewX(-0.1),
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'This is ', // First part of the text
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700, // Bold
                                        color: Colors.white,
                                        fontFamily: 'Barlow Semi Condensed', // Custom font
                                        height: 1.2, // Line height (for spacing)
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Rablo..', // Second part (with custom color)
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700, // Bold
                                        color: Color.fromRGBO(184, 254, 34, 1), // Custom color
                                        fontFamily: 'Barlow Semi Condensed', // Custom font
                                        height: 1.2, // Line height (for spacing)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Containerized third element (Empty space for spacing)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: InkWell(
                    child: Image.asset(
                      'assets/Frame.png',  // Manually set image
                      height: 32,
                      width: 32,
                    ),
                  ),
                ),

                // Containerized Vector icon (Static icon) - Manually set vector icon
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  child: InkWell(
                    child: Image.asset(
                      'assets/Vector.png', // Static PNG icon (replace with your actual asset path)
                      height: 16,
                      width: 24,
                    ),
                    onTap: () {
                      // Action when Vector icon is tapped
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
