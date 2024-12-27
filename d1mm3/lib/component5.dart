import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//Bottom Bar
class Component5 extends StatelessWidget {
  const Component5({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            width: 304,
            height: 2,
            decoration: BoxDecoration(
              color: const Color(0xFF2F5B6C),
              border: Border.all(
                color: const Color(0xFF2F5B6C),
                width: 2,
              ),
            ),
          ),
          const SizedBox(height: 45),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 280,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF2F5B6C),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/homeyes.svg',
                      width: 24,
                      height: 24,
                      color: const Color.fromRGBO(184, 254, 34, 1),
                    ),
                    const SizedBox(width: 24),
                    SvgPicture.asset(
                      'assets/personno.svg',
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -20,
                left: 120,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF2F5B6C),
                      width: 3,
                    ),
                    color: const Color(0xFF063434),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icon.svg',
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
