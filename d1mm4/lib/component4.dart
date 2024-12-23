import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Component4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10), // Gap between containers
        Container(
          width: 344,
          height: 72,
          decoration: BoxDecoration(
            color: const Color(0x1AFFFFFF),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white, width: 2),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SvgPicture.asset(
              'assets/locked.svg',
              width: 24,
              height: 24,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8), // Additional gap
      ],
    );
  }
}
