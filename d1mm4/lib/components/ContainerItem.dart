import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Container_item_card.dart';

class TimeFilters extends StatefulWidget {
  const TimeFilters({super.key});

  @override
  _TimeFiltersState createState() => _TimeFiltersState();
}

class _TimeFiltersState extends State<TimeFilters> {
  final List<String> timeFilters = const [
    "Today",
    "Yesterday",
    "This Week",
    "This Month",
    "Last Month",
    "Last Time Ago",
  ];

  List<bool> _isDropdownOpen = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        itemCount: timeFilters.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    timeFilters[index],
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isDropdownOpen[index] = !_isDropdownOpen[index];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SvgPicture.asset(
                      _isDropdownOpen[index]
                          ? 'assets/Uparrow.svg'
                          : 'assets/downarrow.svg',
                      color: Colors.white,
                      width: 5,
                      height: 7,
                    ),
                  ),
                ),
              ],
            ),
            subtitle: _isDropdownOpen[index]
                ? dropdownContent(
                    timeFilters[index]) // Use the dropdown content function
                : null,
          );
        },
      ),
    );
  }
}
