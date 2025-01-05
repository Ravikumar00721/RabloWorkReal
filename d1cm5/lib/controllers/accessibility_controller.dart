import 'package:get/get.dart';

class AccessibilityController extends GetxController {
  // Observable list to track the enabled state of each icon (true = enabled, false = locked)
  var isEnabled = [false, false, false, false].obs;

  // Function to toggle the state of an individual icon
  void toggleIcon(int index) {
    // Toggle the enabled state for the clicked item
    isEnabled[index] = !isEnabled[index];

    // Print the state to the console for debugging
    print("Toggled index: $index, New state: ${isEnabled[index]}");
  }

  // Function to get the correct icon path based on the enabled state
  String getIconPath(int index) {
    if (isEnabled[index]) {
      switch (index) {
        case 0:
          return 'assets/exchange.svg';
        case 1:
          return 'assets/helpandsupport.svg';
        case 2:
          return 'assets/step3.svg';
        case 3:
          return 'assets/Members.svg';
        default:
          return 'assets/locked.svg';
      }
    }
    return 'assets/locked.svg'; // Return locked state icon if not enabled
  }
}
