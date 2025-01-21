import 'package:get/get.dart';

class CardController extends GetxController {
  var currentStep =
      0.0.obs; // The current step is a double to allow fractional values

  var stepProgress = [20, 40, 60, 80, 100].obs; // Example progress values

  var stepTexts = [
    "Complete Your Profile",
    "Verify Yourself",
    "Complete Verification",
    "Create Your Plan",
    "Create Website"
  ].obs;

  // Change step with conditional increments based on current value
  void changeStep() {
    if (currentStep.value == 2) {
      currentStep.value += 0.5; // Increment by 0.5 if current step is 2
    } else if (currentStep.value == 2.5) {
      currentStep.value += 0.5; // Increment by 1 if current step is 3
    } else if (currentStep.value == 4) {
      currentStep.value += 1;
    } else {
      currentStep.value += 1;
    }
    print("Current Value: ${currentStep.value}");
    handleNavigation();
  }

  // Handle navigation logic based on current step value
  void handleNavigation() {
    if (currentStep.value == 1) {
      Get.toNamed('/business-account');
    } else if (currentStep.value == 2) {
      Get.toNamed('/verification');
    } else if (currentStep.value == 2.5) {
      Get.toNamed('/kyc'); // Intermediate step for KYC
    } else if (currentStep.value == 3) {
      Get.toNamed('/step4');
    } else if (currentStep.value == 4) {
      Get.toNamed('/step5');
    }
  }

  // Get current step progress percentage based on point value
  int get currentPercentage => stepProgress[(currentStep.value.toInt())];

  // Get button text based on current step value
  String get currentButtonText => stepTexts[(currentStep.value.toInt())];
}
