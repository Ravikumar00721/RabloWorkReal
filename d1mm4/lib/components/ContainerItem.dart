import 'package:d1mm4/components/Container_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      alignment: Alignment.topCenter, // Ensure alignment to top
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(), // Enable scrolling
        itemCount: timeFilters.length,
        padding: EdgeInsets.zero, // Remove extra padding
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _isDropdownOpen[index] = !_isDropdownOpen[index];
              });
            },
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Align to start
                mainAxisAlignment:
                    MainAxisAlignment.start, // Align items to start
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
                  const Spacer(), // Push the arrow to the right
                  Padding(
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
                ],
              ),
              subtitle: _isDropdownOpen[index]
                  ? dropdownContent(timeFilters) // Provide dropdown content
                  : null,
            ),
          );
        },
      ),
    );
  }
}
