import 'package:get/get.dart';

class AppBarController extends GetxController {
  RxString appBarTitle = 'Home'.obs;
  RxMap appBarIconAndImage = {}.obs;

  // Add a parameter to toggle assets based on the page (HomePage or not)
  void toggleAppBarAssets({bool isHomePage = false}) {
    if (isHomePage) {
      // Handle the else part when we're on the HomePage
      appBarTitle.value = 'Home Page';  // For example
      appBarIconAndImage.value = {
        'icon': 'assets/girl.png',  // Example of an icon for the HomePage
        'image': 'assets/Frame.png'  // Example of an image for the HomePage
      };
    } else {
      // Handle the if part for other pages (adjust accordingly)
      appBarTitle.value = 'Other Page';
      appBarIconAndImage.value = {
        'icon': 'assets/Hamburger.svg',
        'image': 'assets/Frame.png'
      };
    }
  }
}

