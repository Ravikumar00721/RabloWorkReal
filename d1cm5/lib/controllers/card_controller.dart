import 'package:get/get.dart';

class CardController extends GetxController {
  // Observables for step data
  var currentStep = 0.obs;
  var stepProgress = [20, 60, 100].obs; // Updated progress percentages
  var stepTexts = [
    "Connect Your Buisness",
    "Join The Membership",
    "Scan Your First Session"
  ].obs; // Updated steps for 3 stages

  // Method to change step
  void changeStep(int step) {
    if (step >= 0 && step <= 2) { // Adjusted for 3 steps
      currentStep.value = step;
    }
  }

  // Get the current progress percentage
  int get currentPercentage => stepProgress[currentStep.value];

  // Get the current button text
  String get currentButtonText => stepTexts[currentStep.value];
}
