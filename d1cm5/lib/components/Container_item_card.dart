import 'package:d1cm5/controllers/container_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget dropdownContent(List<String> timeFilters) {
  final DropdownController controller = Get.put(DropdownController());

  return Obx(() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        for (var filter in controller.timeFilters)
          GestureDetector(
            onTap: () {
              controller.highlightFilter(filter);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: controller.getColorProperty(filter),
                    width: 0.5,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(minHeight: 109),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: controller.getBackgroundColor(filter),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.getColorFilter(filter),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    controller.getSvgIcon(filter),
                                    width: 12, // Adjusted for better visibility
                                    height: 12,
                                    colorFilter: ColorFilter.mode(
                                      controller.getSvgIconColor(filter),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                filter,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: controller.getNameColor(filter),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                width: 2,
                                height: 2,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'Time',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/Vector.svg',
                            width: 2,
                            height: 12,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Title Of The Notification",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Description of the notification",
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: controller.getCta1Color(filter),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  'CTA1',
                                  style: TextStyle(
                                    color: filter == 'Alert'
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: const Text(
                                  'CTA2',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            controller.getReadState(filter),
                            style: TextStyle(
                              color: controller.getReadState(filter) == 'read'
                                  ? Colors.blue
                                  : const Color.fromRGBO(184, 254, 34, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  });
}
