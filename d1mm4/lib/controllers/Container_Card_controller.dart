import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownController extends GetxController {
  // Map to track the highlighted state for each filter
  final RxMap<String, bool> highlightedFilters = <String, bool>{}.obs;

  // Map to track the read/unread state for each filter
  final RxMap<String, bool> readStates = <String, bool>{}.obs;

  // List of time filters
  final List<String> timeFilters = [
    'Accounts Update',
    'Business Update',
    'Memberships Update',
    'Finance and Transaction',
    'Customer\'s Update and Reminders',
    'Promotion & Offers',
    'Alert',
  ];

  // Constructor to initialize the highlightedFilters and readStates map for each filter
  DropdownController() {
    for (var filter in timeFilters) {
      highlightedFilters[filter] = false;
      readStates[filter] = false; // Default to unread
    }
  }

  // Method to highlight a filter
  void highlightFilter(String filter) {
    highlightedFilters[filter] = true; // Highlight card
    readStates[filter] = true; // Mark as read
    update(); // Notify listeners

    // Reset the highlight and read/unread state after 4 seconds
    Timer(const Duration(seconds: 4), () {
      highlightedFilters[filter] = false; // Remove highlight
      readStates[filter] = false; // Mark as unread again
      update(); // Notify listeners
    });
  }

  // Get the SVG icon path for a specific filter
  String getSvgIcon(String filter) {
    switch (filter) {
      case 'Accounts Update':
        return 'assets/usercheck.svg';
      case 'Business Update':
        return 'assets/usercheck.svg';
      case 'Memberships Update':
        return 'assets/profession.svg';
      case 'Finance and Transaction':
        return 'assets/exchange.svg';
      case 'Customer\'s Update and Reminders':
        return 'assets/Members.svg';
      case 'Promotion & Offers':
        return 'assets/step4.svg';
      case 'Alert':
        return 'assets/warning.svg';
      default:
        return 'assets/usercheck.svg';
    }
  }

  // Get the border color based on whether the filter is highlighted
  Color getColorProperty(String filter) {
    if (filter == 'Alert') {
      return highlightedFilters[filter]!
          ? Colors.red
          : const Color.fromRGBO(85, 166, 196, 0.3); // Green for highlight
    }
    return highlightedFilters[filter]!
        ? Colors.green
        : const Color.fromRGBO(5, 50, 43, 0.94);
  }

  // Get the background color based on whether the filter is highlighted
  Color getBackgroundColor(String filter) {
    if (filter == 'Alert') {
      return Colors.transparent; // Always red for "Alert"
    }
    return highlightedFilters[filter]!
        ? const Color.fromRGBO(85, 166, 196, 0.3)
        : Colors.transparent;
  }

  // Get the CTA1 color for a specific filter
  Color getCta1Color(String filter) {
    if (filter == 'Alert') {
      return Colors.red; // Always red for "Alert"
    }
    return const Color.fromRGBO(184, 254, 34, 1); // Default CTA1 color
  }

  // Get the read/unread text for a filter
  String getReadState(String filter) {
    return readStates[filter]! ? 'unread' : 'read';
  }

  // Get the color for the circular indicator
  Color getColorFilter(String filter) {
    switch (filter) {
      case 'Accounts Update':
      case 'Business Update':
        return Colors.blue;
      case 'Finance and Transaction':
      case 'Memberships Update':
      case 'Customer\'s Update and Reminders':
      case 'Promotion & Offers':
        return Colors.green;
      case 'Alert':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
