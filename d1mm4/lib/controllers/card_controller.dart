import 'package:get/get.dart';

class CardController extends GetxController {
  var currentStep = 0.obs;

  var stepProgress = [20, 40, 60, 80, 100].obs; // Just as an example, adjust as needed

  var stepTexts = [
    "Complete Your Profile",
    "Verify Yourself",
    "Complete Verification",
    "Create Your Plan",
    "Create Website"
  ].obs;

  void changeStep() {
    if (currentStep.value < 4) {
      currentStep.value++;
      print("Current Value: ${currentStep.value}");
      handleNavigation();
    } else {
      // Do nothing when the last step is reached
      print("Reached the final step. No further progression.");
    }
  }

  void handleNavigation() {
    if (currentStep.value == 1) {
      Get.toNamed('/business-account');
    } else if (currentStep.value == 2) {
      Get.toNamed('/verification');
    } else if (currentStep.value == 3) {
      Get.toNamed('/step4');
    } else if (currentStep.value == 4) {
      Get.toNamed('/step5');
    }
  }

  int get currentPercentage => stepProgress[currentStep.value];

  String get currentButtonText => stepTexts[currentStep.value];
}
