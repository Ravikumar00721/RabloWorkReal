import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Component2 extends StatefulWidget {
  const Component2({Key? key}) : super(key: key);

  @override
  _Component2State createState() => _Component2State();
}

class _Component2State extends State<Component2> {
  List<bool> isEnabled = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: 78,
      decoration: BoxDecoration(
        color: const Color(0xFF2F5B6C),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 328,
        height: 46,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildItem(
                index: 0,
                icon: 'assets/locked.svg',
                text: 'My Website',
              ),
              _buildItem(
                index: 1,
                icon: 'assets/exchange.svg',
                text: 'My Transactions',
              ),
              _buildItem(
                index: 2,
                icon: 'assets/locked.svg',
                text: 'Membership',
              ),
              _buildItem(
                index: 3,
                icon: 'assets/locked.svg',
                text: 'Members',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem({required int index, required String icon, required String text}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEnabled[index] = !isEnabled[index];
        });
      },
      child: Container(
        width: 70,
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
