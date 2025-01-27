import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.onHamburgerTap,
    required this.onFrameTap,
  });

  final VoidCallback onFrameTap; // Callback to trigger the sliding container
  final VoidCallback
      onHamburgerTap; // Callback to trigger the hamburger visibility

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: deviceHeight * 0.02), // Responsive height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // First element (Icon) - Manually set PNG image
                Container(
                  padding:
                      EdgeInsets.all(deviceWidth * 0.05), // Responsive padding
                  child: InkWell(
                    child: Image.asset(
                      'assets/girl.png', // Manually set PNG icon
                      height: deviceHeight * 0.05,
                      width: deviceWidth * 0.1,
                    ),
                    onTap: () {
                      // Custom logic for this tap (if any)
                    },
                  ),
                ),

                // Title with two rows
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // "Hi John" and "unverified"
                      Row(
                        children: [
                          Text(
                            'Hi John', // First part of the title
                            style: TextStyle(
                              fontSize: deviceWidth * 0.03,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(width: deviceWidth * 0.01),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: deviceHeight * 0.003,
                              horizontal: deviceWidth * 0.02,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xDFB20006),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              'unverified', // Second part of the title
                              style: TextStyle(
                                fontSize: deviceWidth * 0.03,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: deviceHeight * 0.005),

                      // "This is Rablo"
                      Row(
                        children: [
                          Transform(
                            transform: Matrix4.skewX(-0.1),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'This is ',
                                    style: TextStyle(
                                      fontSize: deviceWidth * 0.05,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontFamily: 'Barlow Semi Condensed',
                                      height: 1.2,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Rablo..',
                                    style: TextStyle(
                                      fontSize: deviceWidth * 0.05,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          const Color.fromRGBO(184, 254, 34, 1),
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

                // Frame icon
                Container(
                  padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.03),
                  child: InkWell(
                    child: Image.asset(
                      'assets/Frame.png', // Manually set image
                      height: deviceHeight * 0.04,
                      width: deviceWidth * 0.08,
                    ),
                    onTap:
                        onFrameTap, // Trigger the sliding container visibility when tapped
                  ),
                ),

                // Vector icon (Static icon)
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: deviceHeight * 0.03,
                    horizontal: deviceWidth * 0.06,
                  ),
                  child: InkWell(
                    child: SvgPicture.asset(
                      'assets/Vector.svg',
                      height: deviceHeight * 0.02,
                      width: deviceWidth * 0.06,
                    ),
                    onTap:
                        onHamburgerTap, // Trigger the hamburger toggle when tapped
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
