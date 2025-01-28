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

  void highlightFilter(String filter) {
    if (filter == 'All') {
      // Mark all filters as highlighted and read
      highlightedFilters.forEach((key, value) {
        highlightedFilters[key] = true;
        readStates[key] = true;
      });
    } else {
      highlightedFilters[filter] = true;
      readStates[filter] = true;
    }
    update();

    // Reset highlight and read/unread states after 4 seconds
    Timer(const Duration(seconds: 4), () {
      if (filter == 'All') {
        highlightedFilters.forEach((key, value) {
          highlightedFilters[key] = false;
          readStates[key] = false;
        });
      } else {
        highlightedFilters[filter] = false;
        readStates[filter] = false;
      }
      update();
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
      return highlightedFilters[filter]!
          ? const Color.fromRGBO(85, 166, 196, 0.3)
          : Colors.transparent; // Always red for "Alert"
    }
    return highlightedFilters[filter]!
        ? const Color.fromRGBO(85, 166, 196, 0.3)
        : Colors.transparent;
  }

  // Get the CTA1 color for a specific filter
  Color getCta1Color(String filter) {
    if (filter == 'Alert') {
      return Color.fromRGBO(223, 0, 48, 1); // Always red for "Alert"
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
        return Color.fromRGBO(85, 166, 196, 1);
      case 'Finance and Transaction':
      case 'Memberships Update':
      case 'Customer\'s Update and Reminders':
      case 'Promotion & Offers':
        return const Color.fromRGBO(184, 254, 34, 1);
      case 'Alert':
        return Color.fromRGBO(223, 0, 48, 1);
      default:
        return Colors.grey;
    }
  }

  Color getNameColor(String filter) {
    switch (filter) {
      case 'Finance and Transaction':
      case 'Memberships Update':
      case 'Customer\'s Update and Reminders':
        return const Color.fromRGBO(184, 254, 34, 1);
      case 'Promotion & Offers':
      case 'Alert':
      case 'Accounts Update':
      case 'Business Update':
        return Colors.white;
      default:
        return Colors.grey;
    }
  }
}
