import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Component2 extends StatelessWidget {
  const Component2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344, // Outer container width
      height: 78, // Outer container height
      decoration: BoxDecoration(
        color: const Color(0xFF2F5B6C), // Dark Primary Blue background color
        borderRadius: BorderRadius.circular(15), // Rounded corners with 15px radius
      ),
      child: Container(
        width: 328, // Inner container width
        height: 46, // Inner container height
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Item 1
              _buildItem(
                icon: 'assets/locked.svg',
                text: 'My Website',
              ),
              // Item 2
              _buildItem(
                icon: 'assets/exchange.svg',
                text: 'My Transactions',
              ),
              // Item 3
              _buildItem(
                icon: 'assets/locked.svg',
                text: 'Membership',
              ),
              // Item 4
              _buildItem(
                icon: 'assets/locked.svg',
                text: 'Members',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem({required String icon, required String text}) {
    return Container(
      width: 70, // Width for each icon and text container
      height: 46, // Height
      decoration: BoxDecoration(
        color: const Color(0xFF2F5B6C), // Dark Primary Blue background color
        borderRadius: BorderRadius.circular(8), // Border radius
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 32, // Width for the icon container
            height: 32, // Height of the icon container
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1), // Icon background color
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              icon,
              width: 16, // Icon width
              height: 16, // Icon height
              color: Colors.white, // Icon color
            ),
          ),
          const SizedBox(height: 2), // Gap between icon and text
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Poppins', // Font family
              fontWeight: FontWeight.w500, // Font weight
              fontSize: 8, // Font size
              height: 1.5, // Line height
              color: Colors.white, // Text color
              decoration: TextDecoration.none, // Text decoration (no underline)
            ),
            textAlign: TextAlign.center, // Text alignment to center
          ),
        ],
      ),
    );
  }
}
