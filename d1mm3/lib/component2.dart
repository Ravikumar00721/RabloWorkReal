import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Container 1 which contains 4 icons
class Component2 extends StatefulWidget {
  const Component2({super.key});

  @override
  _Component2State createState() => _Component2State();
}

class _Component2State extends State<Component2> {
  List<bool> isEnabled = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    // Get the device's width
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: deviceWidth * 0.9, // 90% of the screen width
      height: deviceHeight * 0.1, // 10% of the screen height
      decoration: BoxDecoration(
        color: const Color(0xFF2F5B6C),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildItem(
              index: 0,
              icon: 'assets/locked.svg',
              text: 'Membership',
            ),
            _buildItem(
              index: 1,
              icon: 'assets/locked.svg',
              text: 'Trainers',
            ),
            _buildItem(
              index: 2,
              icon: 'assets/exchange.svg',
              text: 'My Transactions',
            ),
            _buildItem(
              index: 3,
              icon: 'assets/headphone.svg',
              text: 'Support',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({required int index, required String icon, required String text}) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          isEnabled[index] = !isEnabled[index];
        });
      },
      child: Container(
        width: deviceWidth * 0.2, // Each item takes 20% of the screen width
        height: 46,
        decoration: BoxDecoration(
          color: const Color(0xFF2F5B6C),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(
                icon,
                width: 16,
                height: 16,
                color: isEnabled[index] ? Colors.white : Colors.grey,
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
      ),
    );
  }
}
