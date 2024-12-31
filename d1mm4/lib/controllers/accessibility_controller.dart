import 'package:get/get.dart';

class AccessibilityController extends GetxController {
  // Observable list to track the enabled state of each icon
  var isEnabled = [false, false, false, false].obs;

  // Function to toggle the state of an icon
  void toggleIcon(int index) {
    isEnabled[index] = !isEnabled[index];
  }
}
