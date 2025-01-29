import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotiDropdownController extends GetxController {
  // Maps to track highlighted and read/unread states
  final RxMap<String, bool> highlightedFilters = <String, bool>{}.obs;
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

  // Initialize the maps
  NotiDropdownController() {
    for (var filter in timeFilters) {
      highlightedFilters[filter] = false;
      readStates[filter] = false; // Default to unread
    }
  }

  // Handle filter highlight and mark as read
  void highlightFilter(String filter) {
    if (filter == 'All') {
      // Mark all filters as highlighted and read
      for (var key in highlightedFilters.keys) {
        highlightedFilters[key] = true;
        readStates[key] = true;
      }
    } else {
      highlightedFilters[filter] = true;
      readStates[filter] = true;
    }
    update();

    // Reset highlight and read/unread states after 4 seconds
    Timer(const Duration(seconds: 4), () {
      if (filter == 'All') {
        for (var key in highlightedFilters.keys) {
          highlightedFilters[key] = false;
          readStates[key] = false;
        }
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

  // Get border color
  Color getColorProperty(String filter) {
    return highlightedFilters[filter] ?? false
        ? (filter == 'Alert' ? Colors.red : Colors.green)
        : (filter == 'Alert'
            ? const Color.fromRGBO(85, 166, 196, 0.3)
            : const Color.fromRGBO(5, 50, 43, 0.94));
  }

  // Get background color
  Color getBackgroundColor(String filter) {
    return highlightedFilters[filter] ?? false
        ? const Color.fromRGBO(85, 166, 196, 0.3)
        : Colors.transparent;
  }

  // Get CTA1 color
  Color getCta1Color(String filter) {
    return filter == 'Alert'
        ? const Color.fromRGBO(223, 0, 48, 1) // Red for alerts
        : const Color.fromRGBO(184, 254, 34, 1);
  }

  // Get read/unread status
  String getReadState(String filter) {
    return readStates[filter] ?? false ? 'unread' : 'read';
  }

  // Get color for the circular indicator
  Color getColorFilter(String filter) {
    switch (filter) {
      case 'Accounts Update':
      case 'Business Update':
        return const Color.fromRGBO(85, 166, 196, 1);
      case 'Finance and Transaction':
      case 'Memberships Update':
      case 'Customer\'s Update and Reminders':
      case 'Promotion & Offers':
        return const Color.fromRGBO(184, 254, 34, 1);
      case 'Alert':
        return const Color.fromRGBO(223, 0, 48, 1);
      default:
        return Colors.grey;
    }
  }

  // Get color for the SVG icon inside the circular indicator
  Color getSvgIconColor(String filter) {
    return getColorFilter(filter) == const Color.fromRGBO(184, 254, 34, 1)
        ? Colors.black
        : Colors.white;
  }

  // Get text color
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
