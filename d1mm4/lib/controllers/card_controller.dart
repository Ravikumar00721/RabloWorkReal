import 'package:get/get.dart';

class CardController extends GetxController {
  // Observables for step data
  var currentStep = 0.obs;

  // Updated stepProgress for 8 steps
  var stepProgress = [20, 40, 60, 80, 100].obs; // Just as an example, adjust as needed

  // Updated step texts for 8 steps
  var stepTexts = [
    "Complete Your Profile",
    "Verify Yourself",
    "Complete Verification",
    "Create Your Plan",
    "Create Website"
  ].obs;

  // Method to change step and handle navigation
  void changeStep() {
    if (currentStep.value < 4) {
      currentStep.value++;
      handleNavigation();
    } else {
      // Reset to the first step after completing all steps
      currentStep.value = 0;
    }
  }

  // Navigation logic for odd steps
  void handleNavigation() {
    // Navigate based on odd steps
    if (currentStep.value == 1) {
      // Navigate to Business Account page when the step is 1
      Get.toNamed('/business-account');
    } else if (currentStep.value == 2) {
      // Navigate to Verification page when the step is 3
      Get.toNamed('/verification');
    } else if (currentStep.value == 3) {
      // Navigate to some other page on step 5 (you can define your own routing)
      Get.toNamed('/step4');
    } else if (currentStep.value == 4) {
      // Navigate to the final step page or summary page when step 7
      Get.toNamed('/step5');
    }
  }

  // Get the current progress percentage
  int get currentPercentage => stepProgress[currentStep.value];

  // Get the current button text
  String get currentButtonText => stepTexts[currentStep.value];
}
