
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Container.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.onFrameTap, required this.onHamburgerTap});

  final VoidCallback onFrameTap; // Callback to trigger the sliding container
  final VoidCallback onHamburgerTap; // Callback to trigger the hamburger visibility

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // First element (Icon) - Manually set PNG image
                Container(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    child: Image.asset(
                      'assets/girl.png', // Manually set PNG icon
                      height: 40,
                      width: 40,
                    ),
                    onTap: () {
                      // Custom logic for this tap (if any)
                    },
                  ),
                ),

                // Title with two rows
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // "Hi John" and "unverified"
                        Row(
                          children: [
                            Container(
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
                            const SizedBox(width: 5),
                            Container(
                              padding: const EdgeInsets.only(top: 2, right: 4, bottom: 2, left: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xDFB20006),
                                borderRadius: BorderRadius.circular(999),
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
                        const SizedBox(height: 2),

                        // "This is Rablo"
                        Row(
                          children: [
                            Transform(
                              transform: Matrix4.skewX(-0.1),
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'This is ',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontFamily: 'Barlow Semi Condensed',
                                        height: 1.2,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Rablo..',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(184, 254, 34, 1),
                                        fontFamily: 'Barlow Semi Condensed',
                                        height: 1.2,
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

                // Empty space
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: InkWell(
                    child: Image.asset(
                      'assets/Frame.png',  // Manually set image
                      height: 32,
                      width: 32,
                    ),
                    onTap: () {
                      SlidingContainerExample();
                    }, // Trigger the sliding container visibility when tapped
                  ),
                ),

                // Vector icon (Static icon)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  child: InkWell(
                    child: SvgPicture.asset(
                      'assets/Vector.svg',
                      height: 16,
                      width: 24,
                    ),
                    onTap: onHamburgerTap, // Trigger the hamburger toggle when tapped
                  ),
                )
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
