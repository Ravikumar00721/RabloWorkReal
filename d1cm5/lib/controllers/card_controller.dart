import 'package:get/get.dart';

class CardController extends GetxController {
  var currentStep = 0.obs; // Current step as an integer

  var stepProgress = [20, 60, 100].obs; // Progress values for 3 steps

  var stepTexts = [
    "Connect Your Business",
    "Join The Memberships",
    "Scan Your First Session",
  ].obs;

  // Change step with increments, ensuring it does not exceed 3
  void changeStep() {
    if (currentStep.value >= 2) {
      print("Already at the last step, no further action needed.");
      return;
    }

    currentStep.value++;
    print("Current Step Value: ${currentStep.value}");
    handleNavigation();
  }

  // Handle navigation logic based on current step value
  void handleNavigation() {
    if (currentStep.value == 1) {
      Get.toNamed('/scan-join');
    } else if (currentStep.value == 2) {
      Get.toNamed('/my-plan');
    } else if (currentStep.value == 3) {
      print("Navigation complete, staying on the last step.");
    }
  }

  // Get current step progress percentage based on point value
  int get currentPercentage => stepProgress[currentStep.value];

  // Get button text based on current step value
  String get currentButtonText => stepTexts[currentStep.value];
}
