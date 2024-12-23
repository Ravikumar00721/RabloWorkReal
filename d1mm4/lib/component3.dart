import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Component3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          width: 344, // Width of the divider
          height: 2, // Height of the divider (just a line)
          decoration: BoxDecoration(
            color: const Color(0xFF2F5B6C), // Primary Blue (Dark) color
            border: Border.all(
              color: const Color(0xFF2F5B6C), // Border color
              width: 2, // Border width
            ),
          ),
        ),
        const SizedBox(height: 30), // Gap between containers

        Container(
          width: 344,
          height: 119,
          decoration: BoxDecoration(
            color: const Color.fromARGB(0, 85, 166, 196),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: const Color(0x1AFFFFFF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF666666), // Dashed border color
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/locked.svg',
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color: const Color(0x1AFFFFFF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF666666), // Dashed border color
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/locked.svg',
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
