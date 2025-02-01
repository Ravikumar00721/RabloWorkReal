import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class QRScreenController extends GetxController {}

class QrScanning extends StatelessWidget {
  final QRScreenController controller = Get.put(QRScreenController());

  QrScanning({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final qrContainerHeight = screenHeight * 0.6;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(
                        'assets/images/gym_app_background.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      const Color(0xFF063434).withOpacity(0.8),
                      BlendMode.srcOver,
                    ),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      // Header Section
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Row(
                                children: [
                                  Icon(Icons.arrow_back, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text(
                                    "Scan & Connect",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                _NotificationButton(),
                                const SizedBox(width: 16),
                                const VerticalDots(),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Main Content
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            const ScanConnectHeader(),
                            const SizedBox(height: 20),
                            const ActionButtonsRow(),
                            const SizedBox(height: 20),
                            QRInputSection(
                                qrContainerHeight: qrContainerHeight),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: 'Scan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
      currentIndex: 1,
      selectedItemColor: Colors.lime,
      unselectedItemColor: Colors.grey,
      backgroundColor: const Color(0xFF063434),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    );
  }
}

class QRInputSection extends StatefulWidget {
  final double qrContainerHeight;

  const QRInputSection({super.key, required this.qrContainerHeight});

  @override
  _QRInputSectionState createState() => _QRInputSectionState();
}

class _QRInputSectionState extends State<QRInputSection> {
  Color _qrColor = const Color.fromRGBO(
      85, 166, 196, 0.5); // Default color of the QR area (black)

  // Method to change the color when tapped
  void _toggleQRCodeColor() {
    setState(() {
      _qrColor = _qrColor == Colors.transparent
          ? const Color.fromRGBO(85, 166, 196, 0.5)
          : Colors.transparent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: GestureDetector(
          onTap: _toggleQRCodeColor, // Detect tap to toggle QR color
          child: Container(
            width: double.infinity,
            height: 550,
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
            decoration: BoxDecoration(
              color: const Color(0xFF55A6C4).withOpacity(0.3),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Stack(
                  children: [
                    // QR Container (this part will turn transparent)
                    Container(
                      width: 275,
                      height: 275,
                      decoration: BoxDecoration(
                        color: _qrColor, // The color will change dynamically
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    // Top Left corner
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                          ),
                          border: Border(
                            top: BorderSide(color: Colors.lightBlue, width: 8),
                            left: BorderSide(color: Colors.lightBlue, width: 8),
                          ),
                        ),
                      ),
                    ),
                    // Top Right corner
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                          ),
                          border: Border(
                            top: BorderSide(color: Colors.lightBlue, width: 8),
                            right:
                                BorderSide(color: Colors.lightBlue, width: 8),
                          ),
                        ),
                      ),
                    ),
                    // Bottom Left corner
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                          ),
                          border: Border(
                            bottom:
                                BorderSide(color: Colors.lightBlue, width: 8),
                            left: BorderSide(color: Colors.lightBlue, width: 8),
                          ),
                        ),
                      ),
                    ),
                    // Bottom Right corner
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                          ),
                          border: Border(
                            bottom:
                                BorderSide(color: Colors.lightBlue, width: 8),
                            right:
                                BorderSide(color: Colors.lightBlue, width: 8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PinInputField extends StatelessWidget {
  const PinInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      defaultPinTheme: PinTheme(
        width: 33,
        height: 34,
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white70),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 33,
        height: 34,
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 1),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(4)),
        ),
      ),
      onCompleted: (pin) => print("Completed: $pin"),
    );
  }
}

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Left line with reduced width
        SizedBox(
          width: 60, // Reduced from expanded to fixed width
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color.fromRGBO(153, 153, 153, 1),
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'OR',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Right line with reduced width
        SizedBox(
          width: 60, // Reduced from expanded to fixed width
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color.fromRGBO(153, 153, 153, 1),
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ScanConnectHeader extends StatelessWidget {
  const ScanConnectHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Scan ",
                style: TextStyle(
                  fontFamily: 'Barlow_Semi_Condensed',
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  height: 48 / 40,
                  color: Colors.lime,
                ),
              ),
              TextSpan(
                text: "& ",
                style: TextStyle(
                  fontFamily: 'Barlow_Semi_Condensed',
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  height: 48 / 40,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: "Connect",
                style: TextStyle(
                  fontFamily: 'Barlow_Semi_Condensed',
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  height: 48 / 40,
                  color: Colors.lime,
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white.withOpacity(0.7),
          thickness: 1,
          height: 20,
          indent: 4,
          endIndent: 4,
        ),
        const SizedBox(height: 8),
        const Text(
          "Scan the QR code or enter the PIN Manually.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 21 / 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}

// Rest of the code remains the same as original (ActionButtonsRow, ActionButton,
// VerticalDots, _NotificationButton, etc.)

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(
          icon: 'assets/images/upload.png',
          text1: "Share Your\n",
          text2: "QR or PIN",
        ),
        ActionButton(
          icon: 'assets/images/scan.png',
          text1: "Ask to Scan\n",
          text2: "QR or PIN",
        ),
        ActionButton(
          icon: 'assets/images/user_check.png',
          text1: "Check Your\n",
          text2: "Check-Ins",
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final String icon;
  final String text1;
  final String text2;

  const ActionButton({
    super.key,
    required this.icon,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon, width: 17.78, height: 16),
        Container(
            width: 2,
            height: 20,
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 8)),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: text1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 15 / 10,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: text2,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 15 / 10,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class VerticalDots extends StatelessWidget {
  const VerticalDots({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle, size: 4, color: Colors.white),
        SizedBox(height: 4),
        Icon(Icons.circle, size: 4, color: Colors.white),
        SizedBox(height: 4),
        Icon(Icons.circle, size: 4, color: Colors.white),
      ],
    );
  }
}

class _NotificationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
        ),
        const Icon(Icons.notifications_none, size: 24, color: Colors.white),
        Positioned(
          top: 1,
          left: 16,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Text(
              '4',
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
