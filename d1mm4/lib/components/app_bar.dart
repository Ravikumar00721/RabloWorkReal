import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double deviceWidth;
  final double deviceHeight;

  const CustomAppBar({
    Key? key,
    required this.deviceWidth,
    required this.deviceHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: deviceHeight * (20 / 800),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: deviceWidth * (22 / 360),
                      right: deviceWidth * (20 / 360)),
                  child: InkWell(
                    child: Image.asset(
                      'assets/girl.png',
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: deviceHeight * (25 / 800)),
                  child: const Text(
                    'My Plan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                      top: deviceHeight * (25 / 800),
                      bottom: deviceHeight * (25 / 800),
                      right: deviceWidth * (20 / 360)),
                  child: InkWell(
                    child: Image.asset('assets/Frame.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: deviceHeight * (25 / 800),
                      bottom: deviceHeight * (25 / 800),
                      right: deviceWidth * (25 / 360)),
                  child: InkWell(
                    child: Image.asset(
                      'assets/Vector.png',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
