import 'package:get/get.dart';

class CardController extends GetxController {
  // Observables for step data
  var currentStep = 0.obs;
  var stepProgress = [20, 40, 60, 80, 100].obs;
  var stepTexts = [
    "Complete Your Profile",
    "Verify yourself",
    "Complete verification",
    "Create your plan",
    "Create website"
  ].obs;

  // Method to change step
  void changeStep(int step) {
    if (step >= 0 && step <= 4) {
      currentStep.value = step;
    }
  }

  // Get the current progress percentage
  int get currentPercentage => stepProgress[currentStep.value];

  // Get the current button text
  String get currentButtonText => stepTexts[currentStep.value];
}
