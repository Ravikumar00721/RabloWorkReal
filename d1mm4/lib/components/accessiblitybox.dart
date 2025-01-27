import 'package:d1mm4/controllers/accessibility_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Component2 extends StatelessWidget {
  // Instantiate the AccessibilityController
  final AccessibilityController controller = Get.put(AccessibilityController());

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth, // Use full device width
      height: deviceHeight * 0.1, // Use a fraction of the device height
      decoration: BoxDecoration(
        color: const Color(0xFF2F5B6C),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: deviceWidth * 0.02,
            vertical: deviceHeight * 0.02), // Make padding responsive
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildItem(
              context: context,
              index: 0,
              text: 'My Website',
            ),
            _buildItem(
              context: context,
              index: 1,
              text: 'My Transactions',
            ),
            _buildItem(
              context: context,
              index: 2,
              text: 'Membership',
            ),
            _buildItem(
              context: context,
              index: 3,
              text: 'Members',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required BuildContext context,
    required int index,
    required String text,
  }) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double itemWidth =
        deviceWidth * 0.2; // Use responsive width for each item
    final double itemHeight =
        deviceWidth * 0.12; // Adjust height based on width for better scaling

    return GestureDetector(
      onTap: () {
        controller.toggleIcon(index); // Toggle the state for the clicked item

        // Navigation logic based on index
        if (index == 1) {
          // Navigate to D1CM6 when "My Transactions" is clicked
          Get.toNamed('/d1cm6');
        }
      },
      child: Obx(() {
        String iconPath =
            controller.getIconPath(index); // Get icon path from the controller

        return Container(
          width: itemWidth,
          height: itemHeight,
          decoration: BoxDecoration(
            color: const Color(0xFF2F5B6C),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: itemWidth * 0.5, // Scale icon size based on item width
                height:
                    itemHeight * 0.7, // Scale icon size based on item height
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  iconPath, // Use the correct icon path from the controller
                  width: 16,
                  height: 16,
                  color: controller.isEnabled[index]
                      ? const Color.fromARGB(255, 255, 255,
                          255) // Change color to white when active
                      : Colors.grey, // Locked state color
                ),
              ),
              const SizedBox(height: 2),
              Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 8,
                  height: 1.5,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }),
    );
  }
}
