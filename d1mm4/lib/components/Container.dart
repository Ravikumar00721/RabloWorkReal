import 'dart:ui'; // Required for BackdropFilter

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ContainerItem.dart';

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
  int _selectedItemIndex = -1; // Track the selected item index

  @override
  Widget build(BuildContext context) {
    final double notiWidth =
        MediaQuery.of(context).size.width; // Full screen width
    final double notiHeight = 750; // Notification height
    final double startPosition = -notiHeight; // Hidden above the screen
    final double visiblePosition = 0; // Fully visible at the top of the screen

    // List of labels for the filter items
    final List<String> filterLabels = [
      'All',
      'Accounts Update',
      'Memberships Update',
      'Finance and Transaction',
      'Customer\'s Update and Reminders',
      'Promotion & Offers',
      'Alert'
    ];

    return Stack(
      children: [
        if (widget.isVisible)
          GestureDetector(
            onTap: widget.onBackgroundTap, // Close menu on background tap
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          top: widget.isVisible ? visiblePosition : startPosition,
          left: 0,
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
                      // Header
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
                              "Notifications",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Barlow Semi Condensed',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("Mark all as read tapped");
                              },
                              child: const Text(
                                "Mark all as read",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(184, 254, 34, 1),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Filter Row
                      Container(
                        height: 49,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: SvgPicture.asset(
                                'assets/Pc.svg',
                                color: Colors.white,
                                width: 17,
                                height: 16,
                              ),
                            ),
                            const SizedBox(width: 3),
                            const SizedBox(
                              height: 15,
                              child: VerticalDivider(
                                color: Colors.white,
                                thickness: 1,
                                width: 10,
                              ),
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              "Filter by",
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 7),
                            Container(
                              width: 295,
                              height: 49,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(85, 166, 196, 0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 5,
                              ),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: filterLabels.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedItemIndex = index;
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 5),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 8),
                                          decoration: BoxDecoration(
                                            color: _selectedItemIndex == index
                                                ? Colors.white
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            filterLabels[index],
                                            style: TextStyle(
                                              color: _selectedItemIndex == index
                                                  ? const Color.fromARGB(
                                                      255, 11, 11, 62)
                                                  : Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (index < filterLabels.length - 1)
                                        const SizedBox(
                                          height: 25,
                                          child: VerticalDivider(
                                            color: Colors.black,
                                            thickness: 1,
                                            width: 10,
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Time Filters
                      const Expanded(
                        child:
                            TimeFilters(), // Pass selected filter to TimeFilters
                      ),
                      Container(
                        width: 53,
                        height: 2,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2F5B6C),
                          border: Border.all(
                            color: const Color(0xFF2F5B6C),
                            width: 2,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
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
