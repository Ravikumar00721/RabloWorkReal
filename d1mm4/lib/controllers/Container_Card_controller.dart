import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownController extends GetxController {
  // Map to track the highlighted state for each filter
  final RxMap<String, bool> highlightedFilters = <String, bool>{}.obs;

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

  // Constructor to initialize the highlightedFilters map for each filter
  DropdownController() {
    for (var filter in timeFilters) {
      highlightedFilters[filter] = false;
    }
  }

  // Method to highlight a filter
  void highlightFilter(String filter) {
    highlightedFilters[filter] = true;
    update(); // Notify listeners

    // Reset the highlight after 4 seconds
    Timer(const Duration(seconds: 4), () {
      highlightedFilters[filter] = false;
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
    if (highlightedFilters[filter] ?? false) {
      return Colors.green; // Highlighted border color
    }
    return const Color.fromRGBO(5, 50, 43, 0.9411764705882353);
  }

  // Get the background color based on whether the filter is highlighted
  Color getBackgroundColor(String filter) {
    if (highlightedFilters[filter] ?? false) {
      return const Color.fromRGBO(
          2, 179, 243, 0.9411764705882353); // Highlighted background color
    }
    return Colors.transparent;
  }
}
